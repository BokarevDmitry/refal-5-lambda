@echo off
erase *.rasl-module *.rasl *.exe
call ..\..\..\bin\rlc --keep-rasls -OC -R module.sref
call ..\..\..\bin\rlmake --keep-rasls -X-OC -X--markup-context caller.ref -r module
caller.exe
if errorlevel 1 (
  echo TEST FAILED!
) else (
  echo Test OK!
  erase *.rasl-module *.rasl *.exe
)
