module Day3 where

-- from https://math.stackexchange.com/a/163101
-- function spiral(n)
--         k=ceil((sqrt(n)-1)/2)
--         t=2*k+1
--         m=t^2
--         t=t-1
--         if n>=m-t then return k-(m-n),-k        else m=m-t end
--         if n>=m-t then return -k,-k+(m-n)       else m=m-t end
--         if n>=m-t then return -k+(m-n),k else return k,k-(m-n-t) end
-- end

spiral n = let fn = fromInteger n
               k = ceiling $ ((sqrt fn) - 1) / 2
               t = 2 * k
               m = (t + 1) ^ 2
               d1 = m - t
               d2 = m - 2 * t
               d3 = m - 3 * t
            in if n >= d1 then (k - (m - n), -k)
                          else if n >= d2 then (-k, -k + (d1 - n))
                            else if n >= d3 then (-k + (d2 - n), k)
                              else (k, k - (d2 - n - t))

-- manhattan dist from (x1, y1) and (x2, y2) = |x1 - x2| + |y1 - y2|
-- here, x1 = 0, y1 = 0, so
manhattanDist (x, y) = abs x + abs y

m = manhattanDist . spiral
main = m 368078
