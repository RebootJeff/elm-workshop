module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)


model =
  { result =
      { id = 1
      , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
      , stars = 66
      }
  }

githubUrl path =
  "https://github.com/" ++ path

view model =
  div
    [ class "content" ]
    [ header
        []
        -- TODO add the equivalent of <h1>ElmHub</h1> right before the tagline
        [ h1 [] [ text "ElmHub" ]
        , span [ class "tagline" ] [ text "“Like GitHub, but for Elm things.”" ]
        ]
    , ul
        [ class "results" ]
        [ li
            []
            [ span [ class "star-count" ] [ text (toString model.result.stars) ]
              -- TODO use the model to put a link here that points to
              -- https://github.com/TheSeamau5/elm-checkerboardgrid-tutorial
            , a [ href (githubUrl model.result.name) ] [ text "GitHub repo link" ]
            ]
        ]
    ]


main =
  view model
