class ApplicationMailer < ActionMailer::Base
  default to: 'info@cinemabooks.com', from: 'info@cinemabooks.com'
  layout 'mailer'
end
