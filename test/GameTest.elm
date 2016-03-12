module GameTest where

import ElmTest exposing (..)
import TestHelpers exposing (gameWithBoard)
import Game exposing (..)
import Common exposing (..)

switchPlayerTest : Test
switchPlayerTest =
  suite "switchPlayer returns the next player"
    [ test "" (assertEqual (switchPlayer Human) Computer)
    , test "" (assertEqual (switchPlayer Computer) Human)
    , test "" (assertEqual (switchPlayer None) None)
    ]

switchCurrentPlayerTest : Test
switchCurrentPlayerTest =
  suite "switchCurrentPlayer returns the game for the next player"
    [ test "" (assertEqual Computer (.turn (switchCurrentPlayer newGame)))
    ]

checkForWinnersTest : Test
checkForWinnersTest =
  suite "checkForWinner sets the game's winner if current player has won"
    [ test "" (assertEqual None (.winner (checkForWinners newGame)))
    , test "" (assertEqual Human (.winner (checkForWinners (gameWithBoard [X, X, X]))))
    , test "" (assertEqual None (.winner (checkForWinners (gameWithBoard [O, O, O]))))
    ]

validMoveTest : Test
validMoveTest =
  suite "Ensures the selected index is a valid move given a particular game state"
    [ test "" (assert (validMove 0 newGame))
    , test "" (assert (validMove 1 (gameWithBoard [O, Empty, O])))
    , test "" (assert (not (validMove 0 (gameWithBoard [O, X, O]))))
    ]

gameSuite : Test
gameSuite=
    suite "Game"
        [ switchPlayerTest
        , switchCurrentPlayerTest
        , checkForWinnersTest
        , validMoveTest
        ]
