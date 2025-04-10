import Control.Parallel.Strategies
import Crypto.Hash.SHA256 (hash)
import qualified Data.ByteString as BS
import Text.Printf
import System.IO.Unsafe (unsafePerformIO)

boilEggs :: BS.ByteString -> Int -> Int
boilEggs msg i =
  let _ = hash msg
  in tracePrint i

tracePrint :: Int -> Int
tracePrint i = unsafePerformIO $ do
    printf "Boiling eggs %d...\n" i
    return i

main :: IO ()
main = do
    let tasks = [0, 1, 2]
        msg = BS.replicate (100_000_000 * 16) 65  -- byte 'A'
        results = parMap rdeepseq (boilEggs msg) tasks
    print results