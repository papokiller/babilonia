require 'rails_helper'

RSpec.describe Transmission::Client::Authenticate, type: :service do
  describe '#get_token' do
    let(:token) { 'EIFxa5dFIiBYuDQjrPgekuJWy1yyBUVxE7cBV7diu3VU5rU1' }
    it 'should return token valid' do
      VCR.use_cassette('transmission_authentication') do
        expect(described_class.get_token).to eq(token)
      end
    end

    it 'should return header authentication' do
      VCR.use_cassette('transmission_authentication') do
        described_class.get_token do |header|
          expect(header).to eq('x-transmission-session-id' => token)
        end
      end
    end
  end
end
