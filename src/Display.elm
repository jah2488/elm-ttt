module Display exposing (..)

import Html exposing (Html, div, h1, h2, hr, button, text)
import Html.Events exposing (..)
import Common exposing (..)
import Styles exposing (..)


cell : Int -> Cell -> Html Msg
cell index cell =
    let
        content =
            case cell of
                Empty ->
                    toString (index + 1)

                _ ->
                    toString cell
    in
        button [ cellStyles content, onClick (Move index) ] [ text content ]


display : Game -> Html Msg
display game =
    div []
        [ h1 [ titleStyles ] [ text "Elm Tac Toe" ]
        , hr [] []
        , div [ boardStyles game.state ]
            [ div [] (List.indexedMap cell game.board)
            , div [ messageStyles ] [ text game.message ]
            ]
        , h2 [] [ text ("Turn: " ++ toString game.turn) ]
        , h2 [] [ text ("State: " ++ toString game.state) ]
        , h2 [] [ text ("Winner: " ++ toString game.winner) ]
        , button [ onClick NewGame ] [ text "Start a New Game" ]
        ]
