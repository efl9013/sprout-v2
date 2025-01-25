# cleanup.sh
#!/bin/bash

rm -rf examples/*-generated
rm -rf examples/*-generated-gclts
rm -rf examples/*/*-generated
rm -rf examples/*/*-generated-gclts
echo "Removed generated files."
