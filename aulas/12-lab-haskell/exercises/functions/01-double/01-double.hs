main = do 
    let x = double 10 
    putStrLn "O dobro de 10 é: " >> putStrLn (show x)

double :: Int -> Int
double n = n*2