{-# OPTIONS_GHC -fplugin CallCount.Pure.Plugin #-}

module Bar where

bar :: IO a
bar = undefined
