require 'faye'
require './chat'
#require File.expand_path('./chat.rb', __FILE__)

Faye::WebSocket.load_adapter('thin')
run Chat
