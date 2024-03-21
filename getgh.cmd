@echo off

if "%2" == "" (
    call :parse_filename "%~1"
    goto :raw_url
)

:parse_args
if "%1" == "" goto :download_file

if /i "%1" == "-o" set out_file=%2
if /i "%1" == "--output" set out_file=%2
if /i "%1" == "-a" set author=%2
if /i "%1" == "--author" set author=%2
if /i "%1" == "-r" set repo=%2
if /i "%1" == "--repo" set repo=%2
if /i "%1" == "-b" set branch=%2
if /i "%1" == "--branch" set branch=%2
if /i "%1" == "-f" set file=%2
if /i "%1" == "--file" set file=%2

shift
shift
goto :parse_args

:download_file
if not defined branch set branch=main
if not defined out_file call :parse_filename "%file%"

curl -s -o %out_file% https://raw.githubusercontent.com/%author%/%repo%/%branch%/%file%

goto :end

:parse_filename
set str=%1
for /f "tokens=1* delims=/" %%a in (%str%) do (
    set out_file=%%a
    if "%%b" NEQ "" call :parse_filename "%%b"
)
goto :end

:raw_url
curl -s -o %out_file% https://raw.githubusercontent.com/%~1

:end
