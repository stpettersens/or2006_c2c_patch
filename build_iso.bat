@rem Please note that genisoimage executable should be in your system PATH variable.
@rem I am using the genisoimage executable from Cygwin x64 with a thin wrapper called
@rem genisoimage.cmd:
@rem https://gist.github.com/stpettersens/a167dea1069657e2149a699d24620fc2
@echo off
@cd /d "%~dp0"
@mkdir iso
@copy or2006_c2c_dl_patch_*.exe iso
@echo Building ISO for NSIS installer...
@genisoimage -V or2006_c2c_patch -o %~dp0/or2006_c2c_dl_patch.iso -R -J %~dp0/iso
