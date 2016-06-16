@echo off
rem  git add, git commit, git push to origin in one step
rem  Only happy path is considered. Contains no error checking.
rem
rem  Note: a remote called 'origin' must exist in the repository.
rem
rem   Syntax: gadd %1 %2 %3
rem
rem   %1 - file to add, "*" or "./someFile.txt"
rem   %2 - commit message, enclosed in double quotes
rem   %3 - branch


rem add to source control
cls
git status
git add %1

rem commit
git status
git commit -m %2

rem push to remote
git push -u origin %3
