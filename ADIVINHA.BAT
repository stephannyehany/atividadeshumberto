@echo off
setlocal enabledelayedexpansion
title JOGO DE ADIVINHACAO
color 0D
mode con: cols=60 lines=25

set pontos=0

:inicio
cls
echo ==================================================
echo                  JOGO DE ADIVINHACAO 
echo ==================================================
echo.
set /p nome=Digite seu nome: 
cls

:novo_jogo
set /a numero=%random% %% 51
set tentativas=0
set max=5

echo ==================================================
echo  Seja bem-vindo(a), !nome! 
echo ==================================================
echo.
echo  Tente adivinhar o numero entre 0 e 50
echo  Voce tem 5 tentativas
echo.
echo  [P] Ver Pontuacao
echo  [E] Encerrar Jogo
echo.

:jogo
set /a restantes=%max% - %tentativas%
echo --------------------------------------------------
echo !nome!, voce tem !restantes! tentativa(s).
echo --------------------------------------------------

set /p palpite=Digite seu numero: 


if /I "!palpite!"=="P" goto ver_pontos
if /I "!palpite!"=="E" goto sair

echo !palpite!| findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo.
    echo  Digite apenas numeros!
    timeout /t 2 >nul
    cls
    goto jogo
)

set /a tentativas+=1

if !palpite! EQU !numero! (
    cls
    set /a pontos+=20
    echo ==================================================
    echo  PARABÉNS, !nome! VOCÊ ACERTOU!
    echo  O numero era !numero!
    echo  +20 pontos
    echo ==================================================
    goto fim
)

if !tentativas! GEQ !max! (
    cls
    set /a pontos-=10
    echo ==================================================
    echo  QUE PENA, !nome! VOCE PERDEU!!!
    echo  O numero era !numero!
    echo  -10 pontos
    echo ==================================================
    goto fim
)

if !palpite! LSS !numero! (
    echo.
    echo  O numero eh MAIOR!
) else (
    echo.
    echo  O numero eh MENOR!
)

timeout /t 2 >nul
cls
goto jogo

:ver_pontos
cls
echo ==================================================
echo                PONTUACAO
echo ==================================================
echo.
echo Jogador: !nome!
echo Pontos: !pontos!
echo.
pause
cls
goto jogo

:fim
echo.
echo Pontuacao atual: !pontos!
echo.
pause
choice /m "Deseja jogar novamente?"
if errorlevel 2 goto sair
goto novo_jogo


