# Command: create-screen

Scaffold the required files for a new screen following the design-first workflow.

## Inputs

- Screen name (slug, e.g., `checkout`, `profile_edit`)
- Optional root directory (default: `design/screens/`)

## Output

Create a new folder:

```
design/screens/<screen>/
  03_structure.md
  04_wireframe.md
  05_canvas_applied.md
  06_ui_mock.md
```

## File templates

### 03_structure.md

- Screen purpose
- User goal
- Information hierarchy
- Key constraints from the system

### 04_wireframe.md

- Low-fidelity layout only
- No visual styling
- No colors or typography decisions

### 05_canvas_applied.md

- Apply the global canvas system
- No layout changes
- Map structure to the canvas

### 06_ui_mock.md

- Static UI mock description
- Token-constrained
- Implementable without interpretation

## Notes

- Ensure `01_canvas_system.md` and `02_ui_tokens.md` exist before scaffolding screens.
- Do not define tokens inside screen files.
