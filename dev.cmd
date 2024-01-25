@echo off
setlocal enableextensions enabledelayedexpansion
set curdir=

if "%~1"=="" goto todir
if "%~1"=="-l" goto list

set curdir=%1
goto todir

:list
set current=0
:selectdir
cls
set counter=0
for /d %%n in (d:\dev\*) do (
	if !counter! equ !current! (
		echo ^> %%~nn ^<
		set curdir=%%~nn
	) ELSE (echo %%~nn)
	set /a counter+=1
)
choice /c wse /n /m "Use W or S for move and E for select "
if %errorlevel%==1 set /a current-=1
if %errorlevel%==2 set /a current+=1
if %errorlevel%==3 goto todir
if !current! lss 0 set /a current = 0
if !current! geq !counter! set /a current = !counter!-1

goto selectdir

:todir
echo d://dev/%curdir%
cd /d d://dev/%curdir%
pushd .
endlocal
popd