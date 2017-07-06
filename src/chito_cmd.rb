
class ChitoCmd
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

end
