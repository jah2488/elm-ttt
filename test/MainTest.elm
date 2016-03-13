module Test where

import Graphics.Element exposing (Element)
import ElmTest exposing (..)

import GameTest exposing (gameSuite)
import BoardTest exposing (boardSuite)
import AiTest exposing (aiSuite)
import UtilsTest exposing (utilsSuite)

ticTacToeSuite : Test
ticTacToeSuite =
    suite "Elm Tac Toe"
        [ gameSuite
        , boardSuite
        , aiSuite
        , utilsSuite
        ]


main : Element
main =
    elementRunner ticTacToeSuite
