module Undefined.Stop.Plugin (plugin) where

import Plugins (Plugin(..), tcPlugin, defaultPlugin)
import TcRnTypes (TcPluginResult(..), TcPlugin(..))

plugin :: Plugin
plugin = defaultPlugin { tcPlugin = const $ Just undefinedPlugin }

undefinedPlugin :: TcPlugin
undefinedPlugin =
    TcPlugin
        { tcPluginInit = return ()
        , tcPluginSolve = \_ _ _ _ -> return $ TcPluginOk [] []
        , tcPluginStop = const $ undefined
        }
