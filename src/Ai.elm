module Ai where

import Common exposing (..)
import Board exposing (..)
import Game exposing (switchPlayer)
import Utils
import Dict

isWinner : List Cell -> Player -> Bool
isWinner board player =
  let
    moves =
      (movesFor board player)
  in
    List.any (\winSet -> (Utils.isSubset winSet moves)) winningMoves

bestMove : List Cell -> Player -> Int
bestMove board player =
  let
    defaultWinScore = 1
    unFoundMoveDefault = 0
    moves = (movesFor board None)
    updatedBoard = (\id -> updateBoard id player board)
    rankedBoard = (\id -> rankBoard (updatedBoard id) player defaultWinScore)
    mappedMoves = List.map (\id -> rankedBoard id) moves
    scores = Utils.zipmap moves mappedMoves
    bestScore = scores
      |> Dict.values
      |> List.maximum
      |> Maybe.withDefault unFoundMoveDefault
    bestMove = List.filter (\x -> (Dict.get x scores |> Maybe.withDefault unFoundMoveDefault) == bestScore) moves
  in
    List.head(bestMove)
      |> Maybe.withDefault unFoundMoveDefault

rankBoard : List Cell -> Player -> Int -> Int
rankBoard board player winScore =
  if isWinner board player then
    winScore
  else if isWinner board (switchPlayer player) then
    winScore * -1
  else if (movesFor board None) == [] then
    0
  else
    let
      opponent = (switchPlayer player)
      nextBoard = (updateBoard (bestMove board opponent) opponent board)
    in
      rankBoard nextBoard opponent (winScore * -1)
