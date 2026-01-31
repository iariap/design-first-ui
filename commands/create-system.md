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
  02a_navigation_map.md
  02a_navigation_map.mmd
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

### 02a_navigation_map.md

- Global screen list
- Flow connections
- Authenticated vs unauthenticated paths

### 02a_navigation_map.mmd

- Mermaid flowchart source
- Uses WCAG-compliant colors

## Notes

- These files are global and authoritative.
- Screens inherit the system; they do not redefine it.
