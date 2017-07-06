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
end
