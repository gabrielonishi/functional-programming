main = do
    putStrLn (describeNumber 10) 

describeNumber :: Int -> String
describeNumber x
    | x == 1 = "Um"
    | x == 2 = "Dois"
    | x == 3 = "Três"
    | x == 4 = "Quatro"
    | x == 5 = "Cinco"
    | otherwise = "Outro"