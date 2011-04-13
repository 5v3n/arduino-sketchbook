require 'serialport'
require 'rubygems'
require 'eventmachine'

if ARGV.size < 1
  puts "ruby #{$0} /dev/tty.your-usbdevice"
  exit 1
end

arduino_tty = ARGV.shift

sp = SerialPort.new(arduino_tty, 9600, 8, 1, 0)

EventMachine::run do

  EventMachine::defer do
    loop do
      line = sp.gets
      if line
        puts line
        #`osascript -e "set volume #{line}"`
      end
    end
  end

end

sp.close


