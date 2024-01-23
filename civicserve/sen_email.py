import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders
import os
import io
import zipfile

# Email details
sender_email = "n19096775@gmail.com"
receiver_email = "nareshshalivahana1999@gmail.com"
password = "tcdg gbgi pcxj aokc"

# Files to zip and send
files_to_zip = os.getcwd()+"/web/tests/log.html"

with zipfile.ZipFile("files.zip", "w") as zip_file:
    for root, folders, files in os.walk(files_to_zip):
        for file in files:
            zip_file.write(os.path.join(root, file))


#create body
text = """\
Hi,
How are you?
Real Python has many great tutorials:
www.realpython.com"""
html = """\
<html>
  <body>
    <p>Hi,<br>
       How are you?<br>
       <a href="http://www.realpython.com">Real Python</a> 
       has many great tutorials.
    </p>
  </body>
</html>
"""

# Create the email message
msg = MIMEMultipart()
msg["From"] = sender_email
msg["To"] = receiver_email
msg["Subject"] = "Here are your zipped files"

# Attach the zip file
with open("files.zip", "rb") as attachment:
    part = MIMEBase("application", "zip")
    part.set_payload(attachment.read())
    encoders.encode_base64(part)
    part.add_header(
        "Content-Disposition",
        f"attachment; filename= {os.path.basename('files.zip')}",
    )
    part1 = MIMEText(text, "plain")
    part2 = MIMEText(html, "html")
    msg.attach(part)
    msg.attach(part1)
    msg.attach(part2)

# Create SMTP session
with smtplib.SMTP("smtp.gmail.com", 587) as server:
    server.starttls()
    server.login(sender_email, password)
    text = msg.as_string()
    server.sendmail(sender_email, receiver_email, text)

# Delete the temporary zip file
# os.remove("files.zip")
