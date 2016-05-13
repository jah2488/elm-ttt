module Mailbox exposing (..)

import Common exposing (..)


-- actions from user input


actions : Signal.Mailbox Action
actions =
    Signal.mailbox NoOp
