class UserMailer < ApplicationMailer

  def invite_user(email, hash_code)
    @hash_code = hash_code


    mail to: email, subject: "SpaceBook Invite code"
  end
end
