class OgpCreator
    require 'mini_magick'  
    BASE_IMAGE_PATH = './app/assets/images/base7.png'
    SEQUENCE_IMAGE_PATH = "./app/assets/images/card.png"
    FONT = './app/assets/fonts/ipam.ttf'
    COLOR = 'black'
    INDENTION_COUNT = 16
    ROW_LIMIT = 8
  


    #チーム名に関する条件
    def self.build_team(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(SEQUENCE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity "northwest"
        config.pointsize 30
        config.draw "text 30,37.5 '#{text}'"
      end
    end


    #回生に関する条件
    def self.build_grade(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(SEQUENCE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity "northwest"
        config.pointsize 25
        config.draw "text 30,100 '#{text}'"
      end
    end


    #よさ名に関する条件
    def self.build_nickname(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(SEQUENCE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity "northwest"
        config.pointsize 40
        config.draw "text 30,140 '#{text}'"
      end
    end


    #名前に関する条件
    def self.build(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(BASE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity 'southwest'
        config.pointsize 38
        config.draw "text 30,30 '#{text}'"
      end
    end

    #振り仮名に関する条件
    def self.build_furigana(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(SEQUENCE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity "southwest"
        config.pointsize 22
        config.draw "text 32.5,75 '#{text}'"
      end
    end


    private
    def self.prepare_text(text)
      text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
    end
  end