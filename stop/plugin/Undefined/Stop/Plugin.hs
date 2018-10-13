module Undefined.Stop.Plugin (plugin) where

import Plugins (Plugin(..), tcPlugin, defaultPlugin)
import TcRnTypes (TcPluginM, TcPluginResult(..), Ct, TcPlugin(..))
import GHC.TcPluginM.Extra (tracePlugin)

plugin :: Plugin
plugin = defaultPlugin { tcPlugin = const $ Just undefinedPlugin }

undefinedPlugin :: TcPlugin
undefinedPlugin = tracePlugin "undefined-stop-plugin" $
    TcPlugin
        { tcPluginInit  = return ()
        , tcPluginSolve = \_ _ _ _ -> return $ TcPluginOk [] []
        , tcPluginStop  = const $ undefined
        }
