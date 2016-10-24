class OrderMailer < ApplicationMailer
   def index order, user
    @order = order
    @user = user
    mail to: Settings.email_admin, subject: Settings.subject
  end
end
