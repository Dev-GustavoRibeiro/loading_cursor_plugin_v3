# Loading Studio Autopilot — Cursor Plugin

Plugin de utilizador para o Cursor que alinha **novos projetos** ao mesmo sistema de entrega:

- discovery antes de implementação
- governança de paleta com contratos JSON travados
- defaults Loading quando fizer sentido (com confirmação)
- agents e skills especializados
- templates e scripts de bootstrap
- MCPs pré-configurados para fluxo de produto (com autenticação onde for obrigatório)

A estrutura segue o formato oficial de plugins do Cursor (`rules/`, `skills/`, `agents/`, `commands/`, `.mcp.json`). Referência: [Plugins reference](https://cursor.com/docs/reference/plugins).

## Validar o bundle antes de instalar ou publicar

Na raiz deste repositório:

```bash
bash scripts/validate-plugin.sh
```

Windows (PowerShell):

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate-plugin.ps1
```

Opcional: instala [jq](https://jqlang.org/) para validação estrita do JSON.

## Instalação global no Cursor

1. Garante que o repositório está no GitHub (ou usa um fork).
2. Cursor → **Dashboard → Settings → Plugins → Import**.
3. Cola o URL do repositório Git.
4. Instala a **nível de utilizador** (recomendado).
5. Reinicia o Cursor se a UI o pedir.
6. **Settings → Tools & MCP**: autentica servidores remotos (OAuth) e define variáveis para os baseados em stdio/token (ex.: `CONTEXT7_API_KEY`, `GITHUB_PERSONAL_ACCESS_TOKEN`).

## Teste local (desenvolvimento do plugin)

1. Corre o script de validação (acima).
2. Importa **esta pasta/repo** como plugin de utilizador (mesmo fluxo da instalação global).
3. Abre **Output → MCP Logs** e confirma que não há erros de carregamento do `.mcp.json`.
4. Num projeto de teste, pede: `Use the project-bootstrap skill` ou `Act as the project-discovery-strategist`.

## Reinstalar ou atualizar

- Após `git push`, no Cursor abre **Plugins**, remove a entrada antiga se necessário, e **importa de novo** o URL do GitHub, ou usa a ação de atualização se a tua versão do Cursor a expuser.

## O que fica automático após instalar

- Regras globais de comportamento (`rules/`)
- Agentes (`agents/`) e skills (`skills/`)
- Comandos (`commands/`)
- Definições MCP empacotadas (`.mcp.json` do plugin)

## MCPs incluídos no `.mcp.json` do plugin

| Servidor   | Transporte | Notas |
|-----------|------------|--------|
| Playwright | stdio (`npx`) | Requer Node/npx |
| Context7   | stdio | Opcional: `CONTEXT7_API_KEY` em variáveis de ambiente |
| Supabase   | remoto (`url`) | OAuth no Cursor |
| Figma      | remoto | OAuth; regista redirect `cursor://anysphere.cursor-mcp/oauth/callback` na app OAuth |
| Sentry     | remoto | OAuth |
| Linear     | stdio via `mcp-remote` | OAuth ao conectar |
| GitHub     | stdio (`@modelcontextprotocol/server-github`) | `GITHUB_PERSONAL_ACCESS_TOKEN` |

Presets adicionais em `mcp-presets/` (GitHub remoto Copilot API, stacks lean/design, etc.).

## Presets opcionais

Em `mcp-presets/`:

- GitHub local (Docker) / remoto
- observabilidade completa
- design-heavy
- lean startup
- fullstack Supabase

## Governança visual (inalterada)

- Confirmar paleta antes de definir o sistema visual principal.
- Cores de marca em `config/project-palette.json` (nos **projetos** que criares).
- Cores semânticas (sucesso, erro, aviso, info) permitidas.
- Discovery e arquitetura antes de implementação em larga escala.

## Pastas principais deste repositório

| Pasta / ficheiro | Função |
|------------------|--------|
| `.cursor-plugin/plugin.json` | Manifesto obrigatório do plugin |
| `.cursor-plugin/marketplace.json` | Manifesto de marketplace (repo único) |
| `rules/` | Regras `.mdc` com frontmatter |
| `skills/` | Uma pasta por skill com `SKILL.md` |
| `agents/` | Agentes em Markdown |
| `commands/` | Comandos para o agente |
| `.mcp.json` | MCPs do plugin (nome oficial do ficheiro) |
| `config/` | Paleta e contratos de estilo de **exemplo** / defaults |
| `templates/` | Templates de brief, RFC, etc. |
| `docs/` | Guias (instalação, MCP, operação do plugin) |
| `mcp-presets/` | Packs MCP opcionais |
| `scripts/` | Bootstrap de **projeto cliente** + `validate-plugin` |

## Documentação extra

- [Instalação global](docs/INSTALL_GLOBAL.md)
- [Operação e manutenção do plugin](docs/PLUGIN_OPERATIONS.md)
- [Estrutura do plugin](docs/PLUGIN_STRUCTURE.md)
- [Notas de autenticação MCP](docs/MCP_AUTH_NOTES.md)
