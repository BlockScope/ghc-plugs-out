{-# LANGUAGE QuasiQuotes, NamedFieldPuns #-}

module CallCount.TcPlugin (callCount) where

import Language.Haskell.Printf (s)
import Data.IORef (IORef)
import IOEnv (newMutVar, readMutVar, writeMutVar)
import TcPluginM (tcPluginIO)
import TcRnTypes (TcPluginResult(..), TcPlugin(..), unsafeTcPluginTcM)

newtype State = State{callref :: IORef Int}

callCount :: TcPlugin
callCount =
    TcPlugin
        { tcPluginInit = return . State =<< (unsafeTcPluginTcM $ newMutVar 1)

        , tcPluginSolve = \State{callref = c} _ _ _ -> do
            n <- unsafeTcPluginTcM $ readMutVar c
            tcPluginIO . putStrLn $ [s|>>> GHC-TcPlugin-CallCount (%d)|] n
            unsafeTcPluginTcM $ writeMutVar c (n + 1)
            return $ TcPluginOk [] []

        , tcPluginStop = const $ return ()
        }
