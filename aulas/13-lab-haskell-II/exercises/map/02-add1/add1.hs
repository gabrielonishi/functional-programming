add1 :: Int -> Int
add1 x = x + 1

main = putStrLn (show (map add1 [1..5]))