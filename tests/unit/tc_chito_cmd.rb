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
        assert_equal(random_message, ChitoCmd.echo(random_message))
    end

    # Test greet command 
    def test_greet
        random_name = get_random_string()
        assert_equal("Hola, #{random_name}.\nSoy el ChitoBot.", ChitoCmd.greet(random_name))
    end
end
