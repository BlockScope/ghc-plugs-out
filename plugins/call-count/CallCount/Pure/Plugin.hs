module CallCount.Pure.Plugin (plugin) where

import GHC.Corroborate
import NoOp.Plugin (mkPureOptTcPlugin)
import CallCount.TcPlugin (optCallCount)

plugin :: Plugin
plugin = mkPureOptTcPlugin optCallCount
