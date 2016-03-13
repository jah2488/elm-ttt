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
  test "" (assertEqual 1 (bestMove [Empty, X, X] Human))

rankBoardTest : Test
rankBoardTest =
  test "" (assert True)

aiSuite : Test
aiSuite =
  suite "Ai"
    [ isWinnerTest
    , bestMoveTest
    , rankBoardTest
    ]
