module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import StartApp.Simple as StartApp
import Signal exposing (Address)


type alias Model =
  { query : String
  , results : List SearchResult
  }


type alias SearchResult =
  { id : ResultId
  , name : String
  , stars : Int
  }


type alias ResultId =
  Int


initialModel : Model
initialModel =
  { query = "tutorial"
  , results =
      [ { id = 1
        , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
        , stars = 66
        }
      , { id = 2
        , name = "grzegorzbalcerek/elm-by-example"
        , stars = 41
        }
      , { id = 3
        , name = "sporto/elm-tutorial-app"
        , stars = 35
        }
      , { id = 4
        , name = "jvoigtlaender/Elm-Tutorium"
        , stars = 10
        }
      , { id = 5
        , name = "sporto/elm-tutorial-assets"
        , stars = 7
        }
      ]
  }


view : Address Action -> Model -> Html
view address model =
  div
    [ class "content" ]
    [ header
        []
        [ h1 [] [ text "ElmHub" ]
        , span [ class "tagline" ] [ text "“Like GitHub, but for Elm things.”" ]
        ]
    , ul
        [ class "results" ]
        (List.map (viewSearchResult address) model.results)
    ]


viewSearchResult : Address Action -> SearchResult -> Html
viewSearchResult address result =
  li
    []
    [ span [ class "star-count" ] [ text (toString result.stars) ]
    , a
        [ href ("https://github.com/" ++ result.name), target "_blank" ]
        [ text result.name ]
    , button
        -- TODO add an onClick handler that sends a DELETE_BY_ID action
        [ class "hide-result"
        , onClick address { actionType = "DELETE_BY_ID", id = result.id }
        ]
        [ text "X" ]
    ]


type alias Action =
  -- TODO implement this type alias
  { actionType: String
  , id: Int
  }


update : Action -> Model -> Model
update action model =
  let
    checkId : SearchResult -> Bool
    checkId = -- Grabs `id` field from input record, then pass id to `/= action.id`
      .id >> (/=) action.id -- I have partially applied `/=` with `action.id`!
  in
    -- TODO if we receive a DELETE_BY_ID action,
    -- build a new model without the given ID present anymore.
    if action.actionType == "DELETE_BY_ID" then
      { model | results = List.filter checkId model.results }
    else
      model


main =
  StartApp.start
    { view = view
    , update = update
    , model = initialModel
    }
