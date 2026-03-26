# Operação do plugin (manutenção e limites)

Este documento complementa o [README](../README.md) com detalhes de **estrutura oficial do Cursor**, **o que é global vs. por projeto**, e **como evoluir o bundle**.

## O que é global (plugin de utilizador)

Quando instalas **Loading Studio Autopilot** ao nível de utilizador no Cursor, passam a estar disponíveis globalmente (conforme o Cursor carregar o plugin):

- `rules/` — regras persistentes (`.mdc` com frontmatter)
- `skills/` — pastas com `SKILL.md` e frontmatter
- `agents/` — agentes em Markdown com frontmatter
- `commands/` — comandos reutilizáveis para o agente
- `.mcp.json` na raiz do **repositório do plugin** — servidores MCP empacotados com o plugin

Isto **não substitui** ficheiros dentro de um projeto cliente (por exemplo `.cursor/mcp.json` no repositório da app), que continuam a ser a forma recomendada de MCP **específico desse repo**.

## O que é por projeto (repositório da aplicação)

Mantém no repositório do produto:

- `docs/project-brief.md`, `docs/page-map.md`, `docs/architecture-rfc.md`
- `config/project-palette.json`, `config/project-style-contract.json`
- Opcional: `.cursor/mcp.json` só com ferramentas desse projeto
- Secrets em `.env` (nunca commitados)

Os scripts em `scripts/bootstrap/` copiam **templates** para o projeto alvo; corre-os **dentro da pasta do projeto cliente**, não na pasta do plugin.

## Estrutura final esperada pelo Cursor (resumo)

```
.cursor-plugin/
  plugin.json          # manifesto obrigatório
  marketplace.json     # opcional; obrigatório formato oficial se existir
rules/
skills/*/
agents/
commands/
.mcp.json
README.md
```

Referência: [Plugins reference](https://cursor.com/docs/reference/plugins).

## Como adicionar uma skill

1. Cria `skills/<nome-kebab>/SKILL.md`.
2. Inclui frontmatter obrigatório:

```yaml
---
name: nome-kebab
description: Uma frase clara sobre o que faz e quando usar.
---
```

3. Corpo em Markdown com secções (quando usar, instruções, checklist).
4. Corre `bash scripts/validate-plugin.sh` antes do push.

## Como adicionar um agent

1. Cria `agents/<nome>.md` com frontmatter:

```yaml
---
name: nome-kebab
description: Propósito curto do agente.
---
```

2. Corpo com o prompt e comportamento esperado.

## Como atualizar MCPs no plugin

1. Edita `.mcp.json` na **raiz do plugin**.
2. Para servidores **stdio**, inclui `"type": "stdio"`, `command`, `args`, e `env` com `${env:NOME}` quando precisares de secrets.
3. Para **remotos** (`url`), autenticação costuma ser OAuth no Cursor (Supabase, Figma, Sentry); vê [MCP](https://cursor.com/docs/mcp.md).
4. Alternativas: ficheiros em `mcp-presets/` para combinações (merge manual no teu `~/.cursor/mcp.json` ou no `.cursor/mcp.json` do projeto).

## Permissões recomendadas (auto-run)

O Cursor usa `~/.cursor/permissions.json` para pré-aprovar ferramentas. Um exemplo está em `docs/cursor-permissions-recommended.json` — copia blocos que façam sentido para a tua máquina.

## Atualizar no GitHub

1. `bash scripts/validate-plugin.sh`
2. `git add -A && git commit -m "..." && git push`
3. No Cursor: **Settings → Plugins** — atualiza ou reimporta o plugin conforme a UI (remove e volta a importar o URL do repo se necessário).

## Teste local rápido

1. Validação: `bash scripts/validate-plugin.sh` ou `powershell -ExecutionPolicy Bypass -File scripts/validate-plugin.ps1`
2. Instalação de desenvolvimento: importa este repositório como plugin de utilizador e confirma que rules/skills/agents aparecem e que **MCP Logs** não mostram erros de parse no `.mcp.json`.
