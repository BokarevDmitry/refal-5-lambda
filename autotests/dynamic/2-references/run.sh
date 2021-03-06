#!/bin/bash

rm -f *.rasl-module *.rasl caller
../../../bin/rlc --keep-rasls -OC -R module.sref
../../../bin/rlc --keep-rasls -OC -R A-BCE.sref -r B-D -r C-D -r E-F
../../../bin/rlc --keep-rasls -OC -R B-D.sref -r D-G
../../../bin/rlc --keep-rasls -OC -R C-D.sref -r D-G
../../../bin/rlc --keep-rasls -OC -R D-G.sref -r G
../../../bin/rlc --keep-rasls -OC -R E-F.sref -r F-E
../../../bin/rlc --keep-rasls -OC -R F-E.sref -r E-F
../../../bin/rlc --keep-rasls -OC -R G.sref
../../../bin/rlmake --keep-rasls -X-OC -X--markup-context caller.ref
./caller
if [[ $? -gt 0 ]]; then
  echo TEST FAILED!
  exit 1
else
  echo Test OK!
  rm -f *.rasl-module *.rasl caller
fi
