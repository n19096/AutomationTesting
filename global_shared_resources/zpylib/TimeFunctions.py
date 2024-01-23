import pytz
from datetime import datetime
from pytz import timezone
import calendar

def get_time_based_on_timezone(timezone_to_get, result_format):
    '''  Returns the current date time of a specified time zone in the specified result_format.
    For default time format pass result_format as 'time stamp' '''
    
    date = datetime.now(tz=pytz.utc).astimezone(timezone(timezone_to_get)).replace(tzinfo=None)
    if  result_format!='timestamp' and result_format!='datetime':
        date = date.strftime(result_format)
    return date

def get_no_of_days_in_month(month, year):
    ''' Returns the number of days present in the given month of given year. 
    '''
    month_days=calendar.monthrange(year,month)[1]
    return month_days