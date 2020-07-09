{-# OPTIONS_GHC -fplugin CallCount.Pure.Plugin #-}

module FooBar where

foo :: IO a
foo = undefined

bar :: IO a
bar = undefined
