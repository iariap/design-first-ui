---
description: "Verify global system artifacts exist and are complete"
alwaysApply: false
---

# Command: validate-system

Validate that the global system artifacts exist and are consistent.

## Inputs

- Optional root directory (default: `design/system/`)

## Checks

- `01_canvas_system.md` exists
- `02_ui_tokens.md` exists
- `02a_navigation_map.md` exists
- Token categories match the canvas constraints
- No project-specific overrides are embedded in the global system
- Navigation map includes every navigable use case

## Output

- Report missing files
- Report incomplete or inconsistent sections
