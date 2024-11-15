class ContactInquiry < ApplicationRecord

  enum subject: {
    web_development: 1,
    app_development: 2,
    graphic_ui_ux_design: 3,
    digital_marketing: 4,
    it_consulting: 5
  }

  validates :fullname, :email, :subject, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
