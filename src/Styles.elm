module Styles where
import Html exposing (..)
import Html.Attributes exposing (..)

-- Styles
titleStyles : Attribute
titleStyles =
  style [("text-align", "center")]

boardStyles : Attribute
boardStyles =
  style [("width", "510px"), ("margin", "0 auto")]

cellStyles : Attribute
cellStyles =
  style
    [ ("margin", "10px")
    , ("width", "150px")
    , ("height", "150px")
    , ("font-size", "6em")
    ]
