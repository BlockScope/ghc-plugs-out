module Undefined.Init.Plugin (plugin) where

import Plugins (Plugin(..), tcPlugin, defaultPlugin)
import TcRnTypes (TcPluginResult(..), TcPlugin(..))

plugin :: Plugin
plugin = defaultPlugin { tcPlugin = const $ Just undefinedPlugin }

undefinedPlugin :: TcPlugin
undefinedPlugin =
    TcPlugin
        { tcPluginInit = undefined
        , tcPluginSolve = \_ _ _ _ -> return $ TcPluginOk [] []
        , tcPluginStop = const $ return ()
        }
