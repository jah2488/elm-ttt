module Game where

import Common exposing (..)
import Board exposing (movesFor, winningMoves)
import Utils

newGame : Game
newGame =
  { turn = Human
  , board =
    [ Empty, Empty, Empty
    , Empty, Empty, Empty
    , Empty, Empty, Empty ]
  , winner = None
  , state = Playing
  }

switchPlayer : Player -> Player
switchPlayer turn =
  case turn of
    Human -> Computer
    Computer -> Human
    None -> None

switchCurrentPlayer : Game -> Game
switchCurrentPlayer game =
  { game | turn = switchPlayer game.turn }

checkForWinners : Game -> Game
checkForWinners game =
  let
    moves =
      (movesFor game.board game.turn)
    didWin =
      List.any (\winSet ->
        (Utils.isSubset winSet moves))
          winningMoves
  in
    if didWin == True then
      { game | winner = game.turn }
    else
      game

validMove : Int -> Game -> Bool
validMove id game =
  List.member id (movesFor game.board None)
