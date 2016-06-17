@echo off

REM  This batch file emulates the 'create-empty-file' behavior of the unix 'touch' command.
REM 
REM  Syntax "touch <fileName.ext>""
REM
REM  Examples: 
REM    touch readme.md
REM    touch __init__.py
REM    touch .gitignore

SETLOCAL 

SET FILENAME="RENAME_ME.txt"
IF not "%~1" == "" ( SET FILENAME=%~1  )
SET FILENAME=%FILENAME:"=%

copy /y NUL %FILENAME% >NUL

ENDLOCAL