require 'telegram_bot'
require 'logger'
require_relative 'chito_cmd'

def main(telegram_token)
    $LOG = Logger.new("ChitoBot.log", "monthly")
    $LOG.info("ChitoBot has been started")
    bot = TelegramBot.new(token: telegram_token)
    get_updates(bot)
end

def get_updates(bot)
    begin
        bot.get_updates(fail_silently: true) do |message|
            command = message.get_command_for(bot)
            call_cmd(command, message, bot)
        end
    rescue Excon::Error::Timeout
        $LOG.warn("get_updates() - time out!")
        sleep 1
        get_updates(bot)
    end
end

def call_cmd(command, message, bot)
    cmd = ChitoCmd.get_first_word(command)
    $LOG.info("IN - channel:#{message.chat.id} text:\"#{message.text}\"")
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
        when "viernes"
            reply.text = ChitoCmd.viernes()
        when "help"
            reply.text = ChitoCmd.help()
        else
            must_reply = false
        end
        if must_reply
            reply.send_with(bot)
            $LOG.info("OUT - channel:#{message.chat.id} text:\"#{reply.text.inspect}\"")
        end
    end
end

if __FILE__ == $0
    telegram_token = ARGV[0]
    main(telegram_token)
end
