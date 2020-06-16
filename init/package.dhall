    let defs = ./../defaults.dhall

in    defs
    ⫽ { name =
          "undefined-init-plugin"
      , library =
          { dependencies =
              [ "base"
              , "deepseq"
              , "ghc"
              , "ghc-tcplugins-extra"
              , "template-haskell"
              , "containers"
              ]
          , source-dirs =
              "plugin"
          , exposed-modules =
              "Undefined.Init.Plugin"
          }
      , tests =
          { invoke =
              { dependencies =
                  [ "base", "undefined-init-plugin" ]
              , main =
                  "Main.hs"
              , source-dirs =
                  "plugin-test"
              }
          }
      }
