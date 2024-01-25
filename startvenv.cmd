@echo off
set venvdir=venv

if "%~1" NEQ "" (set venvdir=%~1)

%venvdir%\Scripts\activate
