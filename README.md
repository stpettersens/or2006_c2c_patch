### OutRun 2006 Coast 2 Coast Patch Installer
> This patch installer provides no disc DRM executable, fix for missing lens flare and bloom, etc.

**IMPORTANT: You must legally own a copy of OutRun 2006 Coast 2 Coast to use this patch installer.**

This patch installer also uses the release of https://github.com/emoose/OutRun2006Tweaks for additional tweaks.

* Download the release [or2006_c2c_dl_patch_0.6.1.exe](https://github.com/stpettersens/or2006_c2c_patch/releases/download/v0.6.1/or2006_c2c_dl_patch_0.6.1.exe).

* If you would prefer an ISO, you can download [or2006_c2c_patch.iso](https://github.com/stpettersens/or2006_c2c_patch/releases/download/v0.6.1/or2006_c2c_dl_patch.iso).

#### Build from source

* Requires [NSIS 3.11+](https://nsis.sourceforge.io/Download) (Unicode)
* [Inetc plug-in](https://nsis.sourceforge.io/Inetc_plug-in) (Unicode)
* [Nsisunz plug-in](https://nsis.sourceforge.io/Nsisunz_plug-in) (Unicode)

With the required plugins installed and this repository cloned or downloaded, you can build the installer
using `MakeNSISW` or `makensis`.

#### Build executable installer.

Requires that `makensis` is on system PATH.

> build_exe.bat

#### Build ISO image constaining executable installer.

First run `build_exe.bat` and [genisoimage executable/wrapper](https://gist.github.com/stpettersens/a167dea1069657e2149a699d24620fc2)
must be in your system PATH.

I obtained the `genisoimage.exe` executable from [Cygwin x64](https://cygwin.com/install.html) project.

> build_iso.bat

#### License
* Patch installer script is licensed under the MIT License.
* OutRun2006Tweaks is also licensed under the MIT License.
* OutRun 2006 Coast 2 Coast game data is licensed under its own EULA.
