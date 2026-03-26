# Bilingual documentation convention (EN + PT)

This repository standardizes **how** we write documentation for projects that use this plugin.

## Rule (summary)

- **Primary technical prose: English** (wider tooling compatibility, shared engineering vocabulary).
- After **each major section** (or the whole file if it is short), add:

```markdown
**PT — (comentário / tradução)**  
<Portuguese text: faithful summary or full translation>
```

**PT —** Regra: texto técnico principal em **inglês**; depois de cada secção principal, um bloco **PT —** com resumo ou tradução fiel para equipas lusófonas.

## Where this applies

- `README.md` at project root
- All files under `docs/**/*.md` in **client projects** (and this plugin’s own docs when we want parity)

**PT —** Aplica-se ao README do projeto e a toda a pasta `docs/`.

## Why not two separate files?

Single-file with PT blocks keeps **one source of truth**; the PT block must be updated whenever the English section changes.

**PT —** Um só ficheiro evita que EN e PT diverjam; ao alterar o inglês, atualiza o bloco PT.

## Agent / skill support

- Agent: **`software-documentation-engineer`**
- Skill: **`documentation-engineering`**
- Cursor rule: **`rules/10-bilingual-documentation.mdc`** (applies when working on matched paths)

**PT —** Usa o agente e a skill acima para gerar documentação com o formato correto.
