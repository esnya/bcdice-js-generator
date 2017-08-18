require 'opal'
require 'opal/platform'
require 'native'

class Object
    def freeze
        self
    end
end

class FileTest
    def self.directory?(path)
        true
    end
end

require 'diceBot/DiceBot'
require 'generated/StaticDiceBotLoaderList'
require 'generated/StaticTableFileData'
require 'bcdiceCore'

class String
    def toutf8
        self
    end
end

class TableFileData
    def setDir(dir, prefix = '')
        @tableData
    end

    def searchTableFileDefine()
        @fileData = StaticTableFileData.getFileData
        return StaticTableFileData.getTableData
    end

    def getTableDataFromFile(fileName)
        table = []
        lines = @fileData[fileName].toutf8.lines.map(&:chomp)
        
        defineLine = lines.shift
        dice, title = getDiceAndTitle(defineLine)
        
        lines.each do |line|
          key, value = getLineKeyValue(line)
          next if( key.empty? )
          
          key = key.to_i
          table << [key, value]
        end
        
        return dice, title, table
      end

      def readOneTableData(oneTableData)
        return if( oneTableData.nil? )
        return unless( oneTableData["table"].nil? )
        
        command = oneTableData["command"]
        gameType = oneTableData["gameType"]
        fileName = oneTableData["fileName"]
        
        return if( command.nil? )
        
        #return if( not File.exist?(fileName) )
        
        dice, title, table  = getTableDataFromFile(fileName)
        
        oneTableData["dice"] = dice
        oneTableData["title"] = title
        oneTableData["table"] = table
        
        return oneTableData
      end
end

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
