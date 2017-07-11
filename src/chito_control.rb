require_relative "chito_cmd"
require "thread"


class ChitoControl

    #This is the dictionary used to know where to call when a command arrives
    #In the left: the command string in the incoming text
    #In the right: the name of the function to be called
    $commands={
        '/echo'=>    "echo",
        '/start'=>   "greet",
        '/greet'=>   "greet",
        '/roll'=>    "roll",
        '/9gag'=>    "nine_gag",
        '/viernes'=> "viernes",
        '/help'=>    "help"
    }

    # Given a command, it returns the first word
    # If input is not a string, it returns its input
    def self.get_command(text)
        if (text.is_a? String) and (text[0] == '/')
            first_word = text.split(' ')[0]
            return first_word
        else
            return nil
        end
    end

    # Given a command name, execute the proper function
    def self.exec_command(message, bot, log)
        log.info("IN  - channel:#{message.chat.id} text:\"#{message.text}\"")
        command = get_command(message.text)
        if command != nil
            method = $commands[command] 
            log.debug("command:#{command} method:#{method.inspect}")
            if self.methods().include?(:"#{method}")
                Thread.new do
                    begin
                        message.reply do |reply|
                            reply.text = send(method, *[message, bot, log])
                            reply.send_with(bot)
                            log.info("OUT - channel:#{message.chat.id} text:\"#{reply.text}\"")
                        end
                    rescue Exception => e
                        log.warn("command:#{command} exception:#{e.message}")
                    end
                end
            else
                log.debug("method #{method.inspect} not found")
            end
        end
    end

    #######################################################################
    # Here, you put commands implementation
    # Normally a command have a method here, a method in ChitoCmd module
    # and, if needed, a methond in ChitoUtils
    # Here you handle the message object
    # In ChitoCmd you handle the calculus and external services
    # In ChitoUtils you may put some usefull methods
    #######################################################################
    
    # Echo command. Return the given input
    def self.echo(message, bot, log)
        return ChitoCmd.echo(message.text)
    end

    # Greet command. Salute the user
    def self.greet(message, bot, log)
        return ChitoCmd.greet(message.user.first_name)
    end

    # 9gag command. Return a random 9gag post from its homepage
    def self.nine_gag(message, bot, log)
        return ChitoCmd.nine_gag()
    end

    # Roll command. Roll a dice or a group of dices
    def self.roll(message, bot, log)
        return ChitoCmd.roll(message.text)
    end

    # Sing the Viernes song
    def self.viernes(message, bot, log)
        return ChitoCmd.viernes()
    end

    # Print help text
    def self.help(message, bot, log)
        return ChitoCmd.help()
    end
end
