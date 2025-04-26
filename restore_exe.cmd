@echo off
@echo Press enter/return to restore original executable.
@echo To cancel, exit this command window.
@pause
@cd /d "%~dp0"
@copy OR2006C2C.EXE.ORIGINAL OR2006C2C.EXE
@del dinput8.dll
@del OutRun2006Tweaks.ini
@timeout 5
