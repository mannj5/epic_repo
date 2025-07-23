module Main (main) where

import qualified System.Environment as SE
import System.Directory as SD
import System.Process as SP

errorMsg :: String
errorMsg = "Usage: ./hydro source-file [-o] [executable-name]"

exitCode :: String
exitCode = "mov rax, 60"

returnReg :: String
returnReg = "mov rdi, "

entryPoint :: String
entryPoint = "global _start\n\n_start:"

filePath :: String
filePath = "./out.asm"

main :: IO ()
main = do
    exists <- SD.doesFileExist filePath
    if exists then SD.removeFile filePath >> initFile
        else initFile
    args <- SE.getArgs
    if length args < 1
        then putStrLn errorMsg
        else process args
    SP.callCommand "nasm -f elf64 out.asm -o out.o"
    SP.callCommand "ld out.o -o test"
    SP.callCommand "rm out.asm out.o"

initFile :: IO ()
initFile = writeFile filePath entryPoint

process :: [String] -> IO ()
process [] = return ()
process ("-o":xs) = case xs of
    [] -> putStrLn errorMsg
    _ -> return ()
process (x:xs) = do
    input <- readFile x
    translate $ words input
    process xs

translate :: [String] -> IO ()
translate (token:tokens) = case token of
    "return" -> do
        appendFile filePath "\n\t"
        appendFile filePath exitCode
        appendFile filePath "\n\t"
        appendFile filePath returnReg
        appendFile filePath $ head tokens
        appendFile filePath "\n\tsyscall\n"
    _ -> translate tokens