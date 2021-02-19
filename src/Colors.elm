module Colors exposing (..)

import Element exposing (rgb)


grayf n =
    rgb n n n


primary =
    grayf 0.95


secondary =
    grayf 0.75


warning =
    rgb 1 1 0


error =
    rgb 1 0 0


button =
    rgb 0.6 0.8 0.6


bg =
    rgb 0.6 0.6 0.8
