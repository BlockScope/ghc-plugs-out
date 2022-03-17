module CallCount.Pure.Plugin (plugin) where

import GHC.Corroborate
import NoOp.Plugin (mkPureTcPlugin)
import CallCount.TcPlugin (callCount)

plugin :: Plugin
plugin = mkPureTcPlugin callCount
