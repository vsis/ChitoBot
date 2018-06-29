require_relative "chito_utils"
class ChitoCmd
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

    # This returns viernes' song
    def self.viernes
        return "Siempre es viernes en mi corazón 🎼 "
    end

    # Supermarket cart
    def self.cart(message, chat_id)
        words = message.split(' ')
        if words.length > 1
            subcommand = words[1]
            if (subcommand == 'push') and (words.length > 2)
                cart_element = words[2..-1].join(' ')
                ChitoUtils.cart_push(cart_element, chat_id)
                return "\"#{cart_element}\" añadido al carrito 🛒"
            elsif (subcommand == 'pull') and (words.length == 2)
                return ChitoUtils.cart_pull(chat_id)
            else
                return "Error de sintáxis.\nModo de uso: /cart (push <elemento>|pull)."
            end
        else
            return "Error de sintáxis.\nModo de uso: /cart (push <elemento>|pull)."
        end
    end

    # Roll a random dice
    def self.roll(message)
        words = message.split(' ')
        inputs = words.length
        dice_faces = 20 # default dice: 1d20
        dices_number = 1 # one dice
        dice_offset = 0 # no offset
        error_message = "No entiendo la tirada\nUsa numeros, por ejemplo: '/roll 1 20 5' para 1d20 + 5"
        dices_number = words[1].to_i unless inputs < 2
        dice_faces = words[2].to_i unless inputs < 3
        dice_offset = words[3].to_i unless inputs < 4
        if (dices_number <= 0) or (dice_faces <= 0)
            return error_message
        else
            result = ChitoUtils.roll_dice(dices_number, dice_faces, dice_offset)
            return "#{dices_number}d#{dice_faces} + #{dice_offset}: #{result}"
        end
    end
end
