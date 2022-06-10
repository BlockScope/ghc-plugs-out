{-# LANGUAGE QuasiQuotes, NamedFieldPuns #-}

module CallCount.TcPlugin (callCount, optCallCount) where

import Language.Haskell.Printf (s)
import Data.Maybe (fromMaybe)
import Data.IORef (IORef)
import GHC.Corroborate
import NoOp.Plugin

newtype State = State{callref :: IORef Int}

-- | A plugin that counts the number of times its 'tcPluginSolve' function is
-- called when GHC is type checking.
callCount :: TcPlugin
callCount = fromMaybe noOp $ optCallCount []

-- | This plugin does no type checking.
--
-- Any options passed are echoed as a prefix before the call count when
-- 'tcPluginSolve' is called. If no options are passed then __GHC-TcPlugin__ is
-- used instead as the prefix before the count like this test suite shows.
--
-- @
-- Building test suite 'test-counter-foobar-main'
-- [1 of 2] Compiling FooBar
-- >>> GHC-TcPlugin #1
-- >>> GHC-TcPlugin #2
-- [2 of 2] Compiling Main
-- @
--
-- The options passed to 'optCallCount' are echoed as a prefix in the test
-- suites called by @./build-opts.sh@.
--
-- @
-- > cat ./build-opts.sh
-- # The steps in .github\/workflows\/cabal.yml related to passing options to plugins.
-- # You might like to run cabal update and cabal clean before running this script.
-- cabal build test-in-turn
-- cabal build test-in-line
-- cabal build test-in-turn-each
-- cabal build test-in-line-each
-- @
--
-- @
-- > ./build-opts.sh
-- ...
-- Building test suite 'test-in-turn'
-- [1 of 1] Compiling Main
-- >>> AB #1
-- >>> AB #1
-- >>> AB #2
-- >>> AB #2
-- ...
-- Building test suite 'test-in-line'
-- [1 of 1] Compiling Main
-- >>> AB #1
-- >>> AB #1
-- >>> AB #2
-- >>> AB #2
-- ...
-- Building test suite 'test-in-turn-each'
-- [1 of 1] Compiling Main
-- >>> B #1
-- >>> A #1
-- >>> B #2
-- >>> A #2
-- ...
-- Building test suite 'test-in-line-each'
-- [1 of 1] Compiling Main
-- >>> B #1
-- >>> A #1
-- >>> B #2
-- >>> A #2
-- @
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