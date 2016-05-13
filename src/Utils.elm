module Utils exposing (..)

import Dict


isSubset : List a -> List a -> Bool
isSubset listA listB =
    List.length listA
        <= List.length listB
        && (List.all (\x -> List.member x listB) listA)


zipmap : List comparable -> List a -> Dict.Dict comparable a
zipmap listA listB =
    Dict.fromList (List.map2 (\la lb -> ( la, lb )) listA listB)


defaultGet : a -> comparable -> Dict.Dict comparable a -> a
defaultGet default x myDict =
    Dict.get x myDict
        |> Maybe.withDefault default
