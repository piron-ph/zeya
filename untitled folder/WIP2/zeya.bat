@echo off & CD "%~dp0"
title A message for you 
echo Hey there, Zeya
echo.
ping localhost -n 2 >nul
echo You must be Alyssa
echo.
ping localhost -n 2 >nul
echo i have come here to deliver a message for you.
echo.
ping localhost -n 2 >nul
echo Do you want to read it?
echo.
ping localhost -n 2 >nul
echo Type 1 if YES and 2 if NO 
echo. 
ping localhost -n 2 >nul
echo Please Press Enter once you Put the number.
echo.

set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
:op1 
cls
ping localhost -n 2 >nul
echo "Loading messages."
ping localhost -n 1 >nul
setlocal enableextensions disabledelayedexpansion
    for /l %%f in (0 1 100) do (
        call :drawProgressBar %%f "Loading Message Request"
    )
    for /l %%f in (100 -1 0) do (
        call :drawProgressBar %%f "Audio File Not Found"
    )
    for /l %%f in (0 5 10 100) do (
        call :drawProgressBar !random! "Text Loaded Succesfully"
    )
    ping localhost -20 >nul 

    rem Clean all after use
    call :finalizeProgressBar 1

    call :initProgressBar "|" "$"
    call :drawProgressBar 0 "Loading Complete"
    for /l %%f in (0 1 100) do (
        call :drawProgressBar %%f 
    )

cls
ping localhost -n 2 >nul
echo "How time seems fast when it is you im enjoying it with"
echo.
ping localhost -n 2 >nul
echo "How amazing it is to be a part of you"
echo.
ping localhost -n 2 >nul
echo "How i never knew you would make me feel."
echo.
ping localhost -n 2 >nul
echo "your laugh so mellifluous"
echo.
ping localhost -n 2 >nul
echo "How every whisper feels like a song"
echo.
ping localhost -n 2 >nul
echo "With you, i feel i belong."
echo.
ping localhost -n 2 >nul
echo "A miles apart, but you feel so right"
echo.
ping localhost -n 2 >nul
echo "No distance too wide, no journey too far"
echo.
ping localhost -n 2 >nul
cls
ping localhost -n 2 >nul 
echo "We'll meet in time."
cls
ping localhost -n 2 >nul
echo "i like"
ping localhost -n 2 >nul
echo "I love"
ping localhost -n 2 >nul
echo "Every part and all of you."
ping localhost -n 2 >nul
echo "This will destroy your pc in"
ping localhost -n 2 >nul
echo "joke"
ping localhost -n 2 >nul
echo "Mwa"
echo.
ping localhost -n 2 >nul
cls
echo "end of message."
ping localhost -n 2 >nul
EXIT /B

:op2 
echo "Sorry, you cant say no hehe"
ping localhost -n 2 >nul
echo "Starting message".
cls
ping localhost -n 2 >nul
echo "Loading messages."
ping localhost -n 1 >nul
setlocal enableextensions disabledelayedexpansion
    for /l %%f in (0 1 100) do (
        call :drawProgressBar %%f "Loading Message Request"
    )
    for /l %%f in (100 -1 0) do (
        call :drawProgressBar %%f "Audio File Not Found"
    )
    for /l %%f in (0 5 10 100) do (
        call :drawProgressBar !random! "Text Loaded Succesfully"
    )
    ping localhost -20 >nul 

    rem Clean all after use
    call :finalizeProgressBar 1

    call :initProgressBar "|" "$"
    call :drawProgressBar 0 "Loading Complete"
    for /l %%f in (0 1 100) do (
        call :drawProgressBar %%f 
    )

cls
ping localhost -n 2 >nul
echo "How time seems fast when it is you im enjoying it with"
echo.
ping localhost -n 2 >nul
echo "How amazing it is to be a part of you"
echo.
ping localhost -n 2 >nul
echo "How i never knew you would make me feel."
echo.
ping localhost -n 2 >nul
echo "your laugh so mellifluous"
echo.
ping localhost -n 2 >nul
echo "How every whisper feels like a song"
echo.
ping localhost -n 2 >nul
echo "With you, i feel i belong."
echo.
ping localhost -n 2 >nul
echo "A miles apart, but you feel so right"
echo.
ping localhost -n 2 >nul
echo "No distance too wide, no journey too far"
echo.
ping localhost -n 2 >nul
cls
ping localhost -n 2 >nul 
echo "We'll meet in time."
cls
ping localhost -n 2 >nul
echo "i like"
ping localhost -n 2 >nul
echo "I love"
ping localhost -n 2 >nul
echo "Every part and all of you."
ping localhost -n 2 >nul
echo "This will destroy your pc in"
ping localhost -n 2 >nul
echo "joke"
ping localhost -n 2 >nul
echo "Mwa"
echo.
ping localhost -n 2 >nul
cls
echo "end of message."
ping localhost -n 2 >nul
EXIT /B




:drawProgressBar value [text]
    if "%~1"=="" goto :eof
    if not defined pb.barArea call :initProgressBar
    setlocal enableextensions enabledelayedexpansion
    set /a "pb.value=%~1 %% 101", "pb.filled=pb.value*pb.barArea/100", "pb.dotted=pb.barArea-pb.filled", "pb.pct=1000+pb.value"
    set "pb.pct=%pb.pct:~-3%"
    if "%~2"=="" ( set "pb.text=" ) else ( 
        set "pb.text=%~2%pb.back%" 
        set "pb.text=!pb.text:~0,%pb.textArea%!"
    )
    <nul set /p "pb.prompt=[!pb.fill:~0,%pb.filled%!!pb.dots:~0,%pb.dotted%!][ %pb.pct% ] %pb.text%!pb.cr!"
    endlocal
    goto :eof

:initProgressBar [fillChar] [dotChar]
    if defined pb.cr call :finalizeProgressBar
    for /f %%a in ('copy "%~f0" nul /z') do set "pb.cr=%%a"
    if "%~1"=="" ( set "pb.fillChar=#" ) else ( set "pb.fillChar=%~1" )
    if "%~2"=="" ( set "pb.dotChar=." ) else ( set "pb.dotChar=%~2" )
    set "pb.console.columns="
    for /f "tokens=2 skip=4" %%f in ('mode con') do if not defined pb.console.columns set "pb.console.columns=%%f"
    set /a "pb.barArea=pb.console.columns/2-2", "pb.textArea=pb.barArea-9"
    set "pb.fill="
    setlocal enableextensions enabledelayedexpansion
    for /l %%p in (1 1 %pb.barArea%) do set "pb.fill=!pb.fill!%pb.fillChar%"
    set "pb.fill=!pb.fill:~0,%pb.barArea%!"
    set "pb.dots=!pb.fill:%pb.fillChar%=%pb.dotChar%!"
    set "pb.back=!pb.fill:~0,%pb.textArea%!
    set "pb.back=!pb.back:%pb.fillChar%= !"
    endlocal & set "pb.fill=%pb.fill%" & set "pb.dots=%pb.dots%" & set "pb.back=%pb.back%"
    goto :eof

:finalizeProgressBar [erase]
    if defined pb.cr (
        if not "%~1"=="" (
            setlocal enabledelayedexpansion
            set "pb.back="
            for /l %%p in (1 1 %pb.console.columns%) do set "pb.back=!pb.back! "
            <nul set /p "pb.prompt=!pb.cr!!pb.back:~1!!pb.cr!"
            endlocal
        )
    )
    for /f "tokens=1 delims==" %%v in ('set pb.') do set "%%v="
    goto:eof