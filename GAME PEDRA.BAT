@echo off
title PEDRA PAPEL TESOURA LAGARTO SPOCK
color 05
setlocal enabledelayedexpansion

:: ===== CONFIGURAÇÃO INICIAL =====
set /p jogador=Digite o nome do jogador: 
set vitorias=0
set derrotas=0
set empates=0

:MENU
cls
echo ==========================================
echo    BEM VINDO AO JO-KEN-PO
echo ==========================================
echo Jogador: %jogador%
echo.
echo PLACAR:
echo Vitorias: %vitorias%
echo Derrotas: %derrotas%
echo Empates : %empates%
echo.
echo [1] PEDRA
echo [2] PAPEL
echo [3] TESOURA
echo [4] LAGARTO
echo [5] SPOCK
echo [R] REGRAS
echo [E] ENCERRAR JOGO
echo.
set /p opcao=Escolha uma opcao: 

if /i "%opcao%"=="1" set escolha=PEDRA& set escolhaNum=1& goto JOGAR
if /i "%opcao%"=="2" set escolha=PAPEL& set escolhaNum=2& goto JOGAR
if /i "%opcao%"=="3" set escolha=TESOURA& set escolhaNum=3& goto JOGAR
if /i "%opcao%"=="4" set escolha=LAGARTO& set escolhaNum=4& goto JOGAR
if /i "%opcao%"=="5" set escolha=SPOCK& set escolhaNum=5& goto JOGAR
if /i "%opcao%"=="R" goto REGRAS
if /i "%opcao%"=="E" goto FIM

goto MENU

:JOGAR
cls
set /a comp=%random% %%5 +1

if %comp%==1 set compEscolha=PEDRA
if %comp%==2 set compEscolha=PAPEL
if %comp%==3 set compEscolha=TESOURA
if %comp%==4 set compEscolha=LAGARTO
if %comp%==5 set compEscolha=SPOCK

echo ==========================================
echo Jogador escolheu: %escolha%
echo Computador escolheu: %compEscolha%
echo ==========================================

:: ===== RESULTADO =====
if %escolhaNum%==%comp% (
    echo AHH... DEU EMPATE!
    set /a empates+=1
    pause
    goto MENU
)

:: Condições de vitória
if %escolhaNum%==1 if %comp%==3 goto VITORIA
if %escolhaNum%==1 if %comp%==4 goto VITORIA

if %escolhaNum%==2 if %comp%==1 goto VITORIA
if %escolhaNum%==2 if %comp%==5 goto VITORIA

if %escolhaNum%==3 if %comp%==4 goto VITORIA
if %escolhaNum%==3 if %comp%==2 goto VITORIA

if %escolhaNum%==4 if %comp%==2 goto VITORIA
if %escolhaNum%==4 if %comp%==5 goto VITORIA

if %escolhaNum%==5 if %comp%==1 goto VITORIA
if %escolhaNum%==5 if %comp%==3 goto VITORIA

goto DERROTA

:VITORIA
echo VOCE VENCEU!
set /a vitorias+=1
pause
goto MENU

:DERROTA
echo VOCE PERDEU!
set /a derrotas+=1
pause
goto MENU

:REGRAS
cls
echo ==========================================
echo               REGRAS
echo ==========================================
echo PEDRA: Empata com PEDRA
echo        Ganha de TESOURA e LAGARTO
echo        Perde de PAPEL e SPOCK
echo.
echo PAPEL: Empata com PAPEL
echo        Ganha de PEDRA e SPOCK
echo        Perde de TESOURA e LAGARTO
echo.
echo TESOURA: Empata com TESOURA
echo          Ganha de LAGARTO e PAPEL
echo          Perde de PEDRA e SPOCK
echo.
echo LAGARTO: Empata com LAGARTO
echo          Ganha de PAPEL e SPOCK
echo          Perde de PEDRA e TESOURA
echo.
echo SPOCK: Empata com SPOCK
echo        Ganha de PEDRA e TESOURA
echo        Perde de LAGARTO e PAPEL
echo.
echo ==========================================
echo PRESSIONE QUALQUER TECLA PARA CONTINUAR...
pause >nul
goto MENU

:FIM
cls
echo ==========================================
echo      OBRIGADO POR JOGAR, %jogador%!
echo ==========================================
echo PLACAR FINAL:
echo Vitorias: %vitorias%
echo Derrotas: %derrotas%
echo Empates : %empates%
echo.
pause
exit