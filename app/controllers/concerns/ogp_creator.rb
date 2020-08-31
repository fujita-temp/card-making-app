class OgpCreator
  require 'mini_magick'

  #名刺作成の統一条件
  IMAGE_PATH = "./app/assets/images/card.png"
  WHITE_TEMPLATE = './app/assets/images/base3.png'
  FONT = './app/assets/fonts/ipam.ttf'
  NORTH = 'northwest'
  SOUTH = 'southwest'
  #1行に並ぶ最大文字数
  INDENTION_COUNT = 30
  #最大行数
  ROW_LIMIT = 5


  #チーム名に関する条件
  def self.build_team(text, template)
    text = prepare_text(text)
    image = MiniMagick::Image.open(template)
    image.combine_options do |config|        
      config.font FONT
      if template == WHITE_TEMPLATE 
           config.fill 'white'
      else config.fill 'black'
      end
      config.gravity NORTH
      config.pointsize 30
      config.draw "text 30,37.5 '#{text}'"
    end
  end


  #回生に関する条件
  def self.build_grade(text, template)
    text = prepare_text(text)
    image = MiniMagick::Image.open(IMAGE_PATH)
    image.combine_options do |config|
      if template == WHITE_TEMPLATE
           config.fill 'white'
      else config.fill 'black'
      end
      config.font FONT
      config.gravity NORTH
      config.pointsize 25
      config.draw "text 30,100 '#{text}'"
    end
  end


  #よさ名に関する条件
  def self.build_nickname(text, template)
    text = prepare_text(text)
    image = MiniMagick::Image.open(IMAGE_PATH)
    image.combine_options do |config|
      if template == WHITE_TEMPLATE
           config.fill 'white'
      else config.fill 'black'
      end
      config.font FONT
      config.gravity NORTH
      config.pointsize 40
      config.draw "text 30,140 '#{text}'"
    end
  end


  #名前に関する条件
  def self.build_name(text, template)
    text = prepare_text(text)
    image = MiniMagick::Image.open(IMAGE_PATH)
    image.combine_options do |config|
      if template == WHITE_TEMPLATE 
           config.fill 'white'
      else config.fill 'black' 
      end
      config.font FONT
      config.gravity SOUTH
      config.pointsize 38
      config.draw "text 30,30 '#{text}'"
    end
  end

  #振り仮名に関する条件
  def self.build_furigana(text, template)
    text = prepare_text(text)
    image = MiniMagick::Image.open(IMAGE_PATH)
    image.combine_options do |config|
      if template == WHITE_TEMPLATE 
           config.fill 'white'
      else config.fill 'black'
      end
      config.font FONT
      config.gravity SOUTH
      config.pointsize 22
      config.draw "text 32.5,75 '#{text}'"
    end
  end


  private
  def self.prepare_text(text)
    text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
  end
end