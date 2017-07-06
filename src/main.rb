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
    puts "in: #{message.from.first_name}: #{message.text}"
    message.reply do |reply|
        must_reply = true
        case command
        when /echo/i
            reply.text = ChitoCmd.echo(message.text)
        when /greet/i, /start/i
            reply.text = ChitoCmd.greet(message.from.first_name)
        else
            must_reply = false
        end
        if must_reply
            reply.send_with(bot)
            puts "out: #{reply.text.inspect} to #{message.from.first_name}"
        end
    end
end

if __FILE__ == $0
    telegram_token = ARGV[0]
    main(telegram_token)
end
