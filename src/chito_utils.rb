# This is the memory space were we store cart elements
# It's not persistent storage, but a volatile variable :v
$cart_elements = Hash.new([])

class ChitoUtils

    # to roll a dice
    def self.roll_dice(dices_number, dice_faces, dice_offset)
       acumulator = dice_offset
       dices_number.times do 
            acumulator += rand(1..dice_faces)
       end
       return acumulator
    end

    # Push to cart list
    def self.cart_push(element, chat_id)
        if $cart_elements[chat_id] == []
            $cart_elements[chat_id] = [element]
        else
            $cart_elements[chat_id] << element
        end
    end

    # Pull elements from cart list
    def self.cart_pull(chat_id)
        if $cart_elements[chat_id].length == 0
            return "El carro está vacío 🛒"
        else
            printed_elements = $cart_elements[chat_id].join("\n🛒    ")
            $cart_elements[chat_id] = []
            return "Contenido del carrito:\n🛒    #{printed_elements}"
        end
    end
end
