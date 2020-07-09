{-# OPTIONS_GHC -fplugin CallCount.Pure.Plugin #-}

module Main where

foo :: IO a
foo = undefined

bar :: IO a
bar = undefined

main :: IO ()
main = return ()
