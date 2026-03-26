# Quick start prompts

Copy-paste into Cursor chat. Agents are defined in `agents/` (English prompts).

**PT —** Copia para o chat do Cursor. Os agentes estão em `agents/` (prompts em inglês para melhor desempenho do modelo).

---

## Bootstrap a new project

```
Use the project-bootstrap skill. Run discovery, then create docs/project-brief.md, docs/page-map.md, docs/architecture-rfc.md, docs/README.md (hub), lock palette in config/project-palette.json and config/project-style-contract.json.
```

**PT —** Arranque de projeto: discovery, brief, mapa de páginas, RFC, índice em `docs/README.md`, paleta em JSON.

---

## Documentation + requirements (FR / NFR + mind map)

```
Act as software-documentation-engineer. Create docs/README.md from templates/documentation-hub.md, then docs/functional-requirements.md and docs/nonfunctional-requirements.md with EN + PT — blocks after each major section. Add docs/mind-map-product.md using templates/mind-map-outline.md.
```

**PT —** Documentação profissional: hub, requisitos funcionais e não funcionais, mapa mental, tudo com blocos **PT —** por secção.

---

## Landing page

```
Act as landing-page-conversion-architect. Propose section order and copy outline first, then hand off to web-design-director for visual rules, then frontend-architecture-lead for implementation plan.
```

**PT —** Landing: primeiro estratégia de secções e texto, depois direção visual, depois plano de implementação.

---

## SaaS with Supabase

```
Act as supabase-platform-specialist and backend-systems-architect. Propose schema, auth model, and RLS strategy. Then act as frontend-architecture-lead for client data access patterns. Do not skip security-architect for multi-tenant sensitive data.
```

**PT —** SaaS Supabase: esquema, auth, RLS, frontend e revisão de segurança se multi-tenant.

---

## Figma implementation

```
Use the figma-handoff skill, then act as figma-design-handoff-specialist for the linked file. Map components to the codebase and list implementation tasks.
```

**PT —** Figma: handoff estruturado para componentes e tarefas.

---

## Production bug hunt

```
Act as observability-debugging-specialist. Correlate Sentry issues with releases; propose the smallest safe fix; involve qa-performance-accessibility-lead if user-facing regression.
```

**PT —** Produção: triagem Sentry, correção mínima segura, QA se afetar utilizadores.

---

## Full delivery orchestration

```
Act as end-to-end-orchestrator. Given this roadmap, sequence project-discovery-strategist, software-documentation-engineer, specialist engineers, qa-performance-accessibility-lead, and devops-release-engineer. Output a checklist with artifacts per phase.
```

**PT —** Orquestração: ordem das fases e artefactos por fase.
