-- | This module re-exports the call count plugin so that it is available from
-- another module name. This enables setting up tests between plugins and their
-- options when a module pulls in multiple plugins. See module
-- "CallCount.Pure.Plugin1" for examples.
module CallCount.Pure.Plugin2 (plugin) where import CallCount.Pure.Plugin (plugin)