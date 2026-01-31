# Command: validate-system

Validate that the global system artifacts exist and are consistent.

## Inputs

- Optional root directory (default: `design/system/`)

## Checks

- `01_canvas_system.md` exists
- `02_ui_tokens.md` exists
- Token categories match the canvas constraints
- No project-specific overrides are embedded in the global system

## Output

- Report missing files
- Report incomplete or inconsistent sections
