{-# LANGUAGE RankNTypes #-}

module NoOp.Plugin
    ( plugin
    , noOp, undefInit, undefSolve, undefStop
    , mkPureTcPlugin, mkPureOptTcPlugin, mkImpureTcPlugin
    ) where

import GHC.Driver.Plugins (CommandLineOption)
import GHC.Corroborate

plugin :: Plugin
plugin = mkPureTcPlugin noOp

noOp :: TcPlugin
noOp =
    TcPlugin
        { tcPluginInit = return ()
        , tcPluginSolve = \_ _ _ _ -> return $ TcPluginOk [] []
        , tcPluginStop = const $ return ()
        }

-- WARNING: Can't use record update syntax for existentially qualified types.
-- SEE: https://gitlab.haskell.org/ghc/ghc/issues/2595
-- data TcPlugin = forall s. TcPlugin
--   { tcPluginInit  :: TcPluginM s
--   , tcPluginSolve :: s -> TcPluginSolver
--   , tcPluginStop  :: s -> TcPluginM ()
--   }

-- noOp { tcPluginInit = undefined }
undefInit :: TcPlugin
undefInit =
    TcPlugin
        { tcPluginInit = undefined
        , tcPluginSolve = \_ _ _ _ -> return $ TcPluginOk [] []
        , tcPluginStop = const $ return ()
        }

-- noOp { tcPluginSolve = \_ _ _ _ -> undefined }
undefSolve :: TcPlugin
undefSolve =
    TcPlugin
        { tcPluginInit = return ()
        , tcPluginSolve = \_ _ _ _ -> undefined
        , tcPluginStop = const $ return ()
        }

-- noOp { tcPluginStop = const undefined }
undefStop :: TcPlugin
undefStop =
    TcPlugin
        { tcPluginInit = return ()
        , tcPluginSolve = \_ _ _ _ -> return $ TcPluginOk [] []
        , tcPluginStop = const undefined
        }

mkPureTcPlugin :: TcPlugin -> Plugin
mkPureTcPlugin p =
    defaultPlugin
        { tcPlugin = const $ Just p
        , pluginRecompile = purePlugin
        }

mkImpureTcPlugin :: TcPlugin -> Plugin
mkImpureTcPlugin p =
    defaultPlugin
        { tcPlugin = const $ Just p
        , pluginRecompile = impurePlugin
        }

mkPureOptTcPlugin :: ([CommandLineOption] -> Maybe TcPlugin) -> Plugin
mkPureOptTcPlugin p =
    defaultPlugin
        { tcPlugin = p
        , pluginRecompile = purePlugin
        }
