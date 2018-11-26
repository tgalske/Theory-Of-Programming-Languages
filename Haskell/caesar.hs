import Data.Char (ord, chr, toUpper)

shiftLetter :: Char -> Int -> Char
shiftLetter letter numShift = chr $ 65 + (ord (toUpper letter) - 65 + numShift) `mod` 26

encrypt :: Int -> String -> String
encrypt numShift = map sentence
 where sentence letter
              | toUpper letter >= 'A' && toUpper letter <= 'Z' = shiftLetter letter numShift
              | otherwise = letter
              
decrypt :: Int -> String -> String
decrypt shift = encrypt (-shift)

solve :: String -> Int -> IO ()
solve sentence maxShift
 | maxShift > -1 = do
  putStrLn ("Caesar " ++ (show maxShift) ++ ": " ++ (encrypt maxShift sentence))
  solve sentence (maxShift - 1)

main :: IO()
main = do
  putStrLn(encrypt 3 "Hello, world!")
  putStrLn(decrypt 15 "iwpczhvxkxcv")
  solve "hal" 26 
