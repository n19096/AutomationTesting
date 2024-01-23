import smtplib
from socket import gaierror

def send_plain_email(receiver, body, sender, subject="Notification from automated test"):
    smtp_server
    sender 
    message =     f"""\
    Subject: Hi {subject}
    To: {receiver}
    From: {sender}
    {body}"""
    try:
        with smtplib.SMTP(smtp_server) as server:
            server.sendmail(sender, receiver, message)
    except (gaierror, ConnectionRefusedError):
        print('Failed to connect to the server. Bad connection settings?')
    except smtplib.SMTPServerDisconnected:
        print('Failed to connect to the server. Wrong user/password?')
    except smtplib.SMTPException as e:
        print('SMTP error occurred: ' + str(e))
        
        
