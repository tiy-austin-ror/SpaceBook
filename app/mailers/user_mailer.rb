class UserMailer < ApplicationMailer

  def invite_user(email, hash_code)
    @hash_code = hash_code

    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => email,
                      :subject => "SpaceBook Invite code",
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message ENV['domain'], message_params

  end
end
