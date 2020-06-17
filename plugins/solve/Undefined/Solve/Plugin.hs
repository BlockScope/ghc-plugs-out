module Undefined.Solve.Plugin (plugin) where

import Plugins (Plugin(..), tcPlugin, defaultPlugin)
import TcRnTypes (TcPlugin(..))

plugin :: Plugin
plugin = defaultPlugin { tcPlugin = const $ Just undefinedPlugin }

undefinedPlugin :: TcPlugin
undefinedPlugin =
    TcPlugin
        { tcPluginInit = return ()
        , tcPluginSolve = \_ _ _ _ -> undefined
        , tcPluginStop = const $ return ()
        }
