def clear_output
  if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
     system('cls')
   else
     system('clear')
  end
end

def cli_interface
  require 'timeout'
  command = nil
  while command != 'exit' do
    puts "type `exit` to stop"
    puts "type `new` to run new evolving"
    
    begin
      Timeout::timeout 2 do
        command = gets&.chomp
      end
    rescue Timeout::Error
      command = 'new'
    end
    yield(command)    

  end
end
