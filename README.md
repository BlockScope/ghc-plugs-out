# ghc-plugs-out
This package's GHC plugins that do not behave well. They have undefined
implementations for plugin functions init, solve and stop. When GHC calls into
the plugin it panics.

```
> cabal build
> stack test undefined-init-invoke
> stack test undefined-solve-invoke
> stack test undefined-stop-invoke
```

```
> stack build
> stack test ghc-plugs-out:undefined-init-invoke
> stack test ghc-plugs-out:undefined-solve-invoke
> stack test ghc-plugs-out:undefined-stop-invoke
```
