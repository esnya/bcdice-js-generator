# -*- coding: utf-8 -*-

class Oukahoushin3rd < DiceBot
  
  def initialize
    super
  end
  
  def gameName
    '央華封神RPG第三版'
  end
  
  def gameType
    "Oukahoushin3rd"
  end
  
  def getHelpMessage
    return <<INFO_MESSAGE_TEXT
・各種表
　・能力値判定裏成功表（NHT）
　・武器攻撃裏成功表（BKT）
　・受け・回避裏成功表（UKT）
　・仙術行使裏成功表（SKT）
　・仙術抵抗裏成功表（STT）
　・精神値ダメージ悪影響表（SDT）
　・狂気表（KKT）
INFO_MESSAGE_TEXT
  end
  
end


