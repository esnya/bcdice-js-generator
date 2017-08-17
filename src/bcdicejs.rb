require 'opal'
require 'opal/platform'
require 'native'

class FileTest
    def self.directory?(path)
        true
    end
end

class Random
    def rand(max)
        `Math.random() * (max || 0)`
    end
end

require 'bcdiceCore'

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
