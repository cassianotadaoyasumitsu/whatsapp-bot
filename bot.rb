require "sinatra/base"

class WhatsAppBot < Sinatra::Base
  use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/bot'
  post '/bot' do
    body = params["Body"].downcase
    response = Twilio::TwiML::MessagingResponse.new
    response.message do |message|
      body.include?('oi') ? message.body('Oi, Carise') : message.body("Escreve 'oi' Carise!")
    end
    content_type "text/xml"
    response.to_xml
  end
end
