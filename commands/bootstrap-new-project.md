---
name: bootstrap-new-project
description: Executa o fluxo de discovery, trava paleta em JSON e gera artefatos iniciais (brief, page-map, architecture-rfc) antes de codar.
---

# Bootstrap de novo projeto

1. Atue como **project-discovery-strategist** ou use a skill **project-bootstrap**.
2. Faça perguntas mínimas para fechar objetivo, público, escopo, stack e prazo.
3. Confirme ou peça a paleta aprovada; se for Loading, ofereça defaults e confirme.
4. Gere (ou atualize) na raiz do **repositório do cliente** (não no plugin):
   - `docs/project-brief.md`
   - `config/project-palette.json`
   - `config/project-style-contract.json`
   - `docs/page-map.md`
   - `docs/architecture-rfc.md`
   - `docs/README.md` (documentation hub; template `templates/documentation-hub.md`)
5. Opcional: peça **software-documentation-engineer** para `functional-requirements.md`, `nonfunctional-requirements.md`, mind maps — sempre com blocos **PT —** por secção.
6. Opcional: rode `scripts/bootstrap/new-project.sh` ou `scripts/bootstrap/new-project.ps1` no projeto alvo para cópia inicial dos templates.
7. Escolha o conjunto mínimo de MCPs com a skill **mcp-selection** e autentique remotos em **Settings → Tools & MCP** quando necessário.
