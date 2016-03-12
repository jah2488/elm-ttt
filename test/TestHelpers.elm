module TestHelpers where
import Common exposing (..)

newGame : Game
newGame =
  { turn = Human
  , board = [ Empty, Empty, Empty
            , Empty, Empty, Empty
            , Empty, Empty, Empty
            ]
  , winner = None
  , state = Playing
  }

gameWithBoard : List Cell -> Game
gameWithBoard startBoard =
  { turn = Human
  , board = startBoard
  , winner = None
  , state = Playing
  }
