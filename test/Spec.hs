module Main (main) where

import Control.Monad (unless)
import qualified Problem17
import qualified Problem4
import System.Exit (exitFailure)

main :: IO ()
main = do
    mapM_ (assertEqual 9009) problem4Solutions
    mapM_ (assertEqual 21124) problem17Solutions
    putStrLn "All solution checks passed."

problem4Solutions :: [(String, Integer)]
problem4Solutions =
    [ ("Problem4.solve", Problem4.solve 10 99)
    , ("Problem4.solveBack", Problem4.solveBack 10 99)
    , ("Problem4.solveRecursive", Problem4.solveRecursive 10 99)
    , ("Problem4.solveTailrec", Problem4.solveTailrec 10 99)
    , ("Problem4.solveModular", Problem4.solveModular 10 99)
    , ("Problem4.solveMap", Problem4.solveMap 10 99)
    , ("Problem4.solveComprehension", Problem4.solveComprehension 10 99)
    , ("Problem4.solveInf", Problem4.solveInf 10 99)
    ]

problem17Solutions :: [(String, Integer)]
problem17Solutions =
    [ ("Problem17.solve", Problem17.solve 1 1000)
    , ("Problem17.solveBack", Problem17.solveBack 1 1000)
    , ("Problem17.solveRecursive", Problem17.solveRecursive 1 1000)
    , ("Problem17.solveTailrec", Problem17.solveTailrec 1 1000)
    , ("Problem17.solveModular", Problem17.solveModular 1 1000)
    , ("Problem17.solveMap", Problem17.solveMap 1 1000)
    , ("Problem17.solveComprehension", Problem17.solveComprehension 1 1000)
    , ("Problem17.solveInf", Problem17.solveInf 1 1000)
    ]

assertEqual :: (Eq value, Show value) => value -> (String, value) -> IO ()
assertEqual expected (name, actual) =
    unless (actual == expected) $ do
        putStrLn
            (name ++ ": expected " ++ show expected ++ ", got " ++ show actual)
        exitFailure
