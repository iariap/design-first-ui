# Command: create-system

Scaffold the global artifacts required before any screen work.

## Inputs

- Optional root directory (default: `design/system/`)

## Output

Create the global artifacts:

```
design/system/
  01_canvas_system.md
  02_ui_tokens.md
```

## File templates

### 01_canvas_system.md

- Base unit
- Container width and padding
- Grid columns, gutters, gaps
- Breakpoints
- Alignment and density rules

### 02_ui_tokens.md

- Spacing scale
- Stroke and border
- Radius
- Typography
- Color
- Layout
- Animation
- Z-index

## Notes

- These files are global and authoritative.
- Screens inherit the system; they do not redefine it.
