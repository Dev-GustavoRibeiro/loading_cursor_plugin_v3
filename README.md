# Loading Studio Autopilot — Cursor plugin

**Loading Studio Autopilot** is a **user-level Cursor plugin** that standardizes how your company (or you personally) run software projects in Cursor: discovery-first delivery, locked palette governance, deep specialist **agents**, reusable **skills**, documentation engineering (including **functional / non-functional requirements** and **mind maps**), bootstrap templates, and MCP presets.

**PT — (comentário / tradução)**  
Este é um **plugin de utilizador** do Cursor que padroniza como a empresa (ou tu) trabalha: primeiro discovery, paleta travada em JSON, **agentes** especializados (prompts profundos em inglês), **skills** reutilizáveis, **documentação** (requisitos funcionais/não funcionais, mapas mentais), templates de arranque e MCPs. O texto principal deste README está em **inglês**; cada secção traz um bloco **PT —** para quem prefere ler em português.

---

## Who this is for

| Audience | How you benefit |
|----------|-----------------|
| **Company / team** | One shared behavior model: same agents, same doc standards, same governance. |
| **Individual** | A polished “operating system” for Cursor without maintaining your own rules from scratch. |
| **Tech lead** | Deep agents + catalog + orchestration patterns for delegation in chat. |

**PT —** Serve para **empresas**, **equipas** ou **indivíduos** que querem o mesmo modo de trabalho no Cursor, com agentes e documentação alinhados.

---

## What you get (inventory)

- **`rules/`** — Always-on behavior (discovery, palette lock, security baseline, **bilingual doc convention** for `docs/`).
- **`agents/`** — 23 specialist agents (see **`docs/AGENTS_CATALOG.md`**), including **`software-documentation-engineer`** for FR/NFR, doc hub, mind maps, ADRs.
- **`skills/`** — Packaged workflows (`project-bootstrap`, `documentation-engineering`, `mcp-selection`, etc.).
- **`commands/`** — Agent-executable commands (bootstrap, validate plugin).
- **`templates/`** — Copy-paste seeds: brief, RFC, **functional-requirements**, **nonfunctional-requirements**, **documentation-hub**, **mind-map-outline**, handoff, security review.
- **`.mcp.json`** — Playwright, Context7, Supabase, Figma, Sentry, Linear, GitHub (optional tokens).
- **`scripts/`** — Validate plugin bundle; bootstrap scripts for **client repos** (not for editing the plugin itself).

**PT —** Recebes regras, agentes (23), skills, comandos, templates (incluindo requisitos e mapas mentais), MCPs e scripts de validação.

---

## Configure it your way (recommended profiles)

You do **not** have to use everything. Pick a profile and tell the team:

1. **Minimal** — Install plugin; use only `rules/` + `project-bootstrap` + `mcp-orchestrator`. Add MCPs as needed.
2. **Standard product team** — Minimal + `software-documentation-engineer` on every epic + `linear-product-ops-specialist` for issue breakdown.
3. **Full stack web** — Standard + `supabase-platform-specialist` / `backend-systems-architect` + `frontend-architecture-lead` + Playwright skill.
4. **Design-heavy** — Add `web-design-director`, `figma-design-handoff-specialist`, `design-audit-specialist`.

**PT —** Podes **reduzir ou expandir** o uso: perfil mínimo só regras e bootstrap; perfil completo com documentação, Linear, Supabase, design, etc.

---

## Install (user-level plugin)

1. Push or fork this GitHub repository (or use the upstream URL your company approves).
2. Cursor → **Dashboard → Settings → Plugins → Import**.
3. Paste the repository URL.
4. Install at **user level** (recommended).
5. Restart Cursor if prompted.
6. **Settings → Tools & MCP** — complete OAuth for remote servers; set `CONTEXT7_API_KEY` and `GITHUB_PERSONAL_ACCESS_TOKEN` if you use those stdio servers.

**PT —** Instalação: importar o URL do GitHub como plugin de **utilizador**; depois configurar MCPs e variáveis de ambiente.

---

## Validate before publishing or trusting CI

```bash
bash scripts/validate-plugin.sh
```

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate-plugin.ps1
```

Optional: install **`jq`** for strict JSON checks.

**PT —** Corre o script na **raiz deste repositório** antes de publicar ou de reportar “plugin quebrado”.

---

## Documentation convention: English + Portuguese blocks

For **client project** docs (`docs/**/*.md`, root `README.md`):

- Write the main content in **English**.
- After each major section, add:

```markdown
**PT — (comentário / tradução)**  
<Portuguese summary or translation>
```

Read **`docs/BILINGUAL_CONVENTION.md`** and rule **`rules/10-bilingual-documentation.mdc`**.

**PT —** Nos **projetos**, a documentação deve ter **inglês** + blocos **PT —** por secção. Isto ajuda equipas mistas EN/PT sem dois ficheiros divergentes.

---

## Agents: how to invoke

- Full table: **`docs/AGENTS_CATALOG.md`**
- Deep prompts: each file in **`agents/*.md`**
- Copy-paste examples: **`examples/quick-start-prompts.md`**

Pattern:

```
Act as software-documentation-engineer ...
```

**PT —** Lista de agentes em `docs/AGENTS_CATALOG.md`; exemplos em `examples/quick-start-prompts.md`; invoca com `Act as ...`.

---

## Skills: how to invoke

```
Use the documentation-engineering skill ...
Use the project-bootstrap skill ...
```

**PT —** Usa `Use the <skill-name> skill` no chat.

---

## “Skills” panel shows empty — is that normal?

Often **yes**. The **Skills** UI with **+ New** is frequently for **manually created** skills. Plugin skills may appear under **Settings → Rules** (Agent Decides) and can be invoked via `/skill-name` or natural language. On **Windows**, older Cursor builds had a path-separator bug (MCP loaded, agents/skills did not); **update Cursor**. See **`docs/SKILLS_UI_CURSOR.md`**.

**PT —** O painel “Skills” pode estar vazio mesmo com plugin válido; ver secção Rules / atualizar Cursor no Windows.

---

## MCP servers (bundled defaults)

| Server | Notes |
|--------|--------|
| Playwright | Local `npx` |
| Context7 | Optional API key |
| Supabase / Figma / Sentry / Linear | OAuth or remote flow |
| GitHub | Personal access token |

More: **`docs/MCP_AUTH_NOTES.md`**, presets in **`mcp-presets/`**.

**PT —** Tabela resumida; detalhes nos docs de MCP.

---

## Repo layout (plugin root)

| Path | Role |
|------|------|
| `.cursor-plugin/plugin.json` | Manifest |
| `.cursor-plugin/marketplace.json` | Optional marketplace index |
| `rules/` | `.mdc` rules |
| `agents/` | Agent definitions |
| `skills/` | `SKILL.md` per folder |
| `commands/` | Command markdown |
| `.mcp.json` | MCP config (leading dot — official name) |
| `templates/` | Project seeds |
| `docs/` | Plugin guides + `AGENTS_CATALOG`, `BILINGUAL_CONVENTION` |
| `config/` | Example palette / style contracts (for **client** projects) |

**PT —** Estrutura oficial do plugin Cursor; não coloques `rules` dentro de `.cursor/` neste repositório.

---

## Permissions (optional)

Suggested allow-list for tool auto-run: **`docs/cursor-permissions-recommended.json`** → merge into your **`~/.cursor/permissions.json`** as you see fit.

**PT —** Sugestão de permissões; copia para o teu perfil Cursor se quiseres menos confirmações.

---

## Update / reinstall

After `git push`, re-import the repo in **Plugins** or use the update action your Cursor version provides.

**PT —** Após push, volta a importar ou atualiza o plugin nas definições.

---

## Further reading

- [Global install notes](docs/INSTALL_GLOBAL.md)
- [Plugin operations](docs/PLUGIN_OPERATIONS.md)
- [Plugin structure](docs/PLUGIN_STRUCTURE.md)
- [Skills UI & Windows](docs/SKILLS_UI_CURSOR.md)
- [MCP auth notes](docs/MCP_AUTH_NOTES.md)
- [Bilingual convention](docs/BILINGUAL_CONVENTION.md)
- [Agents catalog](docs/AGENTS_CATALOG.md)

**PT —** Links acima: instalação, operação, estrutura, MCP, convenção bilíngue e catálogo de agentes.

---

## License

See **`LICENSE`** if present in your fork; otherwise follow your organization’s policy.

**PT —** Licença conforme o repositório que utilizas (ou política da empresa).
