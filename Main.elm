import Html exposing (Html)

import Common exposing (..)
import Game exposing (..)
import Board exposing (..)
import Display exposing (..)
import Mailbox exposing (..)


update : Action -> Game -> Game
update action game =
  case action of
    NoOp -> game
    Move id ->
      if validMove id game then
        makeMove id game
          |> checkForWinners
          |> switchCurrentPlayer
      else
        game

-- manage the model of our application over time
model : Signal Game
model =
  Signal.foldp update newGame actions.signal

main : Signal Html
main =
    Signal.map (display actions.address) model
