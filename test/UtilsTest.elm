module UtilsTest where

import ElmTest exposing (..)
import Utils exposing (..)

isSubsetTest : Test
isSubsetTest =
  suite "isSubset"
    [ test "" (assert (isSubset [1] [1, 2, 3]))
    , test "" (assert (not (isSubset [2] [1, 3])))
    , test "" (assert (not (isSubset [3, 3, 2] [2, 3])))
    , test "" (assert (isSubset [3, 2, 2] [2, 2, 3]))
    ]
    
utilsSuite : Test
utilsSuite =
    suite "Utils"
        [ isSubsetTest
        ]
