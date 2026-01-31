# Canvas System

The canvas system defines the structural constraints of the UI. It is the foundation for all screens.

## What the canvas defines

- Base spacing unit
- Grid system (columns, gutters, gaps)
- Container width and padding
- Layout regions and alignment
- Breakpoints and responsive behavior

## Required fields (template)

- Base unit: <value>
- Container max width: <value>
- Container padding: <value>
- Grid columns: <value>
- Grid gutter: <value>
- Grid gap: <value>
- Breakpoints: <list>
- Alignment rules: <list>
- Density rules: <list>

## Guidance

- The canvas is structural, not decorative.
- All layout decisions in screens must map to this system.
- If a layout does not fit the canvas, revise the structure or the canvas upstream.
