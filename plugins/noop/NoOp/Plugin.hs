{-# LANGUAGE RankNTypes, CPP #-}

module NoOp.Plugin
    ( plugin
    , noOp, undefInit, undefSolve, undefStop
    , mkPureTcPlugin, mkPureOptTcPlugin, mkImpureTcPlugin
    ) where

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
#if __GLASGOW_HASKELL__ >= 806
        , pluginRecompile = purePlugin
#endif
        }

mkImpureTcPlugin :: TcPlugin -> Plugin
mkImpureTcPlugin p =
    defaultPlugin
        { tcPlugin = const $ Just p
#if __GLASGOW_HASKELL__ >= 806
        , pluginRecompile = impurePlugin
#endif
        }

mkPureOptTcPlugin :: ([CommandLineOption] -> Maybe TcPlugin) -> Plugin
mkPureOptTcPlugin p =
    defaultPlugin
        { tcPlugin = p
#if __GLASGOW_HASKELL__ >= 806
        , pluginRecompile = purePlugin
#endif
        }
