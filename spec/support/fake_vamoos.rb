# frozen_string_literal: true

require 'sinatra/base'

class FakeVamoos < Sinatra::Base
  post '/v3/itinerary/:operator_code/:reference_code' do
    json_response 200, 'itinerary.json'
  end

  post '/v3/poi' do
    json_response 200, 'point_of_interest.json'
  end

  post '/v3/poi/:id' do
    json_response 200, 'point_of_interest.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
