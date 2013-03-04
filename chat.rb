require 'faye/websocket'
require 'pp'

users = {}

Chat = lambda do |env|
  if Faye::WebSocket.websocket?(env)

    ws = Faye::WebSocket.new(env)

    ws.onopen = lambda do |event|
      p 'open'
      p "target.name: #{event.target.class.name}"
      users[event.target.object_id] = event.target
      p users.keys.count
    end
    ws.onmessage = lambda do |event|
      p "message: #{event.data}"
      users.each_value do |user|
        user.send(event.data)
      end
    end

    ws.onclose = lambda do |event|
      p 'close'
      users.delete(event.target.object_id)
      p users.keys.count
    end

    ws.rack_response
  else
    p 'normal http'
    [200, {'Content-Type' => 'text/plain'}, ['Hello']]
  end
end
