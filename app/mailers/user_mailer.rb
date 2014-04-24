class UserMailer < ActionMailer::Base

  $contact_email = "max@brainshots.cl"
  default from: $contact_email

  # To unsubscribe from certain emails(must also be the :from of the message. 
    #EJ: mail(:to => @user.email, :from => "an_email@example.com", :subject => "Welcome"))
  # just add the line
  # @unsubscribe_from = 'an_email@example.com'

  $site_url = "http://localhost:3000"

  def pre_welcome(pre_user)
    @user = pre_user
    @url  = $site_url

    mail(:to => @user.email, :subject => "Welcome")
  end

  def welcome(user)
    @user = user
    token = @user.tokens.first_or_create
    @token = token.value
    @url  = $site_url+"/activate/#{@token}"

    @unsubscribe_token = @user.tokens.first_or_create.value
    mail(:to => @user.email, :subject => "Welcome")
  end

  def feedback(user, email)
    @user = user.to_s
    @url  = $site_url
    mail(:to => email, :subject => "Feedback")
  end

  def contact_email(name, email, subject, content)
    @name = name
    @email = email
    @subject = subject
    @content = content
    @user = User.new
    
    @url  = $site_url

    mail(:to => $contact_email, :from => email, :subject => "Contact")
  end


  def recover_pass(user, token)
    @user = user
    @token = token
    @url  = $site_url+"/change_password/"+@token

    @unsubscribe_token = @user.tokens.first_or_create.value
    mail(:to => user.email, :subject => "Reset your password")
  end



end
