
class ChitoCmd
    # Given a command, it returns the first word
    # If input is not a string, it returns its input
    def self.get_first_word(command)
        if command.is_a? String
            first_word = command.split(' ')[0]
            if first_word[0] == "/"
                first_word = first_word[1..-1]
            end
            return first_word
        else
            return command
        end
    end

    # It return a random 9gag post, from 9gag homepage only
    def self.nine_gag
        gag_post = %x("src/9gag.sh")
        gag_url = "https://9gag.com#{gag_post}"
        return gag_url
    end

    # This command returns its input.
    # Nothing interesting, but it's a good example
    def self.echo(echoed_message)
        message = echoed_message.split(' ')[1..-1].join(' ')
        return message
    end

    # This command should return a greet message with a name
    def self.greet(name)
        return "Hola, #{name}.\nSoy el ChitoBot."
    end

    # This is not a command.
    # But it should be executed when an unknown command arrives
    def self.unknown_cmd(cmd)
        return "Lo siento, no entiendo el comando: #{cmd}.\nPodrías implementarlo ;)"
    end

    # A message to print, when people need /help
    def self.help
        help = %x("cat" "lista")
        return help
    end
end
