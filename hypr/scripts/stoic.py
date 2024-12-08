#!/usr/bin/python3

import urllib.request as req
import json

url = req.urlopen("https://stoic-quotes.com/api/quote")
main_string = json.loads(url.read())["text"]

def split_into_chunks(text, chunk_size=10):
    # Split the text into a list of words
    words = text.split()
    
    # Break words into chunks of the given size
    chunks = [" ".join(words[i:i + chunk_size]) for i in range(0, len(words), chunk_size)]
    
    # Join the chunks with <br>
    return "<br/>".join(chunks)
    

# Example usage
result = split_into_chunks(main_string, chunk_size=6)

#with open("/tmp/lock", "w") as file:
 #   file.write(result)

print(result)

