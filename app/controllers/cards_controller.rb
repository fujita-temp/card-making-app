class CardsController < ApplicationController


    def home
      @card = Card.new
    end

    def new
      @card = Card.new
    end
    
    def result

      #名刺の作成に関するコード
      #初期設定
      card = params[:card].permit(:team, :name, :kana, :nickname, :grade, :template)
      @card = Card.new(card)
      image_path = "./app/assets/images/card.png"
      template = './app/assets/images/base'+@card.template+'.png'

      #チーム名の入力
      text = @card.team
      image = OgpCreator.build_team(text, template).tempfile.open.read
      card_image = File.open(image_path, "w+b")
      card_image.write(image)
      card_image.close

      #回生の入力
      text = @card.grade
      image = OgpCreator.build_grade(text, template).tempfile.open.read
      card_image = File.open(image_path, "w+b")
      card_image.write(image)
      card_image.close

      #よさ名の入力
      text = @card.nickname
      image = OgpCreator.build_nickname(text, template).tempfile.open.read
      card_image = File.open(image_path, "w+b")
      card_image.write(image)
      card_image.close

      #名前の入力
      text = @card.name
      image = OgpCreator.build_name(text, template).tempfile.open.read
      card_image = File.open(image_path, "w+b")
      card_image.write(image)
      card_image.close

      #ふりがなの入力
      text = @card.kana
      image = OgpCreator.build_furigana(text, template).tempfile.open.read
      card_image = File.open(image_path, "w+b")
      card_image.write(image)
      card_image.close
      
    end
  

    #作成した名刺を表記するための関数
    def create_image
      send_file "./app/assets/images/card.png",
                     filename: '名刺.png',
                     type: 'image/png',
                     disposition: 'inline'
    end

    #作成した名刺をダウンロードするための機能
    def download
      send_file "./app/assets/images/card.png",
                :filename => 'よさこい名刺.png'
    end

end