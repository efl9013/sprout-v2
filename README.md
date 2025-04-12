# # CAV’25 Artifact #8
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3970760.svg)](https://doi.org/10.5281/zenodo.3970760) (TODO: change the link) 

> # *SPROUT: A Verifier for Symbolic Multiparty Protocols*
> 
> #### Elaine Li, Felix Stutz, Thomas Wies and Damien Zufferey
![](sprout.png)<!-- {"width":288} -->

We present Sprout, the tool accompanying submission #202: SPROUT: A Verifier for Symbolic Multiparty Protocols. Sprout is the first sound and complete implementability checker for symbolic multiparty protocols. Sprout supports protocols featuring dependent refinements on message values, loop memory, and multiparty communication with generalized, sender-driven choice. Sprout checks implementability via an optimized, sound and complete reduction to the fixpoint logic muCLP, and uses MuVal as a backend solver for muCLP instances. We evaluate Sprout on an extended benchmark suite of implementable and non-implementable examples, and show that Sprout outperforms its competititors in terms of expressivity and precision, and provides competitive runtime performance. Sprout is open source, and hosted at https://github.com/nyu-acsys/sprout. We provide a Docker image for the purposes of artifact evaluation hosted at (TODO: Zenodo url) with checksum (TODO: checksum). We are claiming all three artifact badges: available, functional and reusable. 

The artifact contains the following: 
- Documentation for Sprout (README.pdf)
- A Docker image for Sprout (sprout.tar)
- The md5 hash of the Docker image is `532b4e75bdcffe4c883aecf61371d373`. (TODO: change)
- A software license file (LICENSE) 
- A folder containing the benchmark suite (examples)

Sprout's evaluation depends on two external software libraries: MuVal and Session*. MuVal is Sprout’s backend muCLP solver, and is available as part of the toolchain [CoAR](https://github.com/hiroshi-unno/coar) (Collection of Automated Reasoners). Session* is the tool accompanying [Zhou et al. 2020], which we compare Sprout against. Because MuVal is essential to Sprout’s functionality, the necessary executables for MuVal, along with its license and documentation, are included in Sprout’s Docker image. On the contrary, Session* is only required for evaluating Sprout’s precision and efficiency. Session* is distributed as a Docker image, available at https://zenodo.org/records/4032454. Thus, we only include instructions for installing Session* from the above link, and do not include Session* itself in our artifact submission. 

All execution times reported are from a 2024 MacBook Air (M3, 24GB RAM). 

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
The following instructions are copied from the README.md file for Session*: we include them here for convenience. 
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
Our artifact supports the following claims, evidenced by Table 1 and 2 of the tool paper. 
- Claim 1 (Table 1): Sprout’s optimizations to the muCLP encodings presented in the original theory paper yield a speedup by over two orders of magnitude. 
- Claim 2a (Table 2): Sprout outperforms Session* in terms of *precision*: Sprout correctly classifies the implementability of all benchmarks on which it does not timeout, whereas Session* exhibits an abundance of false negatives. 
- Claim 2b (Table 2): Sprout provides competitive runtime performance: Sprout outperforms Session* on binary protocols, and verifies most multiparty protocols in under 10s, with the exception of 2 timeouts. 

### Reproducing experiments 
To reproduce Table 1 from the paper: 
1. In Sprout’s Docker image, in the directory `/home/opam/sprout/query-generator`, run: 
   ```bash
   bash naive_vs_opt.sh 
   ```
   The above step takes (a looooong time, TODO), and logs Sprout’s raw output in the file `naive_vs_opt_output.txt`. 
2. To consolidate the raw output into Table 1, run: 
   ```bash
   sh aggregate_naive_vs_opt_output.sh 
   ```
3. To view the completed Table 2, run: 
   ```bash
   cat table1_final.txt 
   ```

To reproduce Table 2 from the paper: 
1. In Sprout’s Docker image, in the directory `/home/opam/sprout/query-generator`, run: 
   ```bash
   bash verify_all.sh 1 
   ```
   The shell script takes as input a number representing the number of iterations. 
   The above step takes ~30 minutes, and logs Sprout’s raw output in the file `sprout_output.txt` inside the mounted folder `examples/sprout`. 
2. To aggregate the raw output from Sprout into the corresponding columns of Table 2, run: 
   ```bash
   bash aggregate_sprout_output.sh 
   ```
3. To view the partially completed Table 2, run: 
   ```bash
   cat table2_final.txt 
   ```
4. In Session*’s Docker image, run: 
   ```bash
   cd examples 
   bash verify_sessionstar.sh 1 
   ```
   The above step takes ~x minutes, and logs Session*’s raw output in the file `sessionstar_output.txt` inside the mounted folder `examples/sessionstar`. 
5. To aggregate the raw output from Session* into the corresponding columns of Table 2, run:  
   ```
   bash aggregate_sessionstar_output.sh 
   ```
6. To view the completed Table 2, run: 
   ```bash
   cat table2_final.txt 
   ```

Below, we provide further details regarding each experiment. 
### Claim 1: Optimization efficiency 
Table 1 compares the runtime efficiency of Sprout on two different modes: naive and optimized. The naive mode corresponds to implementing the pen-and-paper symbolic algorithm given in [Li et al. 2024]; the optimized mode implements all the optimizations introduced in Section 3.2 of our paper. Sprout allows the user to specify their desired mode using a command line argument. 

We claim that ~Sprout's optimizations improve verification efficiency by over two orders of magnitude for protocols with more than 2 transitions~. 

The shell script `naive_vs_opt.sh`  iterates over a list of example names, and calls Sprout on naive and optimized mode respectively. The function `run_with_limits` imposes a memory limit of 16GB by monitoring the memory usage of the process `main.exe` every 0.5 seconds.  

Our claim can be falfisied by examining `table1_final.txt`. 

### Claim 2: Precision and efficiency 
Table 2 compares the precision and runtime efficiency of Sprout against Session*. Precision is measured by the fraction of examples that each tool correctly classifies; efficiency is measured in terms of execution time. 

Regarding precision, we claim that ~Sprout correctly classifies the implementability all protocols on which it does not timeout, whereas Session* rejects most examples introduced in our extended benchmark suite and thus suffers from incompleteness~. Note that because Sprout is an implementability checking tool, precision is equivalent to correctness. 
Regarding efficiency, we claim that ~Sprout provides competitive performance for binary protocols, and verifies most multiparty protocols in under 10 seconds~. 

The shell scripts `verify_all.sh`  and `verify_sessionstar.sh` iterate over all 37 examples, and log the output to `sessionstar_output.txt` and `sprout_output.txt` respectively.
Note that Sprout's timeout in `verify_all.sh` is set to 40 seconds, whereas the results in Table 2 of the paper, which were run natively on a local machine, assume a timeout of 30 seconds. The increase in timeout is to accommodate the runtime overhead introduced by the Docker container.

We detail the results returned by each tool below. 
Sprout returns one of three results: implementable (`Y`), non-implementable (`N`), inconclusive (`?`), or non-GCLTS (not applicable to this artifact evaluation). Note that non-implementability requires only one valid muCLP instance, whereas implementability requires all muCLP instances to return invalid. Thus, thus non-implementable protocols may timeout on other instances. Further note that Sprout does not eagerly terminate upon finding the first valid muCLP instance, but rather checks all generated muCLP instances in the interest of aiding protocol repair. Inconclusive means that Sprout cannot establish implementability due to timeouts. 
We classify the output of Session* into three results: implementable (`Y`) means that the projection is defined and local types are computed, non-implementable (`N`) means that the protocol cannot be projected, and inconclusive (`?`) means that Session* aborts for another reason, such as failure to parse or typecheck the input.  
The aggregation shell scripts copy `table2_empty`, which contains columns 2-4 of Table 2 in the paper, and fill in the remaining columns. 
In case multiple iterations were run, the final result is `Y` iff all iterations return implementable, `N` iff all iterations return non-implementable, and `?` otherwise, and the final time is the mean of all iterations.  

Both claims can be falsified by examining `table2_final.txt`. 

### (Optional) Claim 3: Expressivity 
Section 4.2 of the paper additionally claims that Sprout outperforms its competitors in terms of expressivity, and quantifies this claim using the fraction of the combined benchmark suites from Session* [Zhou et al. 2020], Rumpsteak [Vassor and Yoshida 2024] and Sprout that can be expressed in each tool. As mentioned in the paper, of the 37 benchmarks in total (10 from Session*, 6 from Rumpsteak, 21 from Sprout), Session* can express 35/37, Sprout can express 37/37, whereas Rumpsteak can only express 19/37. We thus decided to omit Rumpsteak from the remainder of our evaluation due to its lack of expressivity, as well as absence of formal guarantees. Nonetheless, we provide the 37 benchmarks we translated into NuScr in the folder `examples/rumpsteak`, so that our rationale may be independently verified. Rumpsteak's artifact can be found at https://zenodo.org/records/12731834.  

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

### Using Sprout feedback for protocol repair 

### Integrating Sprout into existing toolchains 
We envision Sprout as a preprocessing step for protocol verification toolchains that center around the construct of a global protocol. Sprout complements existing toolchains by providing sound and complete implementability checking for an expressive class of protocols, which can serve as the first step to synthesizing correct-by-construction distributed implementations. 


## D References 
[Li et al. 2024] Elaine Li, Felix Stutz, Thomas Wies and Damien Zufferey. Characterizing Implementability of Global Protocols with Infinite States and Data. To appear in Proc. ACM Program. Lang. 9, OOPSLA (2025) ~[https://doi.org/10.48550/arXiv.2411.05722](https://doi.org/10.48550/arXiv.2411.05722)~

[Vassor and Yoshida 2024] Martin Vassor and Nobuko Yoshida. Refinements for Multiparty Message-Passing Protocols: Specification-Agnostic Theory and Implementation. In 38th European Conference on Object-Oriented Programming (ECOOP 2024). Leibniz International Proceedings in Informatics (LIPIcs), Volume 313, pp. 41:1-41:29, Schloss Dagstuhl – Leibniz-Zentrum für Informatik (2024) https://doi.org/10.4230/LIPIcs.ECOOP.2024.41

[Zhou et al. 2020] Fangyi Zhou, Francisco Ferreira, Raymond Hu, Rumyana Neykova, and Nobuko Yoshida. Statically verified refinements for multiparty protocols. Proc. ACM Program. Lang. 4, OOPSLA, Article 148 (2020), 30 pages. https://doi.org/10.1145/3428216