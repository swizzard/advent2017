module Day4 where

import Data.Function (on)
import Data.List (nub, nubBy)
import qualified Data.Set as S

getLines :: IO [[String]]
getLines = map words . lines <$> readFile "data/day4.txt"

infixl 3 =@=
(=@=) :: [a] -> [a] -> Bool
(=@=) = ((==) `on` length)

tots :: Eq a => [[a]] -> Int
tots = length . filter (\x -> x =@= nub x)

main = tots <$> getLines


areAna :: Ord a => [a] -> [a] -> Bool
areAna a b = let f x y = S.null $ S.fromList x S.\\ S.fromList y
              in f a b && f b a

tots2 :: [[String]] -> Int
tots2 = length . filter (\x -> x =@= nubBy areAna x)

main2 = tots2 <$> getLines
