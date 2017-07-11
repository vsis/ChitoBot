require 'telegram_bot'
require 'logger'
require_relative 'chito_control'

def main(telegram_token)
    $LOG = Logger.new("ChitoBot.log", "monthly")
    $LOG.level = Logger::INFO
    $LOG.info("ChitoBot has been started")
    bot = TelegramBot.new(token: telegram_token)
    get_updates(bot)
end

def get_updates(bot)
    begin
        bot.get_updates(fail_silently: true) do |message|
            ChitoControl.exec_command(message, bot, $LOG)
        end
    rescue Excon::Error::Timeout
        $LOG.warn("get_updates() - time out!")
        sleep 1
        get_updates(bot)
    end
end

if __FILE__ == $0
    telegram_token = ARGV[0]
    main(telegram_token)
end
