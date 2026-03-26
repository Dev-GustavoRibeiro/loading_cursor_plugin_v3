# Documentation hub — `docs/README.md` (template)

> Copy to `docs/README.md` in the **target project**. Replace placeholders.  
> **PT —** Copia para `docs/README.md` no **projeto cliente**. Preenche os espaços em branco.

## Purpose

Single entry point for all project documentation: what exists, who owns it, how fresh it must stay.

**PT —** Ponto único de entrada: o que existe, quem mantém, com que frequência atualizar.

## Doc map

| Document | Audience | Owner | Review cadence |
|----------|----------|-------|------------------|
| `project-brief.md` | Product + eng | PM / lead | Per major milestone |
| `architecture-rfc.md` | Engineering | Tech lead | Per architecture change |
| `functional-requirements.md` | Product + QA | PM + eng | Per epic |
| `nonfunctional-requirements.md` | Eng + SRE | Tech lead | Quarterly |
| `handoff.md` | Incoming devs | Outgoing owner | Each handoff |
| `security-review.md` | Security + eng | Security champ | Per release / material change |

## How to contribute

1. Prefer updating an existing page over adding a duplicate.
2. Add **PT —** blocks when the primary text is English (team convention).
3. Link new pages here in the table above.

**PT —** Atualiza páginas existentes; adiciona blocos **PT —** quando o corpo for inglês; regista links na tabela.

## Conventions

- **ADRs**: `docs/adr/NNNN-title.md`
- **Runbooks**: `docs/runbooks/`
- **API**: OpenAPI or link to generated docs

---

**PT — (resumo)**  
Este ficheiro é o índice mestre. Sem ele, a documentação espalha-se e ninguém sabe o que está válido.
