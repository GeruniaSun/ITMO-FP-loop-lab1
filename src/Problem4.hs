module Problem4
  ( solve,
    solveBack,
    solveRecursive,
    solveTailrec,
    solveModular,
    solveMap,
    solveComprehension,
    solveInf,
  )
where

import Data.List (foldl')

isPalindrome :: Integer -> Bool
isPalindrome n = show n == reverse (show n)

-- базовое решение
solve :: Integer -> Integer -> Integer
solve left right = maximum [prod | a <- [left .. right], b <- [a .. right], let prod = a * b, isPalindrome prod]

-- решение побыстрей
solveBack :: Integer -> Integer -> Integer
solveBack left right = maximum [prod | a <- [right, right - 1 .. left], b <- [a, a - 1 .. left], let prod = a * b, isPalindrome prod]

-- рекурсия
solveRecursive :: Integer -> Integer -> Integer
solveRecursive left right = searchA left
  where
    searchA a
      | a > right = 0
      | otherwise = max (searchB a a) (searchA (a + 1))

    searchB a b
      | b > right = 0
      | otherwise = max (if isPalindrome (a * b) then a * b else 0) (searchB a (b + 1))

-- хвостовая рекурсия
solveTailrec :: Integer -> Integer -> Integer
solveTailrec left right = search left left 0
  where
    search a b best
      | a > right = best
      | b > right = search (a + 1) (a + 1) best
      | otherwise = search a (b + 1) (if isPalindrome (a * b) then max best (a * b) else best)

-- бесконечная последовательность
solveInf :: Integer -> Integer -> Integer
solveInf left right = head [p | p <- takeWhile (>= left * left) [n | n <- [right * right, right * right - 1 ..], isPalindrome n], p `elem` [a * b | a <- [left .. right], b <- [a .. right]]]

-- модульное решение
generateProducts :: Integer -> Integer -> [Integer]
generateProducts left right = [a * b | a <- [left .. right], b <- [a .. right]]

filterPalindromes :: [Integer] -> [Integer]
filterPalindromes = filter isPalindrome

solveModular :: Integer -> Integer -> Integer
solveModular left right = foldl' max 0 (filterPalindromes (generateProducts left right))

-- мап
solveMap :: Integer -> Integer -> Integer
solveMap left right = maximum $ filter isPalindrome $ concatMap (flip map [left .. right]) (map (*) [left .. right])

solveComprehension :: Integer -> Integer -> Integer
solveComprehension left right = maximum [a * b | a <- [left .. right], b <- [a .. right], isPalindrome (a * b)]
