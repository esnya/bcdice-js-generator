require 'opal'
require 'opal/platform'
require 'native'

class FileTest
    def self.directory?(path)
        true
    end
end

class Object
    def freeze
        self
    end
end

require 'diceBot/DiceBot'
require 'generated/StaticDiceBotLoaderList'
require 'bcdiceCore'

# def debug(*msg)
#     `console.log('debug>', #{msg})`
# end

bcdiceMaker = BCDiceMaker.new

wrapper = Native::Object.new
wrapper.JS[:newBcDice] = -> (diceBot) {
    if (diceBot.nil?) then
        bcdiceMaker.diceBot = DiceBot.new
    else
        bcdiceMaker.diceBot = Object.const_get(diceBot).new
    end

    original = bcdiceMaker.newBcDice

    bcdice = Native::Object.new
    bcdice.JS[:setMessage] = -> (message) {
        original.setMessage(message)
    }
    bcdice.JS[:dice_command] = -> {
        original.dice_command
    }

    bcdice
}

%x{
    var wrapper = #{ wrapper };
    module.exports = wrapper;
}
