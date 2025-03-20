sum' :: Int -> Int -> Int
sum' x y = x + y

main = putStrLn (show(foldl sum' 0 [1..5]))