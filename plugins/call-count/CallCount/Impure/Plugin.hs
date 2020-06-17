module CallCount.Impure.Plugin (plugin) where

import Plugins (Plugin)
import NoOp.Plugin (mkImpureTcPlugin)
import CallCount.TcPlugin (callCount)

plugin :: Plugin
plugin = mkImpureTcPlugin callCount
