@echo off
@cd /d "%~dp0"
@echo Backing up original executable...
@copy OR2006C2C.EXE OR2006C2C.EXE.ORIGINAL
@echo Patching game executable...
@copy patch\OR2006C2C.exe OR2006C2C.EXE
@copy patch\dinput8.dll dinput8.dll
@copy patch\OutRun2006Tweaks.ini OutRun2006Tweaks.ini
@timeout 3
