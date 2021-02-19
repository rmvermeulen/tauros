module Main exposing (..)

import Browser
import Colors
import Element exposing (Element, column, el, fill, height, image, padding, paragraph, rgb, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input exposing (button)



---- MODEL ----


type alias Model =
    { messages : List String
    }


init : ( Model, Cmd Msg )
init =
    ( Model [], Cmd.none )



---- UPDATE ----


type Msg
    = AddMessage String
    | ClearMessages


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddMessage newMessage ->
            ( { model | messages = newMessage :: model.messages }, Cmd.none )

        ClearMessages ->
            ( { model | messages = [] }, Cmd.none )



---- VIEW ----


view : Model -> Element Msg
view model =
    let
        btn ( c, t, ma ) =
            button
                [ Background.color c
                , padding 16
                , width fill
                ]
                { label = text t, onPress = ma }
    in
    column [ height fill ]
        [ row [ padding 10, Background.color Colors.bg ]
            [ image []
                { description = "The Elm logo"
                , src = "/logo.svg"
                }
            , paragraph []
                [ "Your Elm App is working, and the rust backend is showing this window!"
                    |> text
                    |> el [ Font.size 32 ]
                ]
            ]
        , [ ( Colors.button, "Do x", Just <| AddMessage "Did an X" )
          , ( Colors.button, "Do y", Just <| AddMessage "Did a Y" )
          , ( Colors.button, "Do whatever", Just <| AddMessage "Did something entirely different" )
          , ( Colors.error, "Reset", Just ClearMessages )
          ]
            |> List.map btn
            |> row [ width fill, padding 10, spacing 10 ]
        , column
            [ Background.color Colors.secondary
            , padding 10
            ]
            [ text "List of things that happened:"
            , if List.isEmpty model.messages then
                text "...nothing yet..."
                    |> el [ Font.size 12 ]

              else
                model.messages
                    |> List.map text
                    |> column
                        [ Font.size 20
                        , padding 8
                        , spacing 4
                        ]
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view =
            view
                >> Element.layout
                    [ Background.color Colors.primary
                    , padding 2
                    ]
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
