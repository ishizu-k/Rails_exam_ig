class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @picture = contact

    mail to: "demekinn_96@yahoo.co.jp", subject: "投稿確認メール"
  end
end
