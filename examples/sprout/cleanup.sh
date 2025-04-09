# cleanup.sh
#!/bin/bash

rm -rf ./*-generated
rm -rf ./*-generated-gclts
rm -rf ./*.fst 
rm -rf ./*.fsm
echo "Removed generated files."
