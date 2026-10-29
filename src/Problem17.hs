-- If the numbers  to  are written out in words: one, two, three, four, five, 
-- then there are 3 + 3 + 5 +4 + 4 = 19 letters used in total.
-- If all the numbers from 1 to 1000 inclusive were written out in words, 
-- how many letters would be used?

-- NOTE: Do not count spaces or hyphens. 
-- For example, 342 (three hundred and forty-two) contains 23 letters
-- and 115 (one hundred and fifteen) contains 20 letters.
-- The use of "and" when writing out numbers is in compliance with British usage.
module Problem17
  ( solve
  , solveBack
  , solveRecursive
  , solveTailrec
  , generateNumbers
  , filterValidNumbers
  , solveModular
  , solveMap
  , solveComprehension
  , solveInf
  ) where

import Data.Char (isLetter)
import Data.List (foldl')

smallWords :: [String]
smallWords =
  [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"
  , "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
  ]

tensWords :: [String]
tensWords = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

numberWords :: Int -> String
numberWords n
  | n < 1 || n > 1000 = error "numberWords supports numbers from 1 to 1000"
  | n == 1000 = "one thousand"
  | n < 20 = smallWords !! n
  | n < 100 = tensWords !! (n `div` 10) ++ if n `mod` 10 == 0 then "" else "-" ++ smallWords !! (n `mod` 10)
  | n `mod` 100 == 0 = smallWords !! (n `div` 100) ++ " hundred"
  | otherwise = smallWords !! (n `div` 100) ++ " hundred and " ++ numberWords (n `mod` 100)

letterCount :: Int -> Integer
letterCount = fromIntegral . length . filter isLetter . numberWords

solve :: Int -> Int -> Integer
solve left right = sum [letterCount n | n <- [left..right]]

solveBack :: Int -> Int -> Integer
solveBack left right = sum [letterCount n | n <- [right,right-1..left]]

solveRecursive :: Int -> Int -> Integer
solveRecursive left right
  | left > right = 0
  | otherwise = letterCount left + solveRecursive (left + 1) right

solveTailrec :: Int -> Int -> Integer
solveTailrec left right = go left 0
  where
    go n total
      | n > right = total
      | otherwise = go (n + 1) (total + letterCount n)

generateNumbers :: Int -> Int -> [Int]
generateNumbers left right = [left..right]

filterValidNumbers :: [Int] -> [Int]
filterValidNumbers = filter (\n -> n >= 1 && n <= 1000)

solveModular :: Int -> Int -> Integer
solveModular left right = foldl' (+) 0 (map letterCount (filterValidNumbers (generateNumbers left right)))

solveMap :: Int -> Int -> Integer
solveMap left right = sum (map letterCount [left..right])

solveComprehension :: Int -> Int -> Integer
solveComprehension left right = sum [letterCount n | n <- [left..right]]

solveInf :: Int -> Int -> Integer
solveInf left right
  | right < left = 0
  | left < 1 || right > 1000 = error "solveInf supports numbers from 1 to 1000"
  | otherwise = sum (take (right - left + 1) (drop (left - 1) (map letterCount [1..])) )
