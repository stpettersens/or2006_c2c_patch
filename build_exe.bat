@rem Please note that makensis executable should be in your system PATH variable.
@echo off
@cd /d "%~dp0"
@echo Building NSIS installer EXE...
@makensis or2006_c2c_dl_patch.nsi
@pause
