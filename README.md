# Design-First UI Bundle

Design-first UI process packaged as IDE-agnostic skills, commands, rules, and docs.

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/iariap/design-first-ui/main/install.sh | sh
```

### Pin a version

```sh
curl -fsSL https://raw.githubusercontent.com/iariap/design-first-ui/main/install.sh | sh -s -- --version v0.1.0
```

### Custom install directory

```sh
curl -fsSL https://raw.githubusercontent.com/iariap/design-first-ui/main/install.sh | sh -s -- --dir .design-first-ui
```

### Update

```sh
curl -fsSL https://raw.githubusercontent.com/iariap/design-first-ui/main/install.sh | sh -s -- --update
```

### Uninstall

```sh
curl -fsSL https://raw.githubusercontent.com/iariap/design-first-ui/main/install.sh | sh -s -- --uninstall
```

## Installed layout

```
.design-first-ui/
  rules/
  commands/
  skills/
  docs/
  .lock
```

## What this bundle provides

- Rules to enforce the design-first workflow
- Commands to scaffold and validate screens
- Skills to guide each step in the workflow
- Docs that define the system, tokens, and QA bar

## Release artifacts

Releases contain only the installable folders: `rules/`, `commands/`, `skills/`, `docs/`.
