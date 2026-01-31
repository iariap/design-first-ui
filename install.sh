#!/bin/sh
set -eu

REPO="iariap/design-first-ui"
HOST_DEFAULT="https://github.com/${REPO}/releases/download"
ASSET_PREFIX="design-first-ui-bundle-"
TARGET_DIR=".agent"
VERSION=""
UPDATE=0
FORCE=0
UNINSTALL=0
HOST="$HOST_DEFAULT"

usage() {
  cat <<'EOF'
Usage: install.sh [options]

Options:
  --version vX.Y.Z   Install a specific version
  --dir PATH         Target install directory (default: .design-first-ui)
  --update           Reinstall over existing bundle
  --force            Overwrite without prompt
  --uninstall         Remove installed bundle
  --host URL         Override release host
  --help             Show this help
EOF
}

fail() {
  echo "Error: $1" >&2
  exit 1
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || fail "Missing required command: $1"
}

checksum_file() {
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$1" | awk '{print $1}'
    return
  fi
  if command -v shasum >/dev/null 2>&1; then
    shasum -a 256 "$1" | awk '{print $1}'
    return
  fi
  echo "unknown"
}

latest_version() {
  need_cmd curl
  curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" \
    | sed -n 's/.*"tag_name": "\([^"]*\)".*/\1/p'
}

parse_args() {
  while [ $# -gt 0 ]; do
    case "$1" in
      --version)
        [ $# -gt 1 ] || fail "--version requires a value"
        VERSION="$2"
        shift 2
        ;;
      --dir)
        [ $# -gt 1 ] || fail "--dir requires a value"
        TARGET_DIR="$2"
        shift 2
        ;;
      --update)
        UPDATE=1
        shift 1
        ;;
      --force)
        FORCE=1
        shift 1
        ;;
      --uninstall)
        UNINSTALL=1
        shift 1
        ;;
      --host)
        [ $# -gt 1 ] || fail "--host requires a value"
        HOST="$2"
        shift 2
        ;;
      --help|-h)
        usage
        exit 0
        ;;
      *)
        fail "Unknown option: $1"
        ;;
    esac
  done
}

read_lock_files() {
  LOCK_FILE="$TARGET_DIR/.lock"
  [ -f "$LOCK_FILE" ] || return 1
  awk 'found && $0 != "" {print}' "$LOCK_FILE"
}

do_uninstall() {
  LOCK_FILE="$TARGET_DIR/.lock"
  if [ ! -f "$LOCK_FILE" ]; then
    if [ "$FORCE" -eq 1 ]; then
      rm -rf "$TARGET_DIR"
      return 0
    fi
    fail "No lock file found at $LOCK_FILE"
  fi

  FILES=$(awk 'found {print} /^files:$/ {found=1}' "$LOCK_FILE" | awk 'NF')
  if [ -n "$FILES" ]; then
    echo "$FILES" | while IFS= read -r relpath; do
      rm -f "$TARGET_DIR/$relpath"
    done
  fi

  rm -f "$LOCK_FILE"
  find "$TARGET_DIR" -type d -empty -delete 2>/dev/null || true

  if [ -d "$TARGET_DIR" ] && [ -z "$(ls -A "$TARGET_DIR" 2>/dev/null)" ]; then
    rmdir "$TARGET_DIR" 2>/dev/null || true
  fi
}

do_install() {
  need_cmd tar

  if [ -z "$VERSION" ]; then
    VERSION=$(latest_version)
    [ -n "$VERSION" ] || fail "Unable to determine latest version"
  fi

  case "$VERSION" in
    v*) ;; 
    *) VERSION="v$VERSION" ;;
  esac

  if [ -d "$TARGET_DIR" ] && [ "$UPDATE" -eq 0 ] && [ "$FORCE" -eq 0 ]; then
    fail "Target directory exists. Use --update or --force."
  fi

  if [ "$UPDATE" -eq 1 ]; then
    do_uninstall
  fi

  ARCHIVE_NAME="${ASSET_PREFIX}${VERSION}.tar.gz"
  DOWNLOAD_URL="${HOST}/${VERSION}/${ARCHIVE_NAME}"

  TMPDIR=$(mktemp -d)
  ARCHIVE_PATH="$TMPDIR/$ARCHIVE_NAME"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL -o "$ARCHIVE_PATH" "$DOWNLOAD_URL"
  elif command -v wget >/dev/null 2>&1; then
    wget -q -O "$ARCHIVE_PATH" "$DOWNLOAD_URL"
  else
    fail "curl or wget is required"
  fi

  mkdir -p "$TARGET_DIR"
  tar -xzf "$ARCHIVE_PATH" -C "$TMPDIR"

  for dir in rules commands skills docs; do
    if [ -d "$TMPDIR/$dir" ]; then
      rm -rf "$TARGET_DIR/$dir"
      cp -R "$TMPDIR/$dir" "$TARGET_DIR/"
    else
      fail "Missing $dir in release archive"
    fi
  done

  CHECKSUM=$(checksum_file "$ARCHIVE_PATH")
  INSTALLED_AT=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  FILE_LIST=$(tar -tzf "$ARCHIVE_PATH" | awk 'NF && $0 !~ /\/$/')

  LOCK_FILE="$TARGET_DIR/.lock"
  {
    echo "version=$VERSION"
    echo "checksum=$CHECKSUM"
    echo "installed_at=$INSTALLED_AT"
    echo "files:"
    echo "$FILE_LIST"
  } > "$LOCK_FILE"

  rm -rf "$TMPDIR"

  echo "Installed design-first-ui bundle to $TARGET_DIR"
}

main() {
  parse_args "$@"

  if [ "$UNINSTALL" -eq 1 ]; then
    do_uninstall
    echo "Uninstalled design-first-ui bundle from $TARGET_DIR"
    exit 0
  fi

  do_install
}

main "$@"
