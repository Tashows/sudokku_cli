# frozen_string_literal: true

require_relative "sudokku_cli/version"
require 'netrc'
require 'json'
require 'open-uri'
require 'net/http'
require 'dotenv/load'

module SudokkuCli
  class Error < StandardError; end

  ENDPOINT = ENV["ENDPOINT"] || 'https://git.sudokku.com'

  def self.send_request(path, params = {})
    uri = URI.join(ENDPOINT, path)
    uri.query = URI.encode_www_form(params)
    request = Net::HTTP::Get.new(uri.request_uri)
    netrc = Netrc.read
    user, password = netrc[uri.host]
    request.basic_auth(user, password)
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(request)
    end
    JSON.parse(response.body)
  end

  def self.login
    response = send_request('/login')
    if response['status'] == 'success'
      puts 'You are logged in!'
    else
      token = response['token']
      # credentials are not valid, prompt user to authenticate via browser
      puts "Please visit #{response['url']} to authenticate."
      puts "Waiting for authentication..."
      # check for new credentials
      loop do
        response = send_request('/check-authentication', { token: token })
        if response['status'] == 'success'
          # new credentials received, save to .netrc file
          netrc = Netrc.read
          host = ENDPOINT.gsub('https://', '').gsub('http://', '')
          netrc[host] = response['credentials']
          netrc.save
          puts 'Successfully logged in!'
          break
        end
        sleep(5) # wait 5 seconds before checking again
      end
    end
  end

  def self.start(args)
    case args[0]
    when "login"
      login
    else
      puts "Invalid command. Please use `sudokku login`."
    end
  end
end
