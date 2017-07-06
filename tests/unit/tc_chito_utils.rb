require "test/unit"
require_relative "../../src/chito_cmd"

class TestChitoUtils < Test::Unit::TestCase
    # test a normal use of roll_dice method
    def test_roll_dice_normal
        roll = ChitoUtils.roll_dice(1, 20, 0)
        assert(roll.is_a? Integer)
        assert((1..20).member?(roll))
        roll = ChitoUtils.roll_dice(2, 10, 0)
        assert(roll.is_a? Integer)
        assert((2..20).member?(roll))
        roll = ChitoUtils.roll_dice(1, 20, 100)
        assert(roll.is_a? Integer)
        assert((101..120).member?(roll))
    end
end    
