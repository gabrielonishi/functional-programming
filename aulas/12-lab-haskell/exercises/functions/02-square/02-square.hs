main = do 
    let x = square 10
    putStrLn "O quadrado de 10 é " >> putStrLn (show x)

square :: Int -> Int
square x = x * x