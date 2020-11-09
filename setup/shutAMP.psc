; shutAMP v2.1 MakePiMP Configuration Script
; (d) by dUcA 2oo2.

Name shutAMP
Text This will install shutAMP v2.1 for Winamp on your computer
OutFile shutAMP.exe
SetOutPath $VISDIR
AddFile gen_shutAMP.v21.dll
AddFile shutAMP.dll
AddFile shutAMP.txt
ExecFile "$WINDIR\notepad.exe" $VISDIR\shutAMP.txt
