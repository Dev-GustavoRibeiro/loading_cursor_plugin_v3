# Estrutura do plugin (compatível com Cursor)

Este repositório está organizado como um **único plugin** na raiz, conforme a [documentação oficial de plugins](https://cursor.com/docs/reference/plugins).

## Árvore esperada

```text
.cursor-plugin/
├── plugin.json              # Manifesto obrigatório
└── marketplace.json         # Opcional: índice de marketplace (formato oficial)
rules/                       # Regras .mdc (frontmatter YAML)
skills/
│   └── <skill-name>/
│       └── SKILL.md         # Frontmatter: name, description
agents/                      # Agentes .md (frontmatter: name, description)
commands/                    # Comandos .md / .txt (frontmatter: name, description)
.mcp.json                    # Servidores MCP (chave mcpServers)
config/                      # Exemplos: paleta default, schema, style contract
templates/                   # Seeds: brief, RFC, FR/NFR, doc hub, mind map, …
docs/                        # Guias do plugin + catálogo de agentes, convenção EN+PT
mcp-presets/                 # Bundles MCP opcionais (merge manual)
scripts/
├── validate-plugin.sh       # Validação antes de publicar
├── validate-plugin.ps1
├── bootstrap/               # Scripts para correr **no projeto cliente**
└── doctor/
README.md
.env.example                 # Variáveis úteis para MCP (referência)
```

## O que **não** deve estar dentro do plugin

- Conteúdo em `.cursor/rules`, `.cursor/skills` ou `.cursor/agents` **no repositório do plugin** — o Cursor descobre componentes em `rules/`, `skills/`, `agents/` na **raiz do plugin**, não dentro de `.cursor/`.
- Renomear `.mcp.json` para outro nome **quebra** a descoberta automática, salvo se `mcpServers` no `plugin.json` apontar explicitamente para outro ficheiro (o padrão oficial continua a ser `.mcp.json`).

## Ficheiros de permissão

O Cursor usa `~/.cursor/permissions.json` no **teu perfil**. Um exemplo alinhado a estes MCPs está em `docs/cursor-permissions-recommended.json`.
