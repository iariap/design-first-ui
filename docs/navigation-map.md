# Navigation Map

The navigation map defines the global flow between screens.

## Purpose

- Make screen relationships explicit
- Validate flows before screen work begins
- Prevent missing or inconsistent routes

## Required elements

- Nodes: screens or states
- Edges: navigation actions and conditions
- Entry points and exits
- Authenticated vs unauthenticated flows

## Output format

- `02a_navigation_map.md` (text description)
- `02a_navigation_map.mmd` (Mermaid source)

## Diagram standard

- Use Mermaid flowcharts.
- Use color to encode meaning (e.g., auth, public, errors).
- Colors must meet WCAG contrast standards against the background.
