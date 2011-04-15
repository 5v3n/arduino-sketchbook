require 'serialport'
require 'rubygems'

if ARGV.size < 1
  puts "ruby #{$0} /dev/tty.your-usbdevice [-V]"
  exit 1
end

arduino_tty = ARGV.shift
use_volume_as_control = true if ARGV.shift == '-V'

sp = SerialPort.new(arduino_tty, 9600, 8, 1, 0)
old_value = ""


while true
  if use_volume_as_control
    volume_settings = `osascript -e "get volume settings"`
    if(old_value != volume_settings)
      old_value = volume_settings
      output_volume = volume_settings.split(':')[1].split(',')[0].to_i
      send_volume = 0
      send_volume = (output_volume-1) / 10 unless output_volume == 0
      puts "output_volume == 0: #{output_volume == 0}"
      puts "output_volume: #{output_volume}"
      puts "send_volume: #{send_volume}"
      puts "(output_volume-1) / 10: #{(output_volume-1) / 10}"
      sp.write send_volume
    end
    #sleep 250
  else
    input = gets
    input.chop!
    sp.write input
  end
end

sp.close


