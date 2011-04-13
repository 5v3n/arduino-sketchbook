require 'serialport'
require 'rubygems'
require 'eventmachine'

if ARGV.size < 1
  puts "ruby #{$0} /dev/tty.your-usbdevice [-V]"
  exit 1
end

arduino_tty = ARGV.shift
change_volume = true if ARGV.shift == '-V'

sp = SerialPort.new(arduino_tty, 9600, 8, 1, 0)

EventMachine::run do

  EventMachine::defer do
    loop do
      line = sp.gets
      if line
        puts line
        if change_volume
          puts "changing volume..."
          puts `osascript -e "set volume #{line}"` 
        end
      end
    end
  end

end

sp.close


