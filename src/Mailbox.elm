module Mailbox where
import Signal exposing (Signal, Address)
import Common exposing (..)

-- actions from user input
actions : Signal.Mailbox Action
actions =
  Signal.mailbox NoOp
