@echo off

set out=.gitignore

if "%2" NEQ "" (
    set out=%2
)

call getgh -a github -r gitignore -f %1.gitignore -o %2
