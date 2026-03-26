# Porque o painel “Skills” pode ficar vazio (mesmo com o plugin instalado)

## 1. Dois contextos diferentes na UI do Cursor

Na documentação oficial ([Plugins](https://cursor.com/docs/plugins.md)) está escrito:

> *Manage rules and skills from the **Rules** section of Cursor Settings. […] Skills appear in the **Agent Decides** section and can be invoked manually with `/skill-name` in chat.*

Ou seja, as **skills empacotadas no plugin** são geridas no fluxo de **Rules / Agent Decides**, não necessariamente no ecrã dedicado **Skills** onde aparece **“+ New”** e **“No Skills Yet”**.

Esse ecrã **Skills** costuma servir para skills **criadas manualmente** no projeto ou pelo utilizador. **Não confundir** com a lista de capacidades que o plugin regista.

**O que fazer:** abre **Cursor Settings → Rules** (ou equivalente na tua versão) e verifica se há entradas relacionadas com skills do agente / “Agent Decides”. No chat, podes ainda invocar por nome, por exemplo: `Use the project-bootstrap skill`.

## 2. Bug conhecido no Windows (plugins locais / carregamento)

No fórum da Cursor foi identificado um problema em que, **no Windows**, o Cursor **rejeitava em silêncio** `agents`, `skills` e `commands` do plugin após validação de caminhos (separadores `\` vs `/`), enquanto **MCP** continuava a carregar — sintoma: só MCP funciona, skills e agents “desaparecem”.

- Tópico: [Unable to access plugin skills in Cursor](https://forum.cursor.com/t/unable-to-access-plugin-skills-in-cursor/152232)  
- Há relatos de correção em versões mais recentes; **atualiza o Cursor** (Stable ou Nightly, conforme a equipa recomendar).

Se estás no Windows e **MCP do plugin carrega** mas **skills/agents não**, isto é o candidato mais forte.

## 3. Como validar que o plugin está correto

O repositório já está no formato oficial (`skills/<nome>/SKILL.md` com frontmatter). Na raiz do plugin corre:

```bash
bash scripts/validate-plugin.sh
```

## 4. Teste local recomendado pela Cursor

Para desenvolvimento, a doc sugere copiar ou fazer symlink do plugin para:

`~/.cursor/plugins/local/<nome-do-plugin>`

e recarregar a janela. Isto por vezes contorna diferenças entre “import pelo GitHub” e cópia local.

## 5. Resumo

| Sintoma | Ação |
|--------|------|
| Painel **Skills** vazio com **+ New** | Ver **Settings → Rules** / Agent Decides; usar `/nome-da-skill` no chat |
| Windows, MCP ok, skills não | Atualizar Cursor; ver tópico do fórum acima |
| Dúvida se o bundle está válido | `scripts/validate-plugin.sh` ou `.ps1` |
