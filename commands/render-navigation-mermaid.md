# Command: render-navigation-mermaid

Generate a navigation map diagram from `02a_navigation_map.md` using Mermaid.

## Inputs

- `02a_navigation_map.md`

## Output

- `02a_navigation_map.mmd`

## Notes

- Keep the diagram simple and readable.
- Use a consistent node style for screens.
- Show main flows and conditional branches.
- Use Mermaid classes with color styles that meet WCAG contrast.
- Prefer solid fills with high-contrast text.

## Mermaid example

```mermaid
flowchart TD
  classDef public fill:#E6F2FF,stroke:#0B4F6C,color:#0B4F6C
  classDef auth fill:#E9F7EF,stroke:#1E7F4B,color:#1E7F4B
  classDef error fill:#FDECEC,stroke:#A61B1B,color:#A61B1B

  Start([Start]):::public
  Login[Login]:::public
  Home[Home]:::auth
  Error[Error]:::error

  Start --> Login
  Login --> Home
  Home --> Error
```
