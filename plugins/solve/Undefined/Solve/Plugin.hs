module Undefined.Solve.Plugin (plugin) where

import GHC.Corroborate
import NoOp.Plugin (undefSolve, mkPureTcPlugin)

plugin :: Plugin
plugin = mkPureTcPlugin undefSolve
