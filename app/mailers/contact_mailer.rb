class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @picture = contact

    mail to: "demekinn_96@yahoo.co.jp", subject: "お問い合わせの確認メール"
  end
end
  
