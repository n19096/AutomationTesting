import datetime
from datetime import datetime 

def global_get_current_time(time_format="%Y-%m-%d"):
    '''
    Gets current time and returns it in the entered time_format argument.
    This defaults to the following format: YYYY-MM-DD. However this format 
    can be changed to other formats using the time format string. See here
    for further details: https://docs.python.org/2/library/time.html#time.strftime
    '''
    now = datetime.datetime.now()
    return now.strftime(time_format)

def get_sorted_dates(dates):  
   
    dates.sort(key = lambda date: datetime.strptime(date, '%m-%d-%Y')) 
    
    # Print the dates in a sorted order  
    return  dates
