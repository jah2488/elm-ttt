module Utils where

isSubset : List a -> List a -> Bool
isSubset listA listB =
  List.length listA <= List.length listB
    && (List.all (\x -> List.member x listB) listA)
