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
    , Empty, Empty, Empty
    ]
  , winner = None
  , state = Playing
  , message = "Pick your starting move"
  }

switchPlayer : Player -> Player
switchPlayer turn =
  case turn of
    Human -> Computer
    Computer -> Human
    None -> None

switchCurrentPlayer : Game -> Game
switchCurrentPlayer game =
  let
    newMessage =
      if game.turn == Human then
        "Computer is thinking"
      else if game.turn == Computer then
        "Your Move"
      else
        "..."
  in
    { game | turn = switchPlayer game.turn, message = newMessage }

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
      { game | winner = game.turn, state = GameOver }
    else
      game

validMove : Int -> Game -> Bool
validMove id game =
  List.member id (movesFor game.board None)
