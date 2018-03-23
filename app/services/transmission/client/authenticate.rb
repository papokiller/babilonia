require 'rest-client'

class Transmission::Client::Authenticate
  def self.get_token(&block)
    begin
      RestClient.post("#{ENV['TRANSMISSION_SERVER']}/transmission/rpc", {})
    rescue RestClient::ExceptionWithResponse => e
      if e.response.code == 409
        session = e.response.headers[:x_transmission_session_id]
        if block_given?
          yield('x-transmission-session-id' => session)
        else
          return session
        end
      end
    end
  end

end



