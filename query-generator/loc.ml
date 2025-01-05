(** Source code locations *)

open Sexplib.Std

module Opt = Option

type position = Lexing.position = {
  pos_fname : string;
  pos_lnum : int;
  pos_bol : int;
  pos_cnum : int;
}
[@@deriving sexp]

let compare_position p1 p2 =
  let open Lexing in
  let f1 = Stdlib.Obj.magic p1.pos_fname in
  let f2 = Stdlib.Obj.magic p2.pos_fname in
  let c1 = compare f1 f2 in
  if c1 <> 0 then c1 else compare p1.pos_cnum p2.pos_cnum

let equal_position p1 p2 =
  let open Lexing in
  p1 == p2
  || String.equal p1.pos_fname p2.pos_fname
     && Int.equal p1.pos_lnum p2.pos_lnum
     && Int.equal p1.pos_cnum p2.pos_cnum

type t = { loc_start : position; loc_end : position }
[@@deriving compare, equal, sexp]

let make p1 p2 = { loc_start = p1; loc_end = p2 }
let dummy = { loc_start = Lexing.dummy_pos; loc_end = Lexing.dummy_pos }

open Lexing

let column p = p.pos_cnum - p.pos_bol
let start_line loc = loc.loc_start.pos_lnum
let end_line loc = loc.loc_end.pos_lnum
let start_col loc = column loc.loc_start
let end_col loc = column loc.loc_end
let start_bol loc = loc.loc_start.pos_bol
let end_bol loc = loc.loc_end.pos_bol
let file_name loc = loc.loc_start.pos_fname
let to_end loc = { loc with loc_start = loc.loc_end }
let to_start loc = { loc with loc_end = loc.loc_start }

let start_index loc = loc.loc_start.pos_cnum
let end_index loc = loc.loc_end.pos_cnum


let merge l1 l2 =
  assert (String.equal (file_name l1) (file_name l2));
  let spos =
    let c = compare_position l1.loc_start l2.loc_start in
    if c <= 0 then l1.loc_start else l2.loc_start
  in
  let epos =
    let c = compare_position l1.loc_end l2.loc_end in
    if c >= 0 then l1.loc_end else l2.loc_end
  in
  make spos epos

let to_string_simple loc =
  if start_line loc <> end_line loc then
    Printf.sprintf "%s:%d:%d" (file_name loc) (start_line loc) (start_col loc)
  else
    let start_col, end_col =
      if start_col loc = end_col loc then
        if start_col loc = 0 then (0, 1) else (start_col loc - 1, end_col loc)
      else (start_col loc, end_col loc)
    in
    Printf.sprintf "%s:%d:%d-%d" (file_name loc) (start_line loc) start_col
      end_col

let to_string loc =
  if loc.loc_start.pos_lnum = loc.loc_end.pos_lnum then
    Printf.sprintf "File \"%s\", line %d, columns %d-%d" (file_name loc)
      (start_line loc) (start_col loc) (end_col loc)
  else
    Printf.sprintf "File \"%s\", line %d, column %d to line %d, column %d"
      (file_name loc) (start_line loc) (start_col loc) (end_line loc)
      (end_col loc)

(*let ( = ) = equal*)
