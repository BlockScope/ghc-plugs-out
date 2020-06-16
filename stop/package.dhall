    let defs = ./../defaults.dhall

in    defs
    ⫽ { name =
          "undefined-stop-plugin"
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
              "Undefined.Stop.Plugin"
          }
      , tests =
          { invoke =
              { dependencies =
                  [ "base", "undefined-stop-plugin" ]
              , main =
                  "Main.hs"
              , source-dirs =
                  "plugin-test"
              }
          }
      }
