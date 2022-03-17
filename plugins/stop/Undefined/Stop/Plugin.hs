module Undefined.Stop.Plugin (plugin) where

import GHC.Corroborate
import NoOp.Plugin (undefStop, mkPureTcPlugin)

plugin :: Plugin
plugin = mkPureTcPlugin undefStop
