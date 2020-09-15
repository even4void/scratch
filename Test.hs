module Test where

func :: Maybe Int
func = const 6 <$> Just 5
