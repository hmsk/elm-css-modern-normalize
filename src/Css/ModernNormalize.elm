module Css.ModernNormalize exposing (globalHtml, globalStyledHtml, snippets)

import Css
    exposing
        ( auto
        , baseline
        , bolder
        , borderBox
        , borderStyle
        , bottom
        , boxSizing
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
        , padding3
        , pct
        , position
        , px
        , relative
        , textDecoration2
        , textTransform
        , top
        , underline
        , verticalAlign
        )
import Css.Global exposing (Snippet, global, selector)
import Html exposing (Html)
import Html.Styled exposing (toUnstyled)


globalHtml : Html msg
globalHtml =
    toUnstyled globalStyledHtml


globalStyledHtml : Html.Styled.Html msg
globalStyledHtml =
    global snippets


snippets : List Snippet
snippets =
    -- https://github.com/sindresorhus/modern-normalize
    [ selector "*, *::before, *::after" [ boxSizing borderBox ]
    , selector ":root"
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
        ]
    , selector "abbr[title]"
        [ textDecoration2 underline dotted
        ]
    , selector "b, strong"
        [ fontWeight bolder
        ]
    , selector "code, kbd, samp, pre"
        [ fontFamilies [ "SFMono-Regular", "Consolas", "Liberation Mono", "Menlo", "monospace" ]
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
    , selector "button::-moz-focus-inner, [type='button']::-moz-focus-inner, [type='reset']::-moz-focus-inner, [type='submit']::-moz-focus-inner"
        [ borderStyle none
        , padding (px 0)
        ]
    , selector "button:-moz-focusring, [type='button']:-moz-focusring, [type='reset']:-moz-focusring, [type='submit']:-moz-focusring"
        [ Css.property "outline" "1px dotted ButtonText"
        ]
    , selector "fieldset"
        [ padding3 (em 0.35) (em 0.75) (em 0.625)
        ]
    , selector "legend"
        [ padding (px 0) ]
    , selector "progress"
        [ verticalAlign baseline ]
    , selector "[type='number']::-webkit-inner-spin-button, [type='number']::-webkit-outer-spin-button"
        [ height auto ]
    , selector "[type='search']"
        [ outlineOffset (px -2)
        , Css.property "-webkit-appearance" "textfield"
        ]
    , selector "[type='search']::-webkit-search-decoration"
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
