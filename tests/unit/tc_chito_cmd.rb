require "test/unit"
require_relative "../../src/chito_cmd"

class TestChitoCmd < Test::Unit::TestCase
    # I'll use this instance method to produce a random string
    def get_random_string
        rstr = rand(36**16).to_s(36)
        return rstr
    end

    # Tests echo command.
    # It should return it's input
    def test_echo
        random_message = get_random_string()
        assert_equal(random_message, ChitoCmd.echo("echo #{random_message}"))
    end

    # Test greet command 
    def test_greet
        random_name = get_random_string()
        assert_equal("Hola, #{random_name}.\nSoy el ChitoBot.", ChitoCmd.greet(random_name))
    end

    # Test unknown cmd
    def test_unknown_cmd
        random_cmd = get_random_string()
        assert_equal("Lo siento, no entiendo el comando: #{random_cmd}.\nPodrías implementarlo ;)", ChitoCmd.unknown_cmd(random_cmd))
    end

    # Test if we get a good 9gag url
    # IMPORTANT: this will fail without access to 9gag website.
    # If you don't have internet, you must use a dummy page whit its name, or something.
    def test_nine_gag
        assert_match(/^https:\/\/9gag.com\/gag\/[:alnum:]/, ChitoCmd.nine_gag())
    end

    # Test a normal use of /roll
    def test_roll_dice
        message="/roll 3 6"
        response = ChitoCmd.roll(message)
        assert_match("3d6 + 0:", response)
        message="/roll"
        response = ChitoCmd.roll(message)
        assert_match("1d20 + 0:", response)
    end

    # Test a wrong use of /roll
    def test_wrong_roll_dice
        message="/roll walala"
        assert_equal("No entiendo la tirada\nUsa numeros, por ejemplo: '/roll 1 20 5' para 1d20 + 5", ChitoCmd.roll(message))
    end

    # Test viernes feature
    def test_viernes
        assert_equal("Siempre es viernes en mi corazón 🎼 ", ChitoCmd.viernes())
    end

    # Test cart
    def test_cart
        random_name = get_random_string()
        assert_equal("\"#{random_name}\" añadido al carrito 🛒", ChitoCmd.cart("/cart push #{random_name}", 1))
        assert_equal("Contenido del carrito:\n🛒    #{random_name}", ChitoCmd.cart("/cart pull", 1))
    end
end
