require 'faye'

FayeChat = Faye::RackAdapter.new(mount: '/faye')

