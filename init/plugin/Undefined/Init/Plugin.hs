module Undefined.Init.Plugin (plugin) where

import Plugins (Plugin(..), tcPlugin, defaultPlugin)
import TcRnTypes (TcPluginM, TcPluginResult, Ct, TcPlugin(..))
import GHC.TcPluginM.Extra (tracePlugin)

plugin :: Plugin
plugin = defaultPlugin { tcPlugin = const $ Just undefinedPlugin }

undefinedPlugin :: TcPlugin
undefinedPlugin = tracePlugin "undefined-init-plugin" $
    TcPlugin
        { tcPluginInit  = undefined
        , tcPluginSolve = solver
        , tcPluginStop  = const $ return ()
        }

solver :: () -> [Ct] -> [Ct] -> [Ct] -> TcPluginM TcPluginResult
solver = undefined
