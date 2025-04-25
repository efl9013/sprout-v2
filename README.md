# SPROUT: A Verifier for Symbolic Multiparty Protocols 
<img src="sprout.png" style="display: block; margin: 0 auto; width: 50%;">

## Abstract 
Sprout is the first sound and complete implementability checker for symbolic multiparty protocols. In a nutshell, implementability is a hyperproperty that characterizes when global, sequential protocol specifications can be realized in a deadlock-free, distributed manner. Sprout supports protocols featuring dependent refinements on message values, loop memory, and multiparty communication with generalized, sender-driven choice. Sprout checks implementability via an optimized, sound and complete reduction to the fixpoint logic muCLP, and uses MuVal as a backend solver for muCLP instances.

### Installing Sprout 
Run the installation shell script to install MuVal, install Sprout, and configure the path to MuVal: 
   ```
   sh installation.sh
   ```

### Source code overview 
Sprout is built using `dune`, and its required dependencies can be found in the `dune-project` file. 
- Processing input protocols: `lexer.mll`, `parser.mly`, `ast.ml`, `error.ml`, `loc.ml`
- Generating conditions for checking GCLTS-eligibility of input protocol: `gclts.ml`, `reach.ml` 
- Generating Coherence Conditions for checking implementability: `prodreach.ml`, `unreach.ml`, `avail.ml`, `scc.ml`, `rcc.ml`, `nmc.ml`
- Generating functional correctness properties: `property_playground.ml`
- Generic library functions: `common.ml`, `print.ml`, `visual.ml`
- Main files: `main.ml`, `config.ml`


### Input protocol syntax 
We give a walkthrough of SPROUT’s input protocol format, using `calculator` as a simple example: 
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

### Checking functional properties 
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

## References 
---
[Li et al. 2025] Elaine Li, Felix Stutz, Thomas Wies and Damien Zufferey. Characterizing Implementability of Global Protocols with Infinite States and Data. To appear in Proc. ACM Program. Lang. 9, OOPSLA (2025) https://doi.org/10.48550/arXiv.2411.05722
