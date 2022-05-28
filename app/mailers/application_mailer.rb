# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'karaokegraph@gmail.com'
  layout 'mailer'
end
