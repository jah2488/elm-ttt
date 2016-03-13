import Html exposing (Html)

import Common exposing (..)
import Game exposing (..)
import Board exposing (..)
import Display exposing (..)
import Mailbox exposing (..)
import Ai


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

update : Action -> Game -> Game
update action game =
  case action of
    NewGame -> newGame
    NoOp -> game
    Move id ->
      if validMove id game then
        makeMove id game
          |> checkForWinners
          |> switchCurrentPlayer
          |> makeComputerMove
          |> checkForWinners
          |> switchCurrentPlayer
      else
        game

model : Signal Game
model =
  Signal.foldp update newGame actions.signal

main : Signal Html
main =
    Signal.map (display actions.address) model
