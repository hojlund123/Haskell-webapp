{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

main :: IO ()
main = scotty 3000 $ do
  get "/" $ do
    html $ renderHtml $ page "Hello, world!"

page :: String -> H.Html
page message = docTypeHtml $ do
  H.head $ do
    H.title "My Haskell Web App"
    link ! rel "stylesheet" ! type_ "text/css" ! href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
  body $ do
    H.div ! class_ "container" $ do
      H.h1 "Welcome to my Haskell web app"
      H.p "Here's a message for you:"
      H.p $ toHtml message
