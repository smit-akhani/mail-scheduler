class UserMailer < ApplicationMailer
    default from: Figaro.env.sender_address
    
    def schedule_email(eml)
        @email = eml
        mail(to: @email.send_to, subject: @email.subject)
    end
end
