module Day1 where

import Data.List (foldl')

cyc :: Integer -> String
cyc x = let s = show x in take (length s + 1) $ cycle s

makePairs :: Eq a => [a] -> [[a]]
makePairs [] = []
makePairs (a:[]) = []
makePairs (a:b:xs) | a == b = [a, b]:(makePairs (b:xs))
                   | otherwise = makePairs (b:xs)

splitS :: String -> [String]
splitS [] = []
splitS (c:cs) = [c]:splitS cs

sumPs :: [[String]] -> Int
sumPs = sum . map last . (map . map) read

input :: Integer
input = 494751136895345894732582362629576539599184296195318162664695189393364372585778868512194863927652788149779748657989318645936221887731542718562643272683862627537378624843614831337441659741281289638765171452576466381314558821636595394981788588673443769343597851883955668818165723174939893841654914556681324133667446412138511724424292394454166623639872425168644336248217213826339741267546823779383343362789527461579565822966859349777937921933694912369552152772735167832762563719664315456987186713541153781499646178238762644186484381142249926194743713139262596264878458636595896487362658672224346241358667234115974528626523648311919886566497837217169673923935143386823757293148719377821517314629812886912412829924484513493885672343964151252433622341141661523814465991516961684511941471572895453711624986269342398786175846925783918686856442684489873327497698963658862856336682422797551251489126661954848572297228765445646745256499679451426358865477844467458533962981852292513358871483321161973583245698763531598395467675529181496911117769834127516441369261275244225978893617456524385518493112272169767775861256649728253754964675812534546226295535939697352141217337346738553495616832783757866928174519145357234834584788253893618549484385733283627199445369658339175644484859385884574943219267922729967571943843794565736975716174727852348441254492886794362934343868643337828637454277582276962353246357835493338372219824371517526474283541714897994127864461433627894831268659336264234436872715374727211764167739169341999573855627775114848275268739159272518673316753672995297888734844388928439859359992475637439771269232916542385876779616695129412366735112593669719335783511355773814685491876721452994714318863716542473187246351548626157775143333161422867924437526253865859969947366972895674966845993244925218766937543487875485647329995285821739359369998935331986126873726737672159265827566443794515755939813676194755474477224152139987944419463371386499841415227734673733555261543871359797796529847861748979527579985757964742667473767269248335229836818297477665453189662485548925521497365877771665365728224394427883312135322325169141784

main = sumPs . map splitS . makePairs . cyc $ input

digitToInt :: Char -> Int
digitToInt = read . pure

cyc2 :: Integer -> [Int]
cyc2 = map digitToInt . cycle . show

intLen :: Integer -> Int
intLen n = truncate $ fromIntegral (length $ show n) / 2

makePairs2 :: [Int] -> Int -> [(Int, Int)]
makePairs2 cycled origL = [(cycled !! i, cycled !! (i + origL)) |
                           i <- [0..(2 * origL - 1)]]

sumPs2 :: [(Int, Int)] -> Int
sumPs2 xs = foldl' f 0 xs where
  f n (a, b) | a == b = n + a
             | otherwise = n


m2 x = let l = intLen x in sumPs2 $ makePairs2 (cyc2 x) l
main2 = m2 input
