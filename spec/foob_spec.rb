ENV['APP_ENV'] = 'test'

require_relative '../foob'
require 'rack/test'
require 'rspec'

describe "Foobie tests" do
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    it "homepage is okay" do
        get '/'
        expect(last_response).to be_ok
    end

    it "has loaded the correct homepage" do
        get '/'
        expect(last_response.body).to include("Foobers!")
    end


    it "planner is okay" do
        get '/planner'
        expect(last_response).to be_ok
    end

    it "planner contains tables" do
        get '/planner'
        expect(last_response.body).to include("<table")
    end

end