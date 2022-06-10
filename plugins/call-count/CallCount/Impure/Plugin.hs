-- | This module provides an impure call count plugin that prints a message each
-- time its called. See the pure "CallCount.Pure.Plugin" module for examples.
module CallCount.Impure.Plugin (plugin) where

import GHC.Corroborate
import NoOp.Plugin (mkImpureTcPlugin)
import CallCount.TcPlugin (callCount)

plugin :: Plugin
plugin = mkImpureTcPlugin callCount
