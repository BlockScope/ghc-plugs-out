{-# OPTIONS_GHC     -fplugin CallCount.Pure.Plugin #-}
{-# OPTIONS_GHC -fplugin-opt CallCount.Pure.Plugin:A #-}
{-# OPTIONS_GHC     -fplugin CallCount.Pure.Plugin #-}
{-# OPTIONS_GHC -fplugin-opt CallCount.Pure.Plugin:B #-}

{-# OPTIONS_GHC -fclear-plugins #-}

{-# OPTIONS_GHC -fplugin CallCount.Pure.Plugin -fplugin-opt CallCount.Pure.Plugin:A #-}
{-# OPTIONS_GHC -fplugin CallCount.Pure.Plugin -fplugin-opt CallCount.Pure.Plugin:B #-}

module Main where

foo :: IO a
foo = undefined

bar :: IO a
bar = undefined

main :: IO ()
main = return ()
