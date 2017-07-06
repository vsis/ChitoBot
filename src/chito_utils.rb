class ChitoUtils

    # to roll a dice
    def self.roll_dice(dices_number, dice_faces, dice_offset)
       acumulator = dice_offset
       dices_number.times do 
            acumulator += rand(1..dice_faces)
       end
       return acumulator
    end
end
