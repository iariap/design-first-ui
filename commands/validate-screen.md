# Command: validate-screen

Validate that a screen follows the design-first workflow and system constraints.

## Inputs

- Screen name (slug)
- Optional root directory (default: `design/screens/`)

## Checks

- All required files exist:
  - `03_structure.md`
  - `04_wireframe.md`
  - `05_canvas_applied.md`
  - `06_ui_mock.md`
- Global system artifacts exist:
  - `.design-first-ui/docs/canvas.md`
  - `.design-first-ui/docs/tokens.md`
  - `.design-first-ui/docs/process.md`
- No step was skipped (structure -> wireframe -> canvas -> mock)
- Final mock uses tokens only
- No system redefinition inside screen files

## Output

- Report missing files
- Report order violations
- Report token or system violations
