import urllib3
import json
import requests

def convert_string_to_json_object(response):
    urllib3.disable_warnings()
    try:
           
        return json.loads(response)

    except json.JSONDecodeError:
        print ('contain invalid JSON syntax response: '+response)

def printResponseToLogAndConsole(inputstring):

    try:
        text_to_print = inputstring.json()
    except ValueError:
        text_to_print = inputstring.text    
    
    return text_to_print
         