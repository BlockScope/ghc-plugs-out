module Undefined.Stop.Plugin (plugin) where

import Plugins (Plugin)
import NoOp.Plugin (undefStop, mkPureTcPlugin)

plugin :: Plugin
plugin = mkPureTcPlugin undefStop
