---
description: "Create the global system artifacts (01/02/02a) before screens"
alwaysApply: false
---

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
- Every navigable use case (including error, empty, and edge flows)
- Mermaid flowchart in a fenced code block (e.g. ` ```mermaid `) inside this file only. Do **not** create `02a_navigation_map.mmd` or any separate file for the diagram.

## Notes

- These files are global and authoritative.
- Screens inherit the system; they do not redefine it.
