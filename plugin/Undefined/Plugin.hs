module Undefined.Plugin (plugin) where

import Plugins (Plugin(..), tcPlugin, defaultPlugin)
import TcRnTypes (TcPluginM, TcPluginResult, Ct, TcPlugin(..))
import GHC.TcPluginM.Extra (tracePlugin)

plugin :: Plugin
plugin =
    defaultPlugin
        { tcPlugin = const $ Just undefinedPlugin }

undefinedPlugin :: TcPlugin
undefinedPlugin =
    tracePlugin
        "undefined-plugin"
        TcPlugin
            { tcPluginInit  = initializer
            , tcPluginSolve = solver
            , tcPluginStop  = const $ return ()
            }

initializer :: TcPluginM ()
initializer = undefined

solver :: () -> [Ct] -> [Ct] -> [Ct] -> TcPluginM TcPluginResult
solver = undefined
