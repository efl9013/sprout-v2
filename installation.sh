#!/bin/bash

# Clone MuVal from GitHub
git clone https://github.com/hiroshi-unno/coar muval

cd muval 

# Follow CoAR installation instructions
opam install . --deps-only 
dune build main.exe 

# Write the correct directory into config.ml 
cd ..
current_dir=$(pwd)
cd query-generator 
echo "let coar_location = \"$current_dir/muval\"" >> config.ml

# Install SPROUT
opam install . --deps-only
dune build 
