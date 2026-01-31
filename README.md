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
- Commands to scaffold and validate global artifacts (01/02)
- Command to classify change requests (prevent patching the final mock)
- Skills to guide each step in the workflow
- Docs that define the system, tokens, and QA bar

## Process summary

- Global artifacts (required before screens): `01_canvas_system.md`, `02_ui_tokens.md`, `02a_navigation_map.md`
- Screen workflow (in order): `03_structure.md`, `04_wireframe.md`, `05_canvas_applied.md`, `06_ui_mock.md`

## Change classification

- Classify every change request before edits.
- Fix the earliest upstream artifact that caused the issue.
- Propagate the fix downstream through every dependent step to keep all artifacts consistent.
- This should be transparent for the user: describe the issue, the system handles the rest.

## Full process

### 1) Define the system (global, required)

- Create `01_canvas_system.md` (layout constraints, grid, breakpoints)
- Create `02_ui_tokens.md` (spacing, typography, color, etc.)
- Create `02a_navigation_map.md` (screen flow and relationships)
- These are authoritative; screens inherit them

Suggested commands:

- `commands/create-system.md`
- `commands/validate-system.md`
- `commands/render-navigation-svg.md`

Suggested skills:

- `skills/design-first.canvas-system.md`
- `skills/design-first.tokens.md`
- `skills/design-first.navigation-map.md`

### 2) Build each screen (in order)

1. `03_structure.md` — intent, hierarchy, and content blocks
2. `04_wireframe.md` — layout only, no visuals
3. `05_canvas_applied.md` — map layout to the canvas system
4. `06_ui_mock.md` — final visual description using tokens only

Suggested commands:

- `commands/create-screen.md`
- `commands/validate-screen.md`

Suggested skills:

- `skills/design-first.structure.md`
- `skills/design-first.wireframe.md`
- `skills/design-first.canvas-applied.md`
- `skills/design-first.ui-mock.md`

### 3) Classify every change request

- Classification and propagation are internal steps.
- The user only needs to describe the problem or desired change.

## Example flow (LLM interaction)

Use this flow to keep the system consistent and avoid manual patches.

### A) Start a new screen

1. > scaffold screen files
2. > fill each step in order

Example prompts (plain language):

- "Scaffold the screen files for checkout under design/screens/checkout/"
- "Write 03_structure.md for checkout"
- "Write 04_wireframe.md for checkout"
- "Write 05_canvas_applied.md for checkout"
- "Write 06_ui_mock.md for checkout"

### B) Fix a layout issue (overlap)

1. > describe the issue
2. > system classifies and fixes upstream
3. > system propagates downstream updates

Example prompts (plain language):

- "Classify this issue: buttons overlap on mobile"
- "Update 04_wireframe.md to resolve the overlap"
- "Propagate updates to 05_canvas_applied.md and 06_ui_mock.md"

### C) Adjust the spacing scale

1. > describe the change
2. > system updates tokens
3. > system propagates downstream across screens

Example prompts (plain language):

- "Classify this change: increase base spacing from 4px to 5px"
- "Update 02_ui_tokens.md and summarize impact"
- "Propagate token changes to all affected screens' 05_canvas_applied.md and 06_ui_mock.md"

## Release artifacts

Releases contain only the installable folders: `rules/`, `commands/`, `skills/`, `docs/`.
