module Parser where

import           Control.Applicative

newtype Parser a = P (String -> Maybe (a, String))

instance Functor Parser where
    --fmap :: (a -> b) -> Parser a -> Parser b
    fmap g pa = do
      a <- pa
      return $ g a

instance Applicative Parser where
    --pure :: a -> Parser a
    pure a = P (\cs -> Just (a,cs))

    --(<*>) :: Parser (a -> b) -> Parser a -> Parser b
    pg <*> pa = do
      g <- pg
      g <$> pa

instance Monad Parser where
    --(>>=) :: Parser a -> (a -> Parser b) -> Parser b
    p >>= f = P $ \cs ->
        case parse p cs of
          Nothing        -> Nothing
          Just (a, str') -> parse (f a) str'

instance Alternative Parser where
    --empty :: Parser a
    empty = P $ \str -> Nothing

    --(<|>) :: Parser a -> Parser a -> Parser a
    p <|> q = P $ \cs ->
        case parse p cs of
          Nothing -> parse q cs
          mx      -> mx

-- aux function for removing decorator
parse :: Parser a -> String -> Maybe (a, String)
parse (P p) cs = p cs