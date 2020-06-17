module Undefined.Solve.Plugin (plugin) where

import Plugins (Plugin)
import NoOp.Plugin (undefSolve, mkPureTcPlugin)

plugin :: Plugin
plugin = mkPureTcPlugin undefSolve
