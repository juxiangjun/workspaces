import smtplib

class EmailUtil:
    def __init__(self, config):
        self.host = config.get('smtp','host')
        self.user = config.get('smtp','user')
        self.password = config.get('smtp', 'password')
        self.smtp = self.get_connection()

    def get_connection(self):
        smtp = smtplib.SMTP()
        smtp.connect(self.host)
        smtp.login(user, password)
        return smtp

    def send(self, sender,  receiver, messages):
        result = False
        try:
            self.smtp.sendmail(sender, receiver, messages)
            result = True
        except Exception, e:
            print e
        return result
        
