class ContactMailer < ApplicationMailer

  def send_mail(contact_params)
    @contact = Contact.new(contact_params)
    mail to: "inquiries@greenxprize.com", subject: "Inquiry From #{@contact.name}"
  end
  
end
