class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.send_mail.subject
  #
  def send_mail(booking, email)
    @booking = booking

    mail to: email,
         subject: "New Room Booking Invite"

  end
end
