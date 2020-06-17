module CallCount.Pure.Plugin (plugin) where

import Plugins (Plugin)
import NoOp.Plugin (mkPureTcPlugin)
import CallCount.TcPlugin (callCount)

plugin :: Plugin
plugin = mkPureTcPlugin callCount
