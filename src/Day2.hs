module Day2 where

getRows :: IO [[Int]]
getRows = ((map . map) read . map words . lines) <$> readFile "data/day2.txt"

diff :: [Int] -> Int
diff xs = let h = head xs in go xs h h where
  go [] mx mn = mx - mn
  go (x:xs) mx mn | x > mx = go xs x mn
                  | x < mn = go xs mx x
                  | otherwise = go xs mx mn

main = (sum . map diff) <$> getRows
