@echo off

git add .
git commit -m "Automatic commit %date%"
git pull --rebase

pause
