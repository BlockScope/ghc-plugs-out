module CallCount.Impure.Plugin (plugin) where

import GHC.Corroborate
import NoOp.Plugin (mkImpureTcPlugin)
import CallCount.TcPlugin (callCount)

plugin :: Plugin
plugin = mkImpureTcPlugin callCount
