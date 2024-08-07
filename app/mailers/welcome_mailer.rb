class WelcomeMailer < ApplicationMailer
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: t('welcome_mail'))
  end
end
