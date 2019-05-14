type typ = Prim of int | Tuple of typ * typ | Union of typ * typ
;;

type choice = L | R
;;

let rec toggle = function
  | [] -> []
  | L::tl -> R::tl
  | R::tl -> toggle tl
;;

let step (l:choice list) =
  match List.rev (toggle (List.rev l)) with
  | [] -> None
  | hd::tl -> Some(hd::tl)
;;

let rec pad t l =
  match (t,l) with
  | (Prim i,l) -> ([],l)
  | (Tuple(t,t'),l) ->
     let (h,tl) = pad t l in
     let (h',tl') = pad t' tl in
     (h @ h',tl')
  | (Union(t,_),L::r) ->
     let (h,tl) = pad t r in (L::h,tl)
  | (Union(_,t),R::r) ->
     let (h,tl) = pad t r in (R::h,tl)
  | (Union(t,_),[]) -> (L::(fst(pad t [])),[])
;;

let rec next(a:typ)(l:choice list) =
  match step l with
  | None -> None
  | Some(l') -> Some(fst (pad a l'))
;;

let initial(t:typ) = fst (pad t [])
;;


type res = NotSub | IsSub of choice list * choice list
;;

let rec sub t1 t2 f e =
  match t1,t2,f,e with
  | (Prim i,Prim j,f,e) -> if i==j then IsSub(f,e) else NotSub
  | (Tuple(a1,a2), Tuple(b1,b2),f,e) ->
     (match sub a1 b1 f e with
      | IsSub(f', e') -> sub a2 b2 f' e'
      | NotSub -> NotSub)
  | (Union(a,_),b,L::f,e) -> sub a b f e
  | (Union(_,a),b,R::f,e) -> sub a b f e
  | (a,Union(b,_),f,L::e) -> sub a b f e
  | (a,Union(_,b),f,R::e) -> sub a b f e

;;

let rec exists(a:typ)(b:typ)(f:choice list)(e:choice list) =
  match sub a b f e with
  | IsSub(_,_) -> true
  | NotSub ->
     (match next b e with
      | Some ns -> exists a b f ns
      | None -> false)
;;

let rec allexists(a:typ)(b:typ)(f:choice list) =
  match exists a b f (initial b) with
  | true -> (match next a f with
             | Some ns -> allexists a b ns
             | None -> true)
  | false -> false
;;

let subtype(a:typ)(b:typ) = allexists a b (initial a)
;;




