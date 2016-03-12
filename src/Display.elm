module Display where
import Html exposing (Html, div, h1, hr, button, text)
import Html.Events exposing (..)
import Signal exposing (Signal, Address)

import Common exposing (..)
import Styles exposing (..)
import Mailbox exposing (..)

cell : Int -> Cell -> Html
cell index cell =
  let
    content =
      case cell of
        Empty -> toString (index + 1)
        _ -> toString cell
  in
    button [ cellStyles, onClick actions.address (Move index)] [text content]

display : Address Action -> Game -> Html
display address game =
  div []
    [ h1 [titleStyles] [text "Elm Tac Toe"]
    , hr [] []
    , div [boardStyles] (List.indexedMap (cell) game.board)
    , h1 [] [text ("Turn: " ++ toString game.turn)]
    , h1 [] [text ("Winner: " ++ toString game.winner)]
    ]
