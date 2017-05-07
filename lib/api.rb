require 'bundler/setup'
require 'sinatra'
require 'json'
require './lib/daily_price'

class Api < Sinatra::Application

  set :static, true
  set :public_folder, Proc.new { File.join(root, "../public")}

  get '/' do
    File.read(File.join('public', 'index.html'))
  end

  get '/api.json' do
    DailyPrice.all.map(&:to_hash).to_json
    end

  run! if app_file == $0

end
