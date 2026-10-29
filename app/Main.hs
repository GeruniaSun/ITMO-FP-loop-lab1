module Main (main) where

import Problem4
import qualified Problem17

main :: IO ()
main = do
  mapM_ printResult
    [ ("solveTailrec", Problem4.solveTailrec 100 999)
    , ("solveRecursive", Problem4.solveRecursive 100 999)
    , ("solveModular", Problem4.solveModular 100 999)
    , ("solveMap", Problem4.solveMap 100 999)
    , ("solveComprehension", Problem4.solveComprehension 100 999)
    , ("solve", Problem4.solve 100 999)
    , ("solveBack", Problem4.solveBack 100 999)
    , ("solveInf", Problem4.solveInf 100 999)
    , ("Problem17.solveTailrec", Problem17.solveTailrec 1 1000)
    , ("Problem17.solveRecursive", Problem17.solveRecursive 1 1000)
    , ("Problem17.solveModular", Problem17.solveModular 1 1000)
    , ("Problem17.solveMap", Problem17.solveMap 1 1000)
    , ("Problem17.solveComprehension", Problem17.solveComprehension 1 1000)
    , ("Problem17.solve", Problem17.solve 1 1000)
    , ("Problem17.solveBack", Problem17.solveBack 1 1000)
    , ("Problem17.solveInf", Problem17.solveInf 1 1000)
    ]

printResult :: (String, Integer) -> IO ()
printResult (name, result) = putStrLn (name ++ ": " ++ show result)
