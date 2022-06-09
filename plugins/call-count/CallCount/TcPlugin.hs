{-# LANGUAGE QuasiQuotes, NamedFieldPuns #-}

module CallCount.TcPlugin (callCount, optCallCount) where

import Language.Haskell.Printf (s)
import Data.Maybe (fromMaybe)
import Data.IORef (IORef)
import GHC.Corroborate
import NoOp.Plugin

newtype State = State{callref :: IORef Int}

callCount :: TcPlugin
callCount = fromMaybe noOp $ optCallCount []

optCallCount :: [CommandLineOption] -> Maybe TcPlugin
optCallCount opts = Just $
    TcPlugin
        { tcPluginInit = State <$> unsafeTcPluginTcM (newMutVar 1)

        , tcPluginSolve = \State{callref = c} _ _ _ -> do
            n <- unsafeTcPluginTcM $ readMutVar c
            let msg = if null opts then "GHC-TcPlugin" else mconcat opts
            tcPluginIO . putStrLn $ [s|>>> %s #%d|] msg n
            unsafeTcPluginTcM $ writeMutVar c (n + 1)
            return $ TcPluginOk [] []

        , tcPluginStop = const $ return ()
        }