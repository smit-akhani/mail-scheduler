class UserMailer < ApplicationMailer
    default from: 'inneedweb@gmail.com'
    
    def schedule_email(eml)
        @email = eml
        mail(to: @email.send_to, subject: @email.subject)
    end
end
