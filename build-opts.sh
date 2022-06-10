# The steps in .github/workflows/cabal.yml related to passing options to plugins.
# You might like to run cabal update and cabal clean before running this script.
cabal build test-in-turn
cabal build test-in-line
cabal build test-in-turn-each
cabal build test-in-line-each