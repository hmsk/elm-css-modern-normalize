module Css.ModernNormalize exposing (globalHtml, globalStyledHtml, snippets)

{-| An Elm port of modern-normalize

@docs globalHtml, globalStyledHtml, snippets

-}

import Css
    exposing
        ( auto
        , baseline
        , bolder
        , borderBox
        , borderColor
        , borderStyle
        , bottom
        , boxShadow
        , boxSizing
        , color
        , display
        , dotted
        , em
        , fontFamilies
        , fontFamily
        , fontSize
        , fontWeight
        , height
        , inherit
        , lineHeight
        , listItem
        , margin
        , none
        , num
        , outlineOffset
        , padding
        , pct
        , position
        , px
        , relative
        , textDecoration2
        , textIndent
        , textTransform
        , top
        , underline
        , verticalAlign
        )
import Css.Global exposing (Snippet, global, selector)
import Html exposing (Html)
import Html.Styled exposing (toUnstyled)


{-| Html msg of a global <style>
-}
globalHtml : Html msg
globalHtml =
    toUnstyled globalStyledHtml


{-| Html.Styled.Html msg of a global <style>
-}
globalStyledHtml : Html.Styled.Html msg
globalStyledHtml =
    global snippets


{-| elm-css List Snippet for modern-normalize: <https://github.com/sindresorhus/modern-normalize>
-}
snippets : List Snippet
snippets =
    -- https://github.com/sindresorhus/modern-normalize
    [ selector "*, ::before, ::after" [ boxSizing borderBox ]
    , selector "html"
        [ Css.property "-moz-tab-size" "4"
        , Css.property "tab-size" "4"
        ]
    , selector "html"
        [ lineHeight (num 1.15)
        , Css.property "-webkit-text-size-adjust" "100%"
        ]
    , selector "body"
        [ margin (px 0)
        , fontFamilies
            [ "system-ui", "-apple-system", "Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif", "Apple Color Emoji", "Segoe UI Emoji" ]
        ]
    , selector "hr"
        [ height (px 0)
        , color inherit
        ]
    , selector "abbr[title]"
        [ textDecoration2 underline dotted
        ]
    , selector "b, strong"
        [ fontWeight bolder
        ]
    , selector "code, kbd, samp, pre"
        [ fontFamilies [ "ui-monospace", "SFMono-Regular", "Consolas", "Liberation Mono", "Menlo", "monospace" ]
        , fontSize (em 1)
        ]
    , selector "small"
        [ fontSize (pct 80)
        ]
    , selector "sub,sup"
        [ fontSize (pct 75)
        , lineHeight (num 0)
        , position relative
        , verticalAlign baseline
        ]
    , selector "sub"
        [ bottom (em -0.25)
        ]
    , selector "sup"
        [ top (em -0.5)
        ]
    , selector "table"
        [ textIndent (px 0)
        , borderColor inherit
        ]
    , selector "button, input, optgroup, select, textarea"
        [ fontFamily inherit
        , fontSize (pct 100)
        , lineHeight (num 1.15)
        , margin (px 0)
        ]
    , selector "button, select"
        [ textTransform none
        ]
    , selector "button, [type='button'], [type='reset'], [type='submit']"
        [ Css.property "-webkit-appearance" "button"
        ]
    , selector "::-moz-focus-inner"
        [ borderStyle none
        , padding (px 0)
        ]
    , selector ":-moz-focusring"
        [ Css.property "outline" "1px dotted ButtonText"
        ]
    , selector ":-moz-ui-invalid"
        [ boxShadow none
        ]
    , selector "legend"
        [ padding (px 0) ]
    , selector "progress"
        [ verticalAlign baseline ]
    , selector "::-webkit-inner-spin-button, ::-webkit-outer-spin-button"
        [ height auto ]
    , selector "[type='search']"
        [ outlineOffset (px -2)
        , Css.property "-webkit-appearance" "textfield"
        ]
    , selector "::-webkit-search-decoration"
        [ Css.property "-webkit-appearance" "none"
        ]
    , selector "::-webkit-file-upload-button"
        [ Css.property "font" "inherit"
        , Css.property "-webkit-appearance" "button"
        ]
    , selector "summary"
        [ display listItem
        ]
    ]



{- buttonText : ColorValue NonMixable
   buttonText =
   { value = "ButtonText"
   , color = Compatible
   }
-}
