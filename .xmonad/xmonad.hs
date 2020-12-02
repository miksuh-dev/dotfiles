--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import Data.Monoid
import System.Exit
import XMonad.Layout.Tabbed
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import Control.Monad (liftM2)
import XMonad.Util.Cursor
import XMonad.Hooks.SetWMName

import XMonad.Layout.TwoPane
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.ThreeColumns

import XMonad.Actions.CycleWS
import XMonad.Util.WorkspaceCompare

import XMonad.Layout.PerWorkspace  ( onWorkspace )
import XMonad.Layout.PerWorkspace

import XMonad.Hooks.DynamicLog
import XMonad.Config.Desktop

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP, additionalMouseBindings)
import System.IO
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.NamedScratchpad

import XMonad.Layout.Renamed (renamed, Rename(Replace))

import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers(isFullscreen, isDialog, doFullFloat)
import XMonad.Layout.SimpleDecoration (shrinkText)
import XMonad.Layout.Spacing
import XMonad.Layout.MultiToggle 
import XMonad.Layout.MultiToggle.Instances 
import XMonad.Layout.ResizableTile

import XMonad.Actions.UpdatePointer -- update mouse postion

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import Control.Monad ( liftM2, unless )
import Data.Maybe    ( isNothing, isJust )


myTabConfig = def { activeColor = "#556064"
                  , inactiveColor = "#3b3b3b"
                  , urgentColor = "#FDF6E3"
                  , activeBorderColor = "#454948"
                  , inactiveBorderColor = "#454948"
                  , urgentBorderColor = "#268BD2"
                  , activeTextColor = "#fdfdfd"
                  , inactiveTextColor = "#fdfdfd"
                  , urgentTextColor = "#1ABC9C"
                  , fontName = "xft:Bitstream Vera Sans Mono:size=8:bold:antialias=true"
                  }

                  
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "terminator"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth   = 0

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--

myppCurrent = "#cb4b16"
myppVisible = "#cb4b16"
myppHidden = "#268bd2"
myppHiddenNoWindows = "#eeeeee"
myppTitle = "#eeeeee"
myppUrgent = "#DC322F"

myWorkspaces = ["1","2","3","4","5","6","7","8","9", "10"]

-- colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#111111"
myFocusedBorderColor = "#400000"

-- Helper function to first shift a window to another workspace and
-- then follow it.
shiftAndFollow :: WorkspaceId -> X()
shiftAndFollow = liftM2 (>>) (windows . W.shift) (windows . W.greedyView)

busyHiddenNotSpecial' :: [WorkspaceId] -> X (WindowSpace -> Bool)
-- busyHiddenNotSpecial' ids = return (\ws -> (isJust . W.stack) ws
--                                            && ((`notElem` ids) . W.tag) ws)
busyHiddenNotSpecial' ids = do ne <- return (isJust . W.stack)                         -- busy
                               hi <- do hs <- gets (map W.tag . W.hidden . windowset)  -- hidden
                                        return (\ws -> W.tag ws `elem` hs)
                               ns <- return ((`notElem` ids) . W.tag)                  -- not special
                               return (\ws -> ne ws && hi ws && ns ws)

hiddenEmptyWS :: X (WindowSpace -> Bool)
hiddenEmptyWS = do em <- return (isNothing . W.stack)                      -- empty
                   hi <- do hs <- gets (map W.tag . W.hidden . windowset)  -- hidden
                            return (\ws -> W.tag ws `elem` hs)
                   return (\ws -> em ws && hi ws)

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenuf
    , ((modm,               xK_f     ), spawn "rofi -show run -modi ssh,run,power-menu:'~/.config/rofi/scripts/rofi-power-menu --choices=lockscreen/shutdown/reboot --no-symbols'")
    , ((modm,               xK_p     ), spawn "rofi -show run -modi ssh,run,power-menu:'~/.config/rofi/scripts/rofi-power-menu --choices=lockscreen/shutdown/reboot --no-symbols'")
    
    -- , ((modm,               xK_s     ), spawn "~/.config/rofi/scripts/search")

    -- Xkill
    , ((modm .|. shiftMask, xK_Escape     ), spawn "xkill")


    -- launch gmrun
    -- , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)
    -- , ((modm,            xK_d     ), kill)
    
    , ((modm,            xK_m    ), sendMessage $ Toggle FULL)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    ----  Reset the layouts on the current workspace to default
    , ((modm,                xK_t ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
   
    -- Move focus to the previous window
    , ((modm .|. shiftMask, xK_Tab   ), windows W.focusUp)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    -- , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm .|. shiftMask, xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_u ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_i), sendMessage (IncMasterN (-1)))
    
    -- Print screen
    , ((0 .|. controlMask , xK_Print), spawn "flameshot gui")
    
    -- Launch Pcmanfm
    , ((modm .|. shiftMask , xK_BackSpace), spawn "pcmanfm")
    
    -- Launch qalculate 
    , ((0,               0x1008FF1D), spawn "snap run qalculate")

    -- Launch pcmanfm 
    , ((0,               0x1008FF5D), spawn "pcmanfm")

    -- Launch launch terminal 
    , ((0,               0x1008FF19), spawn $ XMonad.terminal conf)

    -- Launch firefox
    , ((0,               0x1008FF18), spawn "firefox")
    
    
    -- find next empty workspace
    , ((modm,               xK_q), moveTo Next (WSIs hiddenEmptyWS))
      -- find next busy workspace
    , ((modm,               xK_s), moveTo Next HiddenNonEmptyWS)
      -- find prev busy workspace
    , ((modm,               xK_a), moveTo Prev HiddenNonEmptyWS) 
    -- shift to next workspace and follow 
    , ((myModMask .|. shiftMask, xK_s), doTo Next HiddenWS getSortByIndex shiftAndFollow)
    -- shift to prev workspace and follow 
    , ((myModMask .|. shiftMask, xK_a), doTo Prev HiddenWS getSortByIndex shiftAndFollow)
    -- shift to next empty workspace and follow
    , ((modm .|. shiftMask, xK_q),
       doTo Next (WSIs hiddenEmptyWS) getSortByIndex shiftAndFollow)
    
   
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_Escape     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_Escape     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1, xK_2, xK_3, xK_4, xK_5, xK_6, xK_7, xK_8, xK_9, xK_0]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0,1,2]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout =  mkToggle (NOBORDERS ?? FULL ?? EOT)
            $ (
            --    full ||| 
                tiled |||
                three |||
                two |||
                tabs -- |||
            --   full 
            )
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled =  renamed [Replace "Tile"] 
              $ avoidStruts
              $ spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True
              $ ResizableTall nmaster delta ratio []
     
     two =    renamed [Replace "TwoPane"]
              $ avoidStruts
              $ spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True
              $ TwoPane (3/100) (1/2)


     three =  renamed [Replace "ThreeColumn"]
              $ avoidStruts
              $ spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True
              $ ThreeCol 1 (3/100) (1/2) 


     tabs =   renamed [Replace "Tabs"] 
              $ avoidStruts
              $ noBorders(tabbed shrinkText myTabConfig)
    
    --three =     renamed [Replace "ThreeColumn"]
    --            $ avoidStruts
     --           $ ThreeCol 1 (3/100) (1/2) 
              
     -- full = renamed [Replace "Full"] 
     -- $ noBorders (Full)

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master paneö
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "flameshot"      --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore 
    -- , className =? "Steam"          --> doFloat
    -- , className =? "steam"          --> doFullFloat -- bigpicture-mode
    , className =? "Firefox" <&&> resource =? "Toolkit" --> doFloat -- firefox pip
    , className =? "MainThrd"       --> doFloat
    , title =? "plasma-desktop"     --> doIgnore
    , className =? "stalonetray"    --> doIgnore

    -- Moving windows
    , className =? "Mumble" --> doShift "1"
    , className =? "Rambox" --> doShift "1"
     -- , className =? "Terminator" --> doShift "2"
    -- , className =? "robo3t" --> doShift "2"
    , className =? "Code" --> doShift "3"
    , className =? "Microsoft Teams - Preview" --> doShift "1"
    , className =? "thunderbird" --> doShift "1"
    , className =? "Mattermost" --> doShift "1"
    , className =? "Rocket.Chat" --> doShift "1"

    -- Apply fullscreen
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)]
    
------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = do
    handleEventHook defaultConfig <+> fullscreenEventHook

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
    setWMName "LG3D"
    setDefaultCursor xC_left_ptr
    spawn "bash ~/startup.sh"
    spawnOnce "compton &"
    spawnOnce "trayer --edge top --align right --padding 10 --SetDockType true --SetPartialStrut true --expand true --monitor 2 --transparent true --alpha 0 --tint 0x111111  --height 18 --width 20 &"
    spawnOnce "nm-applet &"
    spawnOnce "volumeicon &"
    spawnOnce "flameshot &"
    spawnOnce "xscreensaver -no-splash &"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--


main = do
    xmproc0 <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc"
    xmproc1 <- spawnPipe "xmobar -x 1 ~/.config/xmobar/xmobarrc"
    xmproc2 <- spawnPipe "xmobar -x 2 ~/.config/xmobar/xmobarrc"
    

    xmonad $ ewmh desktopConfig
        { manageHook =
            manageDocks 
            <+> myManageHook
            <+> (isDialog --> doF W.shiftMaster)
            <+> doF W.swapDown
            
        , startupHook        = myStartupHook
        , layoutHook         = myLayout
--      , handleEventHook    = myEventHook
        , workspaces         = myWorkspaces
        , borderWidth        = myBorderWidth
        , terminal           = myTerminal
        , modMask            = myModMask
        , keys               = myKeys
        , mouseBindings      = myMouseBindings
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , logHook = dynamicLogWithPP xmobarPP  
                        { ppOutput = \x -> hPutStrLn xmproc0 x >> hPutStrLn xmproc1 x >> hPutStrLn xmproc2 x
                        , ppCurrent = xmobarColor myppCurrent "" . wrap "[" "]" -- Current workspace in xmobar
                        , ppVisible = xmobarColor myppVisible ""                -- Visible but not current workspace
                        , ppHidden = xmobarColor myppHidden "" . wrap "+" ""   -- Hidden workspaces in xmobar
                        , ppHiddenNoWindows = xmobarColor  myppHiddenNoWindows ""        -- Hidden workspaces (no windows)
                        , ppTitle = xmobarColor  myppTitle "" . shorten 80     -- Title of active window in xmobar
                        , ppSep =  "<fc=#eeeeee> | </fc>"                     -- Separators in xmobar
                        , ppUrgent = xmobarColor  myppUrgent "" . wrap "!" "!"  -- Urgent workspace
                        , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                        }
          }

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
      
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
