# The steps in .github/workflows/cabal.yml related to wiring up plugins.
# You might like to run cabal update and cabal clean before running this script.
cabal build all --disable-tests
cabal build test-wireup-pure-by-option
cabal build test-wireup-pure-by-pragma
cabal build test-wireup-pure-by-both
cabal build test-wireup-impure-by-option
cabal build test-wireup-impure-by-pragma
cabal build test-wireup-impure-by-both
cabal build test-counter-main
cabal build test-counter-foo-bar-main
cabal build test-counter-foobar-main