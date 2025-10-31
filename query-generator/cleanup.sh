#!/bin/bash

cd ../examples/sprout
rm -rf ./*-generated
rm -rf ./*-generated-gclts
rm -rf ./*.fst 
rm -rf ./*.fsm
echo "Removed generated files from examples/sprout."

cd ../sprout-v2
rm -rf ./*-generated
rm -rf ./*-generated-gclts
rm -rf ./*.fst 
rm -rf ./*.fsm
echo "Removed generated files from examples/sprout-v2." 

