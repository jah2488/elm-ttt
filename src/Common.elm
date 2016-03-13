module Common where

-- Data Types
type State = Playing | GameOver
type Player = Human | Computer | None
type Cell = X | O | Empty
type Action = NoOp | Move Int

-- Model
type alias Game =
  { turn: Player
  , board: List Cell
  , winner: Player
  , state: State
  , message: String
  }
