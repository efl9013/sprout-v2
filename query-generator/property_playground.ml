open Util
open Ast 
open Common 
open Prodreach
open Unreach
open Reach
open Avail 
open Printf
open Unix 
open Filename 

let generate_property_query (prot: symbolic_protocol) (property: string) (filename: string) (dirname: string) : unit = 
	let property_body = 
	property ^ 
	"\ns.t.\n" ^ 
	generate_pairreach prot ^ 
	"\n" ^ 
	generate_reach_va prot ^ 
	"\n" 
	in 
	write_to_file (Filename.concat dirname (filename ^ ".hes")) property_body

let higher_lower_termination : string = 
	"exists  (rc: int) (rn: int) (rt: int) (rx: int).
	 reach 7 rc rn rt rx /\\ rn != rx /\\ rc != 0"

let higher_lower_secret_preservation : string = 
	"exists  (s1: int) (rc1: int) (rn1: int) (rt1: int) (rx1: int) (s2: int) (rc2: int) (rn2: int) (rt2: int) (rx2: int).
	streach s1 rc1 rn1 rt1 rx1 s2 rc2 rn2 rt2 rx2 /\\ s1 != 0 /\\ s2 != 0 /\\ rn1 != rn2"