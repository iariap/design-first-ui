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
- Every navigable use case (including error, empty, and edge flows)

## Output format

- **Single file:** `02a_navigation_map.md` (text description and Mermaid diagram).
- Do **not** create `02a_navigation_map.mmd` or any separate Mermaid source file; embed the diagram in the markdown in a fenced code block (e.g. ` ```mermaid `).

## Diagram standard

- Use Mermaid flowcharts inside the markdown file.
- Use color to encode meaning (e.g., auth, public, errors).
- Colors must meet WCAG contrast standards against the background.
- Use `<br/>` for line breaks inside edge labels (Mermaid does not accept `\n`).
- If a node has multiple self-loop edges, add a comment node to disambiguate labels and ensure all transitions are visible.
