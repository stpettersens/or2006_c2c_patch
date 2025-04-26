@echo off
@cd /d "%~dp0"
@echo Patching to fix missing lens flare and bloom...
@copy Media\lens_flare_offset.bin Common\lens_flare_offset.bin
@timeout 3
