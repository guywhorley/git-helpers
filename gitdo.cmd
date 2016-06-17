@echo off
rem  git add, git commit, git push to origin in one step
rem  Only happy path is considered. Contains no error checking.
rem
rem  In the absence of any args, reasonable defaults are used.
rem  In the context of Git, this means remote = 'origin' and branch = 'master'.
rem
rem  Note: a remote called 'origin' must exist in the repository.
rem
rem  Syntax: gitdo %1 %2 %3 %4
rem     %1 - commit message, enclosed in double quotes
rem     %2 - file to add, "*" or "./someFile.txt"
rem     %3 - branch
rem     %4 - remote
rem  Examples:
rem     gitdo "fixing css"
rem     gitdo "added more examples" readme.md fix-branch fix-source

cls
SETLOCAL

rem   SET DEFAULTS
rem   Note that there must be no spaces between values
rem   and the equals signs... yep, it's a Windows cmd-shell thing!
SET BRANCH="master"
SET REMOTE="origin"
SET MESSAGE="Saving latest work."
SET FILENAME="-A"

rem echo %BRANCH% %REMOTE% %MESSAGE% %FILENAME%
IF not "%~1" == "" ( SET MESSAGE="%~1" )
IF not "%~2" == "" ( SET FILENAME=%~2  )
IF not "%~3" == "" ( SET BRANCH=%~3  )
IF not "%~4" == "" ( SET REMOTE=%~4  )

rem Remove double quotes around BRANCH and REMOTE
SET BRANCH=%BRANCH:"=%
SET REMOTE=%REMOTE:"=%

rem ADD FILES TO SOURCE CONTROL
git status
git add %FILENAME%

rem COMMIT TO LOCAL STAGING AREA
git commit -m %MESSAGE%

rem PUSH TO REMOTE
git push -u %REMOTE% %BRANCH%

EndLocal
