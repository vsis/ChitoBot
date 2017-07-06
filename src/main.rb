require 'telegram_bot'
require_relative 'chito_cmd'

def main(telegram_token)
    bot = TelegramBot.new(token: telegram_token)
    bot.get_updates(fail_silently: true) do |message|
        command = message.get_command_for(bot)
        call_cmd(command, message, bot)
    end
end

def call_cmd(command, message, bot)
    cmd = ChitoCmd.get_first_word(command)
    puts "in<#{message.from.first_name}>: #{message.text}"
    puts "cmd: #{cmd}"
    message.reply do |reply|
        must_reply = true
        case cmd
        when "echo"
            reply.text = ChitoCmd.echo(message.text)
        when "greet", "start"
            reply.text = ChitoCmd.greet(message.from.first_name)
        when "9gag"
            reply.text = ChitoCmd.nine_gag()
        when "roll"
            reply.text = ChitoCmd.roll(message.text)
        when "help"
            reply.text = ChitoCmd.help()
        else
            must_reply = false
        end
        if must_reply
            reply.send_with(bot)
            puts "out<#{message.chat.id}>: #{reply.text.inspect}"
        end
    end
end

if __FILE__ == $0
    telegram_token = ARGV[0]
    main(telegram_token)
end
