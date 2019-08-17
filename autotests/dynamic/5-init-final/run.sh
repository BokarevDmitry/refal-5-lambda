#!/bin/bash

rm -f *.rasl-module *.rasl caller
../../../bin/srefc --keep-rasls -OC -R module.sref -r swap
../../../bin/srefc --keep-rasls -OC -R swap.sref
../../../bin/srmake --keep-rasls -X-OC -X--markup-context caller.ref
./caller
if [ $? -gt 0 ]; then
  echo TEST FAILED!
else
  echo Test OK!
  rm -f *.rasl-module *.rasl caller
fi
