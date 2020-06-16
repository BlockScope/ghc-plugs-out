module Undefined.Init.Plugin (plugin) where

import Plugins (Plugin(..), tcPlugin, defaultPlugin)
import TcRnTypes (TcPluginResult(..), TcPlugin(..))
import GHC.TcPluginM.Extra (tracePlugin)

plugin :: Plugin
plugin = defaultPlugin { tcPlugin = const $ Just undefinedPlugin }

undefinedPlugin :: TcPlugin
undefinedPlugin = tracePlugin "undefined-init-plugin" $
    TcPlugin
        { tcPluginInit  = undefined
        , tcPluginSolve = \_ _ _ _ -> return $ TcPluginOk [] []
        , tcPluginStop  = const $ return ()
        }
