class OgpCreator
    require 'mini_magick'  
    BASE_IMAGE_PATH = './app/assets/images/base2.png'
    SEQUENCE_IMAGE_PATH = "./app/assets/images/card.png"
    GRAVITY = 'southwest'
    TEXT_POSITION = '80,100'
    FONT = './app/assets/fonts/ipam.ttf'
    COLOR = 'white'
    FONT_SIZE = 80
    INDENTION_COUNT = 16
    ROW_LIMIT = 8
  

    #名前に関する条件
    def self.build(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(BASE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity GRAVITY
        config.pointsize FONT_SIZE
        config.draw "text 80,80 '#{text}'"
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
        config.pointsize 40
        config.draw "text 85,170 '#{text}'"
      end
    end

    #組織名に関する条件
    def self.build_company(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(SEQUENCE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity "northwest"
        config.pointsize 55
        config.draw "text 80,75 '#{text}'"
      end
    end

    #役職名に関する条件
    def self.build_position(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(SEQUENCE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity "southwest"
        config.pointsize 50
        config.draw "text 80,260 '#{text}'"
      end
    end

    #郵便番号に関する条件
    def self.build_address1(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(SEQUENCE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity "northwest"
        config.pointsize 30
        config.draw "text 80,150 '#{text}'"
      end
    end

    #所在地に関する条件
    def self.build_address2(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(SEQUENCE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity "northwest"
        config.pointsize 30
        config.draw "text 80,190 '#{text}'"
      end
    end

    #電話番号に関する条件
    def self.build_tell(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(SEQUENCE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity "northwest"
        config.pointsize 30
        config.draw "text 80,260 '#{text}'"
      end
    end

    #メールアドレスに関する条件
    def self.build_mail(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(SEQUENCE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity "northwest"
        config.pointsize 30
        config.draw "text 80,300 '#{text}'"
      end
    end

    #メールアドレスに関する条件(16文字以上)
    def self.build_mail2(text)
      text = prepare_text(text)
      image = MiniMagick::Image.open(SEQUENCE_IMAGE_PATH)
      image.combine_options do |config|        
        config.font FONT
        config.fill COLOR
        config.gravity "northwest"
        config.pointsize 30
        config.draw "text 321,300 '#{text}'"
      end
    end

    private
    def self.prepare_text(text)
      text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
    end
  end

  