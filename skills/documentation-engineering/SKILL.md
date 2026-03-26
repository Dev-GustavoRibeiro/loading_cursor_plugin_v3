---
name: documentation-engineering
description: Produce and maintain professional project documentation—requirements, NFRs, doc hub, mind maps (Mermaid), ADRs, runbooks—with EN + PT companion blocks for every deliverable.
---

# Documentation engineering

## When to use

- Starting or restructuring `docs/` for any product or internal tool
- Before major releases: refresh architecture, risks, and operator notes
- When stakeholders need **functional** and **non-functional** requirements in a reviewable format
- When the team is mixed EN/PT and needs the same truth in both languages

## Required outputs (pick what fits the task)

Use the templates in `templates/`:

- `documentation-hub.md` — index of all docs + owners + freshness policy
- `functional-requirements.md` — capabilities, user stories, acceptance criteria
- `nonfunctional-requirements.md` — performance, security, reliability, compliance
- `mind-map-outline.md` — conceptual map + optional Mermaid `mindmap`
- Existing: `architecture-rfc.md`, `handoff.md`, `security-review.md`

## Bilingual convention

For every **substantive** documentation file the user will publish under `docs/` or `README.md`:

1. Write the **primary body in English** (technical standard).
2. After each major section (or the whole doc if short), add:

```markdown
**PT — (comentário / tradução)**  
<Portuguese explanation or full translation of that section>
```

3. Keep terminology consistent: first mention EN term, then PT gloss in parentheses if helpful.

## Workflow

1. Inventory what already exists; avoid duplicate sources of truth.
2. Agree doc audience (exec, engineer, operator, compliance).
3. Draft structure → fill English → add PT blocks → link from hub.
4. Cross-check requirements against acceptance tests or QA plans when they exist.

## Quality bar

- Traceability: each FR links to acceptance criteria or test idea
- NFRs are measurable (numbers, SLOs, thresholds) where possible
- No orphan pages: everything reachable from the hub
- Dates and owners on living documents

## Handoff

- Implementation alignment → `api-contract-designer`, `frontend-architecture-lead`, or `backend-systems-architect`
- Security-sensitive NFRs → `security-architect`
- Release notes → `devops-release-engineer`
