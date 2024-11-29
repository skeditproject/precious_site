class ContactMailer < ApplicationMailer
  def contact_inquiry_email(contact_inquiry_params)
    @fullname = contact_inquiry_params[:fullname]
    @subject = contact_inquiry_params[:subject]
    @message = contact_inquiry_params[:message]
    @email = contact_inquiry_params[:email]
    @phone = contact_inquiry_params[:phone]

    mail(to: "ritesh@preciousinfosystem.com", subject: "New Contact Inquiry from #{@fullname}")
  end
end
