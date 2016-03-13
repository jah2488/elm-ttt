module Styles where
import Html exposing (..)
import Html.Attributes exposing (..)
import Common exposing (..)

-- Styles
titleStyles : Attribute
titleStyles =
  style [("text-align", "center")]

boardStyles : State -> Attribute
boardStyles gameState =
  let
    standardStyles =
      [ ("width", "41em")
      , ("margin", "0 auto")
      , ("overflow", "hidden")
      ]
    gameOverStyles =
      if gameState == GameOver then
        [ ("opacity", "0.5")
        , ("pointer-events", "none")
        , ("-webkit-user-select", "none")
        , ("-moz-user-select", "none")
        , ("user-select", "none")
        ]
     else
       []
  in
    style
      (List.append standardStyles gameOverStyles)

cellStyles : String -> Attribute
cellStyles content =
  let
    contentStyle =
      case content of
        "X" -> ("color", "#2BC4F2")
        "O" -> ("color", "#A237FF")
        _ -> ("color", "#4A4A4A")
  in
    style
      [ ("margin", "10px")
      , ("width", "30%")
      , ("height", "200px")
      , ("text-align", "center")
      , ("-webkit-user-select", "none")
      , ("user-select", "none")
      , ("font-size", "6em")
      , ("border-radius", "0")
      , ("-webkit-appearance", "none")
      , ("padding", "0px")
      , ("background", "white")
      , ("border", "2px solid #4A4A4A")
      , contentStyle
      ]


messageStyles : Attribute
messageStyles =
  style
    [ ("border", "2px solid #FEDD97")
    , ("background", "#FEEDC9")
    , ("color", "#FDB110")
    , ("margin", "0 20px")
    , ("border-radius", "20px")
    , ("padding", "10px")
    , ("text-align", "center")
    ]
