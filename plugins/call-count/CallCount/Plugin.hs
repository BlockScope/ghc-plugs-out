{-# LANGUAGE QuasiQuotes, NamedFieldPuns #-}

module CallCount.Plugin (plugin) where

import Language.Haskell.Printf (s)
import Data.IORef (IORef)
import IOEnv (newMutVar, readMutVar, writeMutVar)
import TcPluginM (tcPluginIO)
import Plugins (Plugin(..), tcPlugin, defaultPlugin)
import TcRnTypes (TcPluginResult(..), TcPlugin(..), unsafeTcPluginTcM)

newtype State = State{callref :: IORef Int}

plugin :: Plugin
plugin = defaultPlugin { tcPlugin = const $ Just undefinedPlugin }

undefinedPlugin :: TcPlugin
undefinedPlugin =
    TcPlugin
        { tcPluginInit = return . State =<< (unsafeTcPluginTcM $ newMutVar 1)

        , tcPluginSolve = \State{callref = c} _ _ _ -> do
            n <- unsafeTcPluginTcM $ readMutVar c
            tcPluginIO . putStrLn $ [s|>>> GHC-TcPlugin-CallCount (%d)|] n
            unsafeTcPluginTcM $ writeMutVar c (n + 1)
            return $ TcPluginOk [] []

        , tcPluginStop = const $ return ()
        }
