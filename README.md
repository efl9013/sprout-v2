# CAV’25 Artifact #8: SPROUT: A Verifier for Symbolic Multiparty Protocols 
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3970760.svg)](https://doi.org/10.5281/zenodo.3970760) (TODO: change the link) 
<img src="sprout.png" style="display: block; margin: 0 auto; width: 50%;">

## Abstract 
We present Sprout, the tool accompanying submission #202: SPROUT: A Verifier for Symbolic Multiparty Protocols. Sprout is the first sound and complete implementability checker for symbolic multiparty protocols. In a nutshell, implementability is a hyperproperty that characterizes when global, sequential protocol specifications can be realized in a deadlock-free, distributed manner. Sprout supports protocols featuring dependent refinements on message values, loop memory, and multiparty communication with generalized, sender-driven choice. Sprout checks implementability via an optimized, sound and complete reduction to the fixpoint logic muCLP, and uses MuVal as a backend solver for muCLP instances. We evaluate Sprout on an extended benchmark suite of implementable and non-implementable examples, and show that Sprout outperforms its competititors in terms of expressivity and precision, and provides competitive runtime performance. Sprout is open source, and hosted at https://github.com/nyu-acsys/sprout. We provide a Docker image for the purposes of artifact evaluation hosted at (TODO: Zenodo url) with checksum (TODO: checksum). Our artifact evaluation requires at least 2 CPU cores and at least 8GB of memory. We are claiming all three artifact badges: available, functional and reusable. 

### Artifact requirements 
- A Mac machine with Apple silicon that can allocate at least 2 CPU cores and at least 8GB of memory to Docker containers, and with an internet connection
- Estimated completion time: ~45 minutes (Table 1) + ~40 minutes (Table 2)
- The results reported in our paper are from running Sprout natively on a 2024 MacBook Air (M3, 24GB RAM). Estimated execution times in this README are reported from running Sprout in a Docker container with 8GB of memory on the same machine.  


### Structure and content 


The artifact contains the following: 
- Documentation for Sprout (README.pdf)
- A Docker image for Sprout (sprout.tar)
- The md5 hash of the Docker image is `532b4e75bdcffe4c883aecf61371d373`. (TODO: change)
- A software license file (LICENSE) 
- A folder containing the benchmark suite for each tool (examples), with subfolders sprout, sessionstar and rumpsteak

Sprout's evaluation depends on two external software libraries: MuVal and Session*. MuVal is Sprout’s backend muCLP solver, and is available as part of the toolchain [CoAR](https://github.com/hiroshi-unno/coar) (Collection of Automated Reasoners). Session* is the tool accompanying [Zhou et al. 2020], which we compare Sprout against. Because MuVal is essential to Sprout’s functionality, the necessary executables for MuVal, along with its license and documentation, are included in Sprout’s Docker image. On the contrary, Session* is only required for evaluating Sprout’s precision and efficiency. Session* is distributed as a Docker image, available at https://zenodo.org/records/4032454. Thus, we only include instructions for installing Session* from the above link, and do not include Session* itself in our artifact submission. 


## A Getting Started 
---
0. Install and run [Docker](https://docs.docker.com/engine/install/).

All following commands are to be executed from the working directory `sprout-artifact` with the contents listed above.

### Installing Sprout 
1. Unzip `sprout.tar.gz`, which should create `sprout.tar` in the same directory: 
   ```bash
   gunzip sprout.tar.gz
   ```
2. Load the Docker image (may require `sudo` root privileges): 
   ```bash
   docker load < sprout.tar
   ```
3. Run Sprout using an interactive Docker shell. The `-v` flag mounts the folder `sprout-artifact/examples/sprout` containing Sprout’s benchmark suite with read and write permission, to store Sprout's evaluation results locally. 
   ```bash
   docker run -it -v $(pwd)/examples/sprout:/home/opam/sprout/examples/sprout:rw -m="8gb" sprout:latest   
   ```
The Docker container for Sprout starts up in the directory `/home/opam/sprout/query-generator`. 

4. To quicktest Sprout’s functionality in ~1s, run: 
   ```
   ./_build/default/main.exe ../examples/sprout/fibonacci 30 opt parallel 
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
   This completes the installation of Sprout. You may exit the Docker container by running `exit`. 

### Installing Session* 
The following instructions are copied from the README.md file for Session*: we include them here for convenience. 

7. Download the Session* Docker image `artifact.tar.gz` from https://zenodo.org/records/4032454 to the current directory `sprout-artifact`. 

8. Unzip `artifact.tar.gz`, which should create `artifact.tar` in the same directory: 
   ```bash
   gunzip artifact.tar.gz
   ```

9.  Load the Docker image: 
   ```bash
   docker load < artifact.tar
   ```

10. Run Session* using an interactive Docker shell. The `-v` flag again mounts the folder `sprout-artifact/examples/sessionstar` containing Session*’s benchmark suite with read and write permission, to store Session*'s evaluation results locally and enable generation of Table 2 outside of either Docker container.  
    ```bash
    docker run -it -v $(pwd)/examples/sessionstar:/home/sessionstar/examples:rw sessionstar2020/sessionstar:artifact
    ```
    The Docker container for Session* starts up in the directory `/home/sessionstar`.

11. To quicktest Session*’s functionality in ~1s, run: 
    ```bash
    cd examples
    sessionstar Fibonacci.scr Fibonacci A
    ```
    No output is expected. This completes the installation of Session*. You may exit the Docker container by running `exit`. 


## B Step-by-Step Instructions
Our artifact supports the following claims, evidenced by Table 1 and 2 of the tool paper. 
- Claim 1 (Table 1): Sprout’s optimizations to the muCLP encodings presented in the original theory paper [Li et al. 2025] yield a speedup by over two orders of magnitude. 
- Claim 2a (Table 2): Sprout outperforms Session* in terms of *precision*: Sprout correctly classifies the implementability of all benchmarks on which it does not timeout, whereas Session* exhibits many false negatives. 
- Claim 2b (Table 2): Sprout provides competitive runtime performance: Sprout outperforms Session* on binary protocols, and verifies most multiparty protocols in under 10s. 

### Reproducing experiments 
To reproduce Table 1 from the paper: 
1. Start up Sprout's docker container: 
   ```
   docker run -it -v $(pwd)/examples/sprout:/home/opam/sprout/examples/sprout:rw -m="8gb" sprout:latest 
   ```
2. The Docker container should start in the directory `/home/opam/sprout/query-generator`. Run: 
   ```bash
   bash naive_vs_opt.sh 1
   ```
   The above step takes ~45 minutes, and logs Sprout’s raw output in the file `naive_vs_opt_output.txt`, and aggregated output in the file `naive_vs_opt_output_aggregation.txt`, both in `/home/opam/sprout/query-generator`. 
   
3. To consolidate the raw output into Table 1, run: 
   ```bash
   bash create_table1.sh naive_vs_opt_output_aggregation.txt table1_final.txt
   ```

   The output should resemble the following: 
      ```
   Example                        | |P| | SPROUT |     Time    | Naive |     Time    |
   -----------------------------------------------------------------------------------
   figure12-yes                   |  3  |    Y   |    1.6s     |   Y   |    4.4s     |
   figure12-no                    |  3  |    N   |    2.7s     |   N   |    5.2s     |
   TwoBuyer                       |  3  |    Y   |    2.5s     |   ?   |   195.9s    |
   higher-lower-ultimate          |  3  |    Y   |    10.8s    |   ?   |   609.7s    |
   higher-lower-no                |  3  |    N   |    10.1s    |   ?   |   594.2s    |
   symbolic-two-bidder-yes        |  3  |    Y   |    50.2s    |   ?   |   598.7s    |
   symbolic-two-bidder-no1        |  3  |    N   |    49.1s    |   ?   |   557.7s    |
   ```

To reproduce Table 2 from the paper: 

4. Still in Sprout’s Docker container, in the directory `/home/opam/sprout/query-generator`, run: 
   ```bash
   bash verify_all.sh 1 
   ```
   The shell script takes as input a number representing the number of iterations. 
   The above step takes ~30 minutes, and logs Sprout’s raw output in the file `sprout_output.txt`, and Sprout's aggregated output in the file `sprout_output_aggregation.txt`, both in the local mounted folder `sprout-artifact/examples/sprout`. 
2. Exit Sprout's Docker container by running `exit`. 
3. Start up Session*'s Docker container: 
   ```
   docker run -it -v $(pwd)/examples/sessionstar:/home/sessionstar/examples:rw sessionstar2020/sessionstar:artifact
   ```

4. In Session*’s Docker container, run: 
   ```bash
   cd examples 
   bash verify_sessionstar.sh 1 
   ```
   The above step takes ~7 minutes, and logs Session*’s raw output in the file `sessionstar_output.txt`, and aggregated output in the file `sessionstar_output_aggregation.txt`, both in the mounted folder `examples/sessionstar`. 
9. Exit Sprout's Docker container by running `exit`. 

5. In your local machine, to consolidate the aggregated output from both tools into Table 2, run: 
   ```bash
   cd examples 
   sh create_table2.sh sprout/sprout_output_aggregation.txt sessionstar/sessionstar_output_aggregation.txt table2_final.txt  
   ```

Below, we provide further details regarding each experiment. 
### Claim 1: Optimization efficiency 
Table 1 compares the runtime efficiency of Sprout on two different modes: naive and optimized. The naive mode corresponds to implementing the pen-and-paper symbolic algorithm given in [Li et al. 2025]; the optimized mode implements all the optimizations introduced in Section 3.2 of our paper. Sprout allows the user to specify their desired mode using a command line argument. 

We claim that **Sprout's optimizations improve verification efficiency by over two orders of magnitude for protocols with more than 2 transitions**. 

The evaluation script `naive_vs_opt.sh`  iterates over a list of example names, and calls Sprout on naive and optimized mode respectively. The Docker container is initialized with 8GB of memory, killing processes that exceed this limit, and naive mode muCLP instances are given a 300 second timeout. Optimized mode muCLP instances are given a 40 second timeout. 

Our claim can be falsified by examining `table1_final.txt`. 

### Claim 2: Precision and efficiency 
Table 2 compares the precision and runtime efficiency of Sprout against Session*. Precision is measured by the fraction of examples that each tool correctly classifies; efficiency is measured in terms of execution time. 

Regarding precision, we claim that **Sprout correctly classifies the implementability all protocols on which it does not timeout, whereas Session\* rejects most examples introduced in our extended benchmark suite and thus suffers from incompleteness**. Note that because Sprout is an implementability checking tool, precision is equivalent to correctness. 
Regarding efficiency, we claim that **Sprout provides competitive performance for binary protocols, and verifies most multiparty protocols in under 10 seconds**. 

The evaluation scripts `verify_all.sh`  and `verify_sessionstar.sh` iterate over all 37 examples, and log the output to `sessionstar_output.txt` and `sprout_output.txt` respectively.
Note that Sprout's timeout in `verify_all.sh` is set to 40 seconds, whereas the results in Table 2 of the paper, which were run natively on a local machine, assume a timeout of 30 seconds. The increase in timeout is to accommodate the runtime overhead introduced by the Docker container.

We detail the results returned by each tool below. 
Sprout returns one of three results: implementable (`Y`), non-implementable (`N`), inconclusive (`?`), or non-GCLTS (not applicable to this artifact evaluation). Note that non-implementability requires only one valid muCLP instance, whereas implementability requires all muCLP instances to return invalid. Thus, thus non-implementable protocols may timeout on other instances. Further note that Sprout does not eagerly terminate upon finding the first valid muCLP instance, but rather checks all generated muCLP instances in the interest of aiding protocol repair. Inconclusive means that Sprout cannot establish implementability due to timeouts or out of memory errors. 
We classify the output of Session* into three results: implementable (`Y`) means that the projection is defined and local types are computed, non-implementable (`N`) means that the protocol cannot be projected, and inconclusive (`?`) means that Session* aborts for another reason, such as failure to parse or typecheck the input.  
The aggregation shell script copies `table2_empty`, which contains columns 2-4 of Table 2 in the paper, and fills in the remaining columns based on Sprout and Session*'s aggregated output. 

Both claims can be falsified by examining `table2_final.txt`, which includes a column recording the ground truth implementability for each example. 

### A note on performance 
The results reported in our paper are from running Sprout natively on a 2024 MacBook Air (M3, 24GB RAM). The experimental results may slightly vary in part due to factors such as runtime environment and hardware, and in part due to the sources of non-determinism present in MuVal. Any differences that present themselves should not affect the validity of our claims. Nonetheless, we describe below some ways to address potential performance discrepancies that may arise. 

#### Tuning Sprout on individual examples 
We provide command line functionality to tune Sprout's performance on individual examples. 
Running Sprout on an individual example can be done with the following command, from the directory `/home/opam/sprout/query-generator`: 
```
./_build/default/main.exe ../examples/sprout/example-name 5 opt parallel 
```
Sprout's executable takes 4 arguments: a path to the example file, a timeout limit, Sprout's mode, and MuVal's mode. To improve performance and stability, we recommend first increasing the timeout limit, and then trying Sprout on `espresso` mode. `espresso` mode maximally decomposes all conditions that Sprout checks, resulting in more but smaller muCLP instances, which we find MuVal to perform more consistently on. Remember to run `sh cleanup.sh` in between runs!

#### Repeating experiments 
Each shell script is equipped with a parameter that specifies the number of iterations. In case multiple iterations were run, the aggregated result is `Y` iff all iterations return implementable, `N` iff all iterations return non-implementable, and `?` otherwise, and the aggregated time is the mean of all iterations. For running all examples, we additionally provide two shell scripts, located in `/home/opam/sprout/query-generator`: `verify_all_woto.sh` omits the two examples that timeout, thus reducing the experiment time by ~10 minutes, and `verify_all_woto_tuned.sh` additionally tunes Sprout to be the fastest for each example. 

### (Optional) Claim 3: Expressivity 
Section 4.2 of the paper additionally claims that Sprout outperforms its competitors in terms of expressivity, and quantifies this claim using the fraction of the combined benchmark suites from Session* [Zhou et al. 2020], Rumpsteak [Vassor and Yoshida 2024] and Sprout that can be expressed in each tool. As mentioned in the paper, of the 37 benchmarks in total (10 from Session*, 6 from Rumpsteak, 21 from Sprout), Session* can express 35/37, Sprout can express 37/37, whereas Rumpsteak can only express 19/37. We thus decided to omit Rumpsteak from the remainder of our evaluation due to its lack of expressivity, as well as absence of formal guarantees. Nonetheless, we provide the 37 benchmarks we translated into NuScr in the folder `examples/rumpsteak`, so that our rationale may be independently verified. Rumpsteak's artifact can be found at https://zenodo.org/records/12731834.  


## C SPROUT up close 

### Source code overview 
We provide a brief overview of Sprout's source code, which can be found in `/home/opam/sprout/query-generator` of the Docker container as well as at https://github.com/nyu-acsys/sprout/query-generator. Sprout is built using `dune`, and its required dependencies can be found in the `dune-project` file. 
- Processing input protocols: `lexer.mll`, `parser.mly`, `ast.ml`, `error.ml`, `loc.ml`
- Generating conditions for checking GCLTS-eligibility of input protocol: `gclts.ml`, `reach.ml` 
- Generating Coherence Conditions for checking implementability: `prodreach.ml`, `unreach.ml`, `avail.ml`, `scc.ml`, `rcc.ml`, `nmc.ml`
- Generating functional correctness properties: `property_playground.ml`
- Generic library functions: `common.ml`, `print.ml`, `visual.ml`
- Main files: `main.ml`, `config.ml`


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
  Protocols are described in terms of a set of states, a set of state registers, and a set of transitions. The keywords `Initial state: `, `Initial register assignments: ` and `Final states: ` are required syntax. The register assignments, list of transitions, and final states may be empty. States are identified using positive integers and enclosed in parentheses. Protocol participants (`c`, `s`), communication variables (`add`, `x`, `y` etc.) and register variables (`rn`, `ry`) are identified using variable names consisting of alphanumeric characters, with the notable exception that register names cannot end in numbers, and that *primed* variables carry special meaning: they connote register values of the transition post-state. Transition predicates range over the communication variable of the given transition, the set of register variables, and their primed counterparts. Sprout currently supports the following logical operators for transition predicates:
  ```
  | "True" | "False"                 
  | "/\\" | "and" | "\\/" | "or" | "~" | "not" |"->"              
  | '=' | ">=" | "<=" | "!=" | '<' | '>'                     
  | '+' | '-'  | '*'  | '/'  | '%'                     
               
  ```
   Comments are designated by `//`. 

  Sprout’s parser detects ill-formed logical formulas and general syntactic errors, and Sprout’s lightweight typechecker detects out-of-scope variables. For readability, Sprout allows input protocols to omit register equalities of the form `rn'=rn` indicating that register `rn` is unchanged by the present transition, and inserts these missing equalities during preprocessing. 

### Implementability checking 
Sprout's core functionality is checking implementability of symbolic, multiparty protocols. In a nutshell, implementability is a hyperproperty that characterizes when global, sequential protocol specifications can be realized in a deadlock-free, distributed manner. 
To use Sprout to check implementability of an example protocol, from the directory `query-generator` run:
```
dune exec sprout /path/to/example-name 5 opt parallel 
```
Sprout's executable takes 4 arguments: a path to the example file, a timeout limit (in seconds), Sprout's mode, and MuVal's mode. 
The timeout limit is applied to each muCLP instance that Sprout generates and discharges to MuVal, and thus the total verification time can far exceed this number. Sprout supports four modes that correspond to different degrees of granularity in muCLP instance generation: `espresso`, `v60`, `chemex` and `coldbrew`. `espresso` mode maximally decomposes all conditions that Sprout checks into numerous small muCLP instances, `coldbrew` generates the fewest muCLP instances, but each instance is extremely large.  To improve performance and stability, we recommend first increasing the timeout limit, and then trying Sprout on `espresso` mode. `espresso` mode maximally decomposes all conditions that Sprout checks, resulting in more but smaller muCLP instances, which we find MuVal to perform more consistently on. Remember to run `sh cleanup.sh` in between runs!

### Using Sprout feedback for protocol repair 
Sprout's output prints the result of every muCLP instance it generates and discharges to MuVal. In fine-grained modes, Sprout generates muCLP instances whose filenames point to specific transitions in the protocol that violate implementability. For example, part of the output for the running example in Section 2 of the paper, `symbolic-two-bidder-no1`, contains the following:
```
| b2_scc_47_4.hes                | 0.3117               | valid      |
```
In the file name `b2_scc_47_4.hes`, `47` refers to the transition `(4) b2->b1:b{b>rzb/\b<rc/\rzb'=b} (7)` in the input protocol, and `4` refers to the state `(4)` that is simultaneously reachable for participant `b2`. 

### (Optional) Checking functional properties 
Sprout enables users to write general properties in muCLP using the predicates we define for checking implementability: `reach`, `prodreach`, `unreach`, `stcon`. The `generate_property_query` function in file `query-generator/property_playground.ml` takes as arguments a protocol `prot`, a string encoding the property as a muCLP query `property`, a file name for the generated muCLP instance `filename`, and a directory name `dirname`. It generates a muCLP instance titled `filename_hes` in directory `/path/to/example/dirname`, with the query body as specified by `property`, and with the definitions of the recursive predicates in the body. 
As a convention, to remain consistent with all other queries generated by Sprout, we prefer to state properties in negation form. 

For example, the following muCLP query states in negation form that when the `higher-lower` protocol terminates in state `(7)`, either participant `c` has correctly guessed participant `a`'s secret number, or participant `c` has run out of attempts. Participant `c`'s guess is stored in register `rx`, participant `a`'s secret number is stored in register `rn`, and the maximum number of attempts is stored in register `rt`. 
```
let higher_lower_termination : string = 
	"exists  (rn: int) (rt: int) (rx: int).
	 reach 7 rn rt rx /\\ rn != rx /\\ rt != 1"
```
To check this property, uncomment line 300 from `query-generator/main.ml`: 
```
(* generate_property_query protocol higher_lower_termination "termination_property" dirname;
```

Run Sprout on the `higher-lower` example: 
```
dune exec sprout ../examples/sprout/higher-lower 30 opt parallel
```
In Sprout's output, you should see the following line: 
```
| termination_property.hes       | 0.6164               | invalid    |
```
Because the property is stated in negation form, MuVal returning `invalid` means the property is satisfied. 


### Integrating Sprout into existing toolchains 
We envision Sprout as a preprocessing step for protocol verification toolchains that center around the construct of a global protocol. Sprout is open source, and complements existing toolchains by providing sound and complete implementability checking for an expressive class of protocols, which can serve as the first step to synthesizing correct-by-construction distributed implementations. 

## D References 
---
[Li et al. 2025] Elaine Li, Felix Stutz, Thomas Wies and Damien Zufferey. Characterizing Implementability of Global Protocols with Infinite States and Data. To appear in Proc. ACM Program. Lang. 9, OOPSLA (2025) https://doi.org/10.48550/arXiv.2411.05722

[Vassor and Yoshida 2024] Martin Vassor and Nobuko Yoshida. Refinements for Multiparty Message-Passing Protocols: Specification-Agnostic Theory and Implementation. In 38th European Conference on Object-Oriented Programming (ECOOP 2024). Leibniz International Proceedings in Informatics (LIPIcs), Volume 313, pp. 41:1-41:29, Schloss Dagstuhl – Leibniz-Zentrum für Informatik (2024) https://doi.org/10.4230/LIPIcs.ECOOP.2024.41

[Zhou et al. 2020] Fangyi Zhou, Francisco Ferreira, Raymond Hu, Rumyana Neykova, and Nobuko Yoshida. Statically verified refinements for multiparty protocols. Proc. ACM Program. Lang. 4, OOPSLA, Article 148 (2020), 30 pages. https://doi.org/10.1145/3428216