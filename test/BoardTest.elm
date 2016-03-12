module BoardTest where

import ElmTest exposing (..)
import TestHelpers exposing (..)
import Common exposing (..)
import Board exposing (..)


placeTest : Test
placeTest =
  suite "Converts Player type to Cell type"
     [ test "Human -> X" (assertEqual (place Human) X)
     , test "Computer -> X" (assertEqual (place Computer) O)
     , test "None -> Empty" (assertEqual (place None) Empty)
     ]

makeMoveTest : Test
makeMoveTest =
  suite "Updates a given game record's board with the current player in the id provided"
     [ test "Empty board" (assertEqual (.board (makeMove 0 newGame)) [X, Empty, Empty, Empty, Empty, Empty, Empty, Empty, Empty] )
     , test "Existing board" (assertEqual (.board (makeMove 1 (gameWithBoard [X, Empty, O]))) [X, X, O] )
     ]

movesForTest : Test
movesForTest =
  suite "Returns a list of Indexes where the given player has moves on the board"
     [ test "" (assertEqual (movesFor [X, Empty, O, O] Human) [0] )
     , test "" (assertEqual (movesFor [X, Empty, O, O] Computer) [2, 3] )
     , test "" (assertEqual (movesFor [X, Empty, O, O] None) [1] )
     ]

boardSuite : Test
boardSuite =
    suite "Board"
        [ test "Addition" (assertEqual (3 + 7) 10)
        , placeTest
        , makeMoveTest
        , movesForTest
        ]
