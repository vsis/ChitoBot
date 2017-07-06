
class ChitoCmd
    # This command returns its input.
    # Nothing interesting, but it's a good example
    def self.echo(message)
        return message
    end

    # This command should return a greet message with a name
    def self.greet(name)
        return "Hola, #{name}.\nSoy el ChitoBot."
    end
end
