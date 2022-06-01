import XMonad

import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers

main :: IO ()
main = xmonad $ ewmh $ def
    { modMask = mod4Mask  -- Rebind Mod to the Super key
    , terminal    = "urxvt" -- Custom terminal
    , layoutHook = smartBorders $ mylayoutHook 
    , handleEventHook = fullscreenEventHook --Fullscreen
    , normalBorderColor = "#282A36" -- Custom border color
    , focusedBorderColor = "#FF92D0" -- Custom border color
    }
  `additionalKeysP`
    [ ("M-z", spawn "~/scripts/date")
    , ("M-S-z", spawn "~/scripts/temp")
    , ("M-x", spawn "~/scripts/weather")
    , ("M-C-s", unGrab *> spawn "scrot -s"        )
    , ("M-f"  , spawn "rofi -show drun"                   )
    ]

mylayoutHook = Full ||| tabbed shrinkText def ||| Accordion   

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "mpv" --> doFloat
    , isDialog            --> doFloat
    ]
