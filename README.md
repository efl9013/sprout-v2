# # CAV’25 Artifact #8 Overview
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3970760.svg)](https://doi.org/10.5281/zenodo.3970760) (TODO: change the link) 

> # *SPROUT: A Verifier for Symbolic Multiparty Protocols*
> 
> #### Elaine Li, Felix Stutz, Thomas Wies and Damien Zufferey
![](sprout.png)<!-- {"width":288} -->
We present Sprout, the first sound and complete implementability checker for symbolic multiparty protocols. Sprout supports protocols with dependent refinements on message values, loop memory, and multiparty communication with generalized, sender-driven choice. Sprout checks implementability via an optimized, sound and complete reduction to the fixpoint logic muCLP, and uses MuVal as a backend solver for muCLP instances. We evaluate Sprout on an extended benchmark suite of implementable and non-implementable examples, and show that Sprout outperforms its competititors in terms of expressivity and precision, and provides competitive runtime performance. Sprout additionally provides support for verifying custom functional correctness properties beyond implementability.

The artifact contains the following: 
- Documentation for Sprout (README.pdf)
- A Docker image for Sprout (sprout.tar)
- The md5 hash of the Docker image is `532b4e75bdcffe4c883aecf61371d373`. (TODO: change)
- A software license file (LICENSE) 
- A folder containing the benchmark suite for Session* (sessionstar)

This artifact evaluation depends on two external software libraries: MuVal and Session*. MuVal is Sprout’s backend muCLP solver, and is available as part of the toolchain [CoAR](https://github.com/hiroshi-unno/coar) (Collection of Automated Reasoners). Session* is the tool accompanying [Zhou et al. 2020], which we compare Sprout against. Because MuVal is essential to Sprout’s functionality, the necessary executables for MuVal, along with its license and documentation, are included in Sprout’s Docker image. On the contrary, Session* is only required for evaluating Sprout’s precision and efficiency. Session* is distributed as a Docker image, available at https://zenodo.org/records/4032454. Thus, we only include instructions for installing Session* from the above link, and do not include Session* itself in our artifact submission. 

All execution times reported are from a 2024 MacBook Air (M3, 16GB RAM). 

## A Getting Started 
---
0. Install and run [Docker](https://docs.docker.com/engine/install/).
### Installing Sprout 
2. Unzip `sprout.tar.gz`, which should create `sprout.tar` in the same directory: 
   ```bash
   gunzip sprout.tar.gz
   ```
3. Load the Docker image: 
   ```bash
   docker load < sprout.tar
   ```
4. Run Sprout using an interactive Docker shell, mounting the folder `examples/sprout` containing Sprout’s benchmark suite with read and write permission: 
   ```bash
   docker run -it sprout:latest -v $(pwd)/examples/sprout:/home/opam/sprout/examples:rw 
   ```
5. The Docker container for Sprout starts up in the directory `/home/opam/sprout/query-generator`. 
6. To quicktest Sprout’s functionality in ~1s, run: 
   ```
   ./_build/default/main.exe ../examples/sprout/fibonacci 5 opt parallel 
   ```
   The expected output is: 
   ```
   Checking GCLTS eligibility...
   GCLTS eligible
   
   Results:
   | Filename                       | Execution Time (s)   | Result     |
   |--------------------------------|----------------------|------------|
   | df.hes                         | 0.7136               | invalid    |
   | det.hes                        | 0.3298               | invalid    |
   
   Total time:1.043359
   
   Checking implementability...
   Binary protocol, implementable
   
   Total verification time: 1.043359
   ```
   This completes the installation of Sprout. 

### Installing Session* 
The following instructions are copied from the README.md file for Session*: we repeat them here for convenience. 
7. Download the Session* Docker image `artifact.tar.gz` from https://zenodo.org/records/4032454 to the current working directory. 
8. Unzip `artifact.tar.gz`, which should create `artifact.tar` in the same directory: 
   ```bash
   gunzip artifact.tar.gz
   ```
9. Load the Docker image: 
   ```bash
   docker load < artifact.tar
   ```
10. Run Session* using an interactive Docker shell, mounting the folder `sessionstar` containing the Scribble benchmark suite with read and write permission: 
    ```bash
    docker run -it -p 3000:3000 -v $(pwd)/examples/sessionstar:/home/sessionstar/examples:rw sessionstar2020/sessionstar:artifact
    ```
11. The Docker container for Session* starts up in the directory `/home/sessionstar` and can read and write files from the folder `sessionstar`. 
12. To quicktest Session*’s functionality in ~1s, run: 
    ```bash
    cd examples
    sessionstar Fib.scr Fib A
    ```
    No output is expected. This completes the installation of Session*. 

## B Step-by-Step Instructions
---
Our artifact supports the following claims, whose evidence is summarized in Table 1 and 2 of the tool paper. 
- Claim 1 (Table 1): Sprout’s optimizations to the muCLP encodings presented in the original theory paper yield a speedup by over two orders of magnitude. 
- Claim 2a (Table 2): Sprout outperforms Session* in terms of *precision*: Sprout correctly classifies the implementability of all benchmarks on which it does not timeout, whereas Session* exhibits an abundance of false negatives. 
- Claim 2b (Table 2): Sprout provides competitive runtime performance: Sprout outperforms Session* on binary protocols, and verifies most multiparty protocols in under 10s, with the exception of 2 timeouts. 

### Reproducing experiments 
To reproduce Table 1 from the tool paper, perform the following steps: 
1. In Sprout’s Docker image, in the directory `/home/opam/sprout/query-generator`, run: 
   ```bash
   bash naive_vs_opt.sh 
   ```
2. The above step takes (a looooong time, TODO), and logs Sprout’s raw output in the file `naive_vs_opt_output.txt`. 
3. To consolidate the raw output into Table 1, run: 
   ```bash
   sh process_naive_vs_opt.sh (TODO: this isn't actually implemented yet) 
   ```

To reproduce Table 2 from the tool paper, perform the following steps: 
1. In Sprout’s Docker image, in the directory `/home/opam/sprout/query-generator`, run: 
   ```bash
   bash verify_all.sh 
   ```
2. The above step takes ~30 minutes, and logs Sprout’s raw output in the file `sprout_output.txt` inside the mounted folder `examples/sprout`. 
3. In Session*’s Docker image, run: 
   ```bash
   cd examples 
   bash verify_sessionstar.sh  
   ```
4. The above step takes ~xminutes, and logs Session*’s raw output in the file `sessionstar_output.txt` inside the mounted folder `examples/sessionstar`. 
5. To consolidate the raw output from both tools into Table 2, run: 
   ```
   sh process_naive_vs_opt.sh (TODO: this isn't actually implemented yet) 
   ```

Below, we provide further details regarding each experiment. 
### Claim 1: Optimization efficiency 
### Claim 2a: Precision 
### Claim 2b: Efficiency 


## C SPROUT up close 
---
### Input protocol syntax 
- We give a walkthrough of SPROUT’s input protocol format, using `calculator` as a simple example: 
  ```
  Initial state: (0)
  Initial register assignments: rn=0, ry=0 
  (0) c->s:add{add=1} (1)
  (1) c->s:x{rn'=x} (2)
  (2) c->s:y{ry'=y} (3)
  (3) s->c:r{r=rn+ry/\ry'=0/\rn'=0} (0)
  (0) c->s:mult{mult=2} (4)
  (4) c->s:x{rn'=x} (5)
  (5) c->s:y{ry'=y} (6)
  (6) s->c:r{r=rn*ry/\ry'=0/\rn'=0} (0)
  (0) c->s:quit{quit=3} (7)
  (7) s->c:term{term=4} (8)
  Final states: (8)
  ```
  Protocols are described in terms of a set of states, a set of state registers, and a set of transitions. The keywords `Initial state: `, `Initial register assignments: ` and `Final states: ` are required syntax. The register assignments, list of transitions, and final states may be empty. States are identified using positive integers and enclosed in parentheses. Protocol participants (`c`, `s`), communication variables (`add`, `x`, `y` etc.) and register variables (`rn`, `ry`) are identified using variable names consisting of alphanumeric characters, with the notable exception that register names cannot end in numbers, and that *primed* variables carry special meaning: they connote register values of the transition post-state. Transition predicates range over the communication variable of the given transition, the set of register variables, and their primed counterparts. The logical operators supported in transition predicates can be found in `query-generator/lexer.mll` of the source files. 

  Sprout’s parser detects ill-formed logical formulas and general syntactic errors, and Sprout’s lightweight typechecker detects out-of-scope variables. For readability, Sprout allows input protocols to omit register equalities of the form `rn'=rn` indicating that register `rn` is unchanged by the present transition, and inserts these missing equalities during preprocessing. 

### Interpreting SPROUT feedback 
