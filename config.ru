require './chat'

Faye::WebSocket.load_adapter('thin')
run Chat