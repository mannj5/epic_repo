import Data.List

main :: IO ()
main = do
    input <- readFile "input"
    let l1 = sort $ read <$> (takeEven $ words input)
        l2 = sort $ read <$> (takeOdd $ words input)
        in print $ distance 0 l1 l2

distance :: Integer -> [Integer] -> [Integer] -> Integer
distance n [] [] = n
distance n (x:xs) (y:ys) =
    let d = abs $ x - y
        in distance (n + d) xs ys

takeEven :: [a] -> [a]
takeEven [] = []
takeEven (x:xs) = x : (takeEven $ drop 1 xs)

takeOdd :: [a] -> [a]
takeOdd [] = []
takeOdd (x:xs) = takeEven xs