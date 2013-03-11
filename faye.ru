require 'faye'
require './faye_chat'

Faye::WebSocket.load_adapter('thin')

run FayeChat