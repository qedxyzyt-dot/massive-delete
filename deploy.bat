@echo off
chcp 65001 >nul
title Deploy to GitHub Pages

cd /d "%~dp0"

echo ═══════════════════════════════════════════════
echo   Massive Delete Gmail — Deploy to GitHub
echo ═══════════════════════════════════════════════
echo.

:: Check if git is installed
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Git nao encontrado. Instale em: https://git-scm.com
    pause
    exit /b 1
)

:: Initialize repo if not already
if not exist ".git" (
    echo [INIT] Inicializando repositorio git...
    git init
    git branch -M main
    git remote add origin https://github.com/qedxyzyt-dot/massive-delete.git
    echo.
)

:: Check remote
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo [INIT] Adicionando remote...
    git remote add origin https://github.com/qedxyzyt-dot/massive-delete.git
)

:: Stage all changes
git add -A

:: Check if there are changes to commit
git diff --cached --quiet 2>nul
if %errorlevel% equ 0 (
    echo [OK] Nenhuma alteracao detectada. Nada para enviar.
    echo.
    pause
    exit /b 0
)

:: Show what changed
echo [ALTERACOES DETECTADAS]
git diff --cached --stat
echo.

:: Auto-generate commit message with timestamp
for /f "tokens=*" %%a in ('powershell -c "Get-Date -Format \"yyyy-MM-dd HH:mm:ss\""') do set TIMESTAMP=%%a
set MSG=Update site — %TIMESTAMP%

echo [COMMIT] %MSG%
git commit -m "%MSG%"
echo.

:: Push
echo [PUSH] Enviando para GitHub...
git push -u origin main
echo.

if %errorlevel% equ 0 (
    echo ═══════════════════════════════════════════════
    echo   DEPLOY CONCLUIDO COM SUCESSO!
    echo   Site: https://maildelete.com.br
    echo ═══════════════════════════════════════════════
) else (
    echo [ERRO] Falha no push. Verifique sua conexao e autenticacao.
)

echo.
pause
