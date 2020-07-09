{-# OPTIONS_GHC -fplugin CallCount.Pure.Plugin #-}

module Foo where

foo :: IO a
foo = undefined
