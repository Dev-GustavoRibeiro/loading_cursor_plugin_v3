---
name: validate-plugin-bundle
description: Roda a checagem local de estrutura e manifest do plugin antes de publicar ou reinstalar no Cursor.
---

# Validar o bundle do plugin

No diretório raiz deste repositório (o plugin), execute:

- **Bash (Git Bash / macOS / Linux):** `bash scripts/validate-plugin.sh`
- **Windows PowerShell:** `powershell -ExecutionPolicy Bypass -File scripts/validate-plugin.ps1`

Corrija qualquer erro reportado antes de fazer push ou reinstalar o plugin no Cursor.
