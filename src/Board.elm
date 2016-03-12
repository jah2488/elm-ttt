module Board where

import Common exposing (..)

winningMoves : List (List Int)
winningMoves =
  [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

place : Player -> Cell
place player =
  case player of
    Human -> X
    Computer -> O
    None -> Empty

makeMove : Int -> Game -> Game
makeMove id game =
  let
    newBoard =
      (List.indexedMap
        (\idx cell ->
          if id == idx then (place game.turn) else cell) game.board)
  in
    { game | board = newBoard }

movesFor : List Cell -> Player -> List Int
movesFor board player =
  let
    playerPiece = place player
    isPlayer (index, cell) =
      if playerPiece == cell then Just index else Nothing
  in
    List.indexedMap (,) board
      |> List.filterMap isPlayer
