(**************************************************************************)
(*                                                                        *)
(*   Typerex Libraries                                                    *)
(*                                                                        *)
(*   Copyright 2011-2017 OCamlPro SAS                                     *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

type directive =
  | OCPP_INCLUDE
  | OCPP_DEFINE
  | OCPP_DEFUN
  | OCPP_UNDEF
  | OCPP_IFDEF
  | OCPP_IFNDEF
  | OCPP_IF
  | OCPP_ELIF
  | OCPP_ELSE
  | OCPP_ENDIF
  | OCPP_ERROR
  | OCPP_WARNING
(*
  | OCPP_BEGIN_PP
  | OCPP_END_PP
*)
  | OCPP_OPTION

type version = (version_sign * version_item) list

and version_item =
  | VInt of int
  | VString of string

and version_sign =
  | VPositive
  | VNegative

type value =
  | Undefined
  | String of string
  | Int of int
  | Version of version

type expression = { desc : expr_desc; loc : Location.t }
and expr_desc =
| Pexp_ident of Longident.t Location.loc
| Pexp_uident of Longident.t Location.loc
| Pexp_constant of  value
| Pexp_apply of expression * expression list