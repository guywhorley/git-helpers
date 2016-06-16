@echo off
rem  git add, git commit, git push in one step
rem  Only happy path is considered. Contains no error checking.
rem
rem   Syntax: gadd %1 %2 %3 %4
rem
rem   %1 - file to add, "*" or "./someFile.txt"
rem   %2 - commit message, enclosed in double quotes
rem   %3 - remote repo
rem  %4 - branch

rem add to source control
cls
git status
git add %1

rem commit
git status
git commit -m %2

rem push to remote 
git push -u %3 %4
