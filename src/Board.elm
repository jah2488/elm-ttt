module Board exposing (..)

import Common exposing (..)


winningMoves : List (List Int)
winningMoves =
    [ [ 0, 1, 2 ], [ 3, 4, 5 ], [ 6, 7, 8 ], [ 0, 3, 6 ], [ 1, 4, 7 ], [ 2, 5, 8 ], [ 0, 4, 8 ], [ 6, 4, 2 ] ]


place : Player -> Cell
place player =
    case player of
        Human ->
            X

        Computer ->
            O

        None ->
            Empty


cellPlayer : Cell -> Player
cellPlayer cell =
    case cell of
        X ->
            Human

        O ->
            Computer

        Empty ->
            None


updateBoard : Int -> Player -> List Cell -> List Cell
updateBoard id player board =
    List.indexedMap
        (\idx cell ->
            if id == idx then
                (place player)
            else
                cell
        )
        board


makeMove : Int -> Game -> Game
makeMove id game =
    { game | board = (updateBoard id game.turn game.board) }


movesFor : List Cell -> Player -> List Int
movesFor board player =
    let
        playerPiece =
            place player

        isPlayer ( index, cell ) =
            if playerPiece == cell then
                Just index
            else
                Nothing
    in
        List.indexedMap (,) board
            |> List.filterMap isPlayer
