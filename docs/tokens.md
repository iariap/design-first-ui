# Design Tokens

Tokens are the single source of truth for values used in UI implementation.

## Token philosophy

- Consistency over creativity
- Reduction is improvement
- No arbitrary values
- Tokens represent reusable, structural decisions

## Required categories

- Spacing
- Stroke and border
- Radius
- Typography
- Color
- Layout
- Animation
- Z-index

## Naming conventions

- `category-variant-level`
- Examples: `space-m`, `color-text-primary`, `radius-l`

## Example token set (illustrative)

```
space-xs: 4px
space-s: 8px
space-m: 16px
radius-s: 4px
radius-m: 8px
font-size-m: 16px
color-bg: #ffffff
color-text-primary: #111111
```

## Rules

- Use tokens only. No hardcoded values.
- Token values must follow the base unit system.
- Tokens should be reusable across components.
- Avoid one-off tokens.

## Figma to code

- Tokens should map directly to Figma styles and variables.
- Use a standard token format (W3C or Tokens Studio JSON).
- Generate CSS variables or platform-specific outputs from the same source.
