# Stage 1: Identifying the builder for coar 
FROM coar:latest AS builder

# Stage 2: Builder and executer for sprout
# Two stages combined because we need dune to run tests anyway 
# Although we can probably get rid of the reliance later by executing the .exe file directly, not critical for now 
# We need opam to install dune 
FROM ocaml/opam:ubuntu-22.04-ocaml-5.2 

# Install system dependencies (as root)
RUN sudo apt-get update && sudo apt-get install -y \
        vim \ 
        libblas-dev \
        libffi-dev \
        libglpk-dev \
        libgmp-dev \
        liblapack-dev \
        libmpfr-dev \
        pkg-config \
        python3 \
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists/*

# Install dune 
USER opam:opam
RUN opam update 
RUN opam install dune 

# Copy project files
WORKDIR /home/opam/sprout/examples/sprout
COPY --chown=opam:opam ./examples/sprout .
WORKDIR /home/opam/sprout/query-generator
COPY --chown=opam:opam ./query-generator . 

# Install dependencies, set config file and build
WORKDIR /home/opam/sprout/query-generator
RUN opam install . --deps-only && \
    opam install menhir && \ 
    opam install sexplib && \
    eval $(opam env) && \
    echo "let coar_location = \"/home/opam/sprout/muval\"" >> config.ml && \ 
    dune build 

# Important for coar: minimal amount of z3 required for coar to call libz3 
COPY --from=builder /home/opam/.opam/5.2/lib/stublibs/libz3.so /usr/lib/x86_64-linux-gnu/
COPY --from=builder /home/opam/.opam/5.2/lib/stublibs/libz3.so /usr/lib/aarch64-linux-gnu/

# Copy coar's _build and config folders from builder 
WORKDIR /home/opam/sprout/muval/_build 
COPY --from=builder /home/opam/coar/_build /home/opam/sprout/muval/_build 
WORKDIR /home/opam/sprout/muval/config 
COPY --from=builder /home/opam/coar/config /home/opam/sprout/muval/config 
WORKDIR /home/opam/sprout/muval
COPY --from=builder /home/opam/coar/README.md /home/opam/coar/LICENSE /home/opam/coar/CoAR.opam /home/opam/sprout/muval

WORKDIR /home/opam/sprout/query-generator



