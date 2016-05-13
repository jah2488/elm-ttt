module Common exposing (..)

-- Data Types


type State
    = Playing
    | GameOver


type Player
    = Human
    | Computer
    | None


type Cell
    = X
    | O
    | Empty


type Msg
    = NoOp
    | Move Int
    | NewGame



-- Model


type alias Game =
    { turn : Player
    , board : List Cell
    , winner : Player
    , state : State
    , message : String
    }
