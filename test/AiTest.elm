module AiTest where

import ElmTest exposing (..)
-- import TestHelpers exposing (..)
import Common exposing (..)
import Ai exposing (..)

isWinnerTest : Test
isWinnerTest =
  suite "isWinnerTest returns true if the given player has won the game"
    [ test "" (assert (isWinner [X, X, X] Human))
    , test "" (assert (isWinner [O, O, O] Computer))
    , test "" (assert (not (isWinner [X, X, X] Computer)))
    ]

bestMoveTest : Test
bestMoveTest =
  suite "bestMove returns the most correct move given the board state and player"
  [ test "" (assertEqual 0 (bestMove [Empty, X, X] Human))

  , test "" (assertEqual 0 (bestMove [ Empty,     X,  X
                                     , Empty, Empty,  O
                                     , Empty,     O,  X] Human))

  , test "" (assertEqual 5 (bestMove [ Empty, X, X
                                     ,     O, O, Empty
                                     , Empty, X, X] Computer))
  ]

aiSuite : Test
aiSuite =
  suite "Ai"
    [ isWinnerTest
    , bestMoveTest
    ]
