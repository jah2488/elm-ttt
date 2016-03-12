module Test where

import Graphics.Element exposing (Element)
import ElmTest exposing (..)

import GameTest exposing (gameSuite)
import BoardTest exposing (boardSuite)
import UtilsTest exposing (utilsSuite)

ticTacToeSuite : Test
ticTacToeSuite =
    suite "Elm Tac Toe"
        [ gameSuite
        , boardSuite
        , utilsSuite
        ]


main : Element
main =
    elementRunner ticTacToeSuite
