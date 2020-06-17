module Undefined.Init.Plugin (plugin) where

import Plugins (Plugin)
import NoOp.Plugin (undefInit, mkPureTcPlugin)

plugin :: Plugin
plugin = mkPureTcPlugin undefInit
