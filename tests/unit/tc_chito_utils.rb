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

    # test a use of cart pull and push
    def test_cart
        cart = ChitoUtils.cart_pull(1)
        assert(cart == "El carro está vacío 🛒")
        ChitoUtils.cart_push("hola mundo", 1)
        cart = ChitoUtils.cart_pull(1)
        assert(cart == "Contenido del carrito:\n🛒    hola mundo")
    end

    # test a use of cart from different channel
    def test_cart_different_channel
        ChitoUtils.cart_push("hola", 1)
        cart = ChitoUtils.cart_pull(2)
        assert(cart == "El carro está vacío 🛒", cart)
        cart = ChitoUtils.cart_pull(1)
        assert(cart == "Contenido del carrito:\n🛒    hola")
    end
end
