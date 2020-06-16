    let defs = ./../defaults.dhall

in    defs
    ⫽ { name =
          "undefined-solve-plugin"
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
              "Undefined.Solve.Plugin"
          }
      , tests =
          { invoke =
              { dependencies =
                  [ "base", "undefined-solve-plugin" ]
              , main =
                  "Main.hs"
              , source-dirs =
                  "plugin-test"
              }
          }
      }
