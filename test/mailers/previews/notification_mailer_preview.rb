# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/send_mail
  def send_mail
    booking = Booking.last
    email = "chheda.pc@gmail.com"
    NotificationMailer.send_mail(booking, email)
  end

end
