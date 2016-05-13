module Main exposing (..)

import Html.App as Html
import Common exposing (..)
import Game exposing (..)
import Board exposing (..)
import Display exposing (..)
import Ai exposing (..)


-- The first move takes a very long time to process, but it is always pos 0 or 4


cheatFirstMove : Game -> Int
cheatFirstMove game =
    if validMove 0 game then
        0
    else
        4


makeComputerMove : Game -> Game
makeComputerMove game =
    let
        moveLocation =
            if List.isEmpty (movesFor game.board Computer) then
                cheatFirstMove game
            else
                Ai.bestMove game.board game.turn
    in
        { game | board = updateBoard moveLocation game.turn game.board }


update : Msg -> Game -> ( Game, Cmd Msg )
update action game =
    case action of
        NewGame ->
            ( newGame, Cmd.none )

        NoOp ->
            ( game, Cmd.none )

        Move id ->
            if validMove id game then
                ( makeMove id game
                    |> checkForWinners
                    |> switchCurrentPlayer
                    |> makeComputerMove
                    |> checkForWinners
                    |> switchCurrentPlayer
                , Cmd.none
                )
            else
                ( game, Cmd.none )


init =
    ( newGame
    , Cmd.none
    )


subscriptions : Game -> Sub Msg
subscriptions game =
    Sub.none


main =
    Html.program
        { init = init
        , view = display
        , update = update
        , subscriptions = subscriptions
        }
