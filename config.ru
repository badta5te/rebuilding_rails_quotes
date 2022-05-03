# frozen_string_literal: true

require './config/application'

app = BestQuotes::Application.new

use Rack::ContentType

app.route do
  match "", "quotes#index"
  match "sub-app",
        proc { [200, {}, ["HELLO, sub-app!"]] }

  match ":controller/:id/:action"
  match ":controller/:id",
        :default => { "action" => "show" }
  match ":controller",
        :default => { "action" => "index" }
end

run app