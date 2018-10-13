module Undefined.Stop.Plugin (plugin) where

import Plugins (Plugin(..), tcPlugin, defaultPlugin)
import TcRnTypes (TcPluginM, TcPluginResult, Ct, TcPlugin(..))
import GHC.TcPluginM.Extra (tracePlugin)

plugin :: Plugin
plugin = defaultPlugin { tcPlugin = const $ Just undefinedPlugin }

undefinedPlugin :: TcPlugin
undefinedPlugin =
    tracePlugin
        "undefined-plugin"
        TcPlugin
            { tcPluginInit  = return ()
            , tcPluginSolve = solver
            , tcPluginStop  = const $ undefined
            }

solver :: () -> [Ct] -> [Ct] -> [Ct] -> TcPluginM TcPluginResult
solver = undefined
