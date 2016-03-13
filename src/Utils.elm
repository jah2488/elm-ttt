module Utils where

import Dict

isSubset : List a -> List a -> Bool
isSubset listA listB =
  List.length listA <= List.length listB
    && (List.all (\x -> List.member x listB) listA)

zipmap : List comparable -> List a -> Dict.Dict comparable a
zipmap listA listB =
  Dict.fromList(List.map2 (\la lb -> (la, lb)) listA listB)

getWithDefault : comparable -> a -> (Dict.Dict comparable a) -> a
getWithDefault key default dict =
  Dict.get key dict
    |> Maybe.withDefault default
