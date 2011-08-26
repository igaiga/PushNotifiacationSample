# -*- coding: utf-8 -*-

class IOSNotification
  require 'openssl'
  require 'socket'
  require 'pp'
  require 'rubygems'
  require 'json'

  CERTIFICATE_FILE = 'apns-dev.pem'
  KEY_FILE = 'apns-dev-key-noenc.pem'

  def initialize(device)
    @device = [] << device.gsub(' ','')
  end

  def push(message)
    socket = TCPSocket.new('gateway.sandbox.push.apple.com',2195) 
    context = OpenSSL::SSL::SSLContext.new('SSLv3')
    context.cert = OpenSSL::X509::Certificate.new(File.read(CERTIFICATE_FILE))
    context.key  = OpenSSL::PKey::RSA.new(File.read(KEY_FILE))
    ssl = OpenSSL::SSL::SSLSocket.new(socket, context)
    ssl.connect
    ssl.write(nortification(message))
    ssl.close
    socket.close
  end

  private

  def nortification(message)
    payload = JSON.generate({'aps' => {'alert' => message, 'badge' => 1, 'sound' => 'default'}}).to_s
    (nortification = []) << ['0'].pack('H') << [32].pack('n') << @device.pack('H*') << [payload.size].pack('n') << payload
    nortification.join('')
  end

end

# main
device = 'Write strings here displayed by NSLog'

nortification = IOSNotification.new(device)
nortification.push "Message from igaiga."
