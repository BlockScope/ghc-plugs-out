module Undefined.Init.Plugin (plugin) where

import GHC.Corroborate
import NoOp.Plugin (undefInit, mkPureTcPlugin)

plugin :: Plugin
plugin = mkPureTcPlugin undefInit
