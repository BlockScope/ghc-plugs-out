# ghc-plugin-undefined
A set of three ghc plugins with undefined implementations for plugin functions
init, solve and stop.

```
undefined-plugin> stack test
undefined-solve-plugin-1.0.0.0: build (lib + test)
undefined-stop-plugin-1.0.0.0: build (lib + test)
undefined-init-plugin-1.0.0.0: build (lib + test)
Log files have been written to: /.../undefined-plugin/.stack-work/logs/
Progress 3/6

--  While building custom Setup.hs for package undefined-solve-plugin-1.0.0.0 using:
    ...
    Process exited with code: ExitFailure 1

    Preprocessing library for undefined-solve-plugin-1.0.0.0..
    Building library for undefined-solve-plugin-1.0.0.0..
    Preprocessing test suite 'invoke' for undefined-solve-plugin-1.0.0.0..
    Building test suite 'invoke' for undefined-solve-plugin-1.0.0.0..
    [1 of 2] Compiling Main             ( plugin-test/Main.hs, .stack-work/.../Main.o )
    ghc: panic! (the 'impossible' happened)
      (GHC version 8.2.2 for x86_64-apple-darwin):
    	Prelude.undefined
    CallStack (from HasCallStack):
      error, called at libraries/base/GHC/Err.hs:79:14 in base:GHC.Err
      undefined, called at plugin/Undefined/Solve/Plugin.hs:14:39 in
      undefined-solve-plugin-1.0.0.0-56evBabJYBHHTUlrE3HO5m:Undefined.Solve.Plugin

    Please report this as a GHC bug:  http://www.haskell.org/ghc/reportabug


--  While building custom Setup.hs for package undefined-stop-plugin-1.0.0.0 using:
    ...
    Process exited with code: ExitFailure 1

    Preprocessing library for undefined-stop-plugin-1.0.0.0..
    Building library for undefined-stop-plugin-1.0.0.0..
    Preprocessing test suite 'invoke' for undefined-stop-plugin-1.0.0.0..
    Building test suite 'invoke' for undefined-stop-plugin-1.0.0.0..
    [1 of 2] Compiling Main             ( plugin-test/Main.hs, .stack-work/.../Main.o )
    ghc: panic! (the 'impossible' happened)
      (GHC version 8.2.2 for x86_64-apple-darwin):
    	Prelude.undefined
    CallStack (from HasCallStack):
      error, called at libraries/base/GHC/Err.hs:79:14 in base:GHC.Err
      undefined, called at plugin/Undefined/Stop/Plugin.hs:15:35 in
      undefined-stop-plugin-1.0.0.0-5q9UbUedRjw1HCYnMRvNrX:Undefined.Stop.Plugin

    Please report this as a GHC bug:  http://www.haskell.org/ghc/reportabug


--  While building custom Setup.hs for package undefined-init-plugin-1.0.0.0 using:
    ...
    Process exited with code: ExitFailure 1

    Preprocessing library for undefined-init-plugin-1.0.0.0..
    Building library for undefined-init-plugin-1.0.0.0..
    Preprocessing test suite 'invoke' for undefined-init-plugin-1.0.0.0..
    Building test suite 'invoke' for undefined-init-plugin-1.0.0.0..
    [1 of 2] Compiling Main             ( plugin-test/Main.hs, .stack-work/.../Main.o )
    ghc: panic! (the 'impossible' happened)
      (GHC version 8.2.2 for x86_64-apple-darwin):
    	Prelude.undefined
    CallStack (from HasCallStack):
      error, called at libraries/base/GHC/Err.hs:79:14 in base:GHC.Err
      undefined, called at plugin/Undefined/Init/Plugin.hs:13:27 in
      undefined-init-plugin-1.0.0.0-J5ic5fcAjFx6uWi0PWk14D:Undefined.Init.Plugin

    Please report this as a GHC bug:  http://www.haskell.org/ghc/reportabug
```
