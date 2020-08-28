class CardsController < ApplicationController


    def new
      @card = Card.new
    end
    
    def result
      #ファイルの作成に関するコード
      #画像のイメージを立ち上げ、名前の入力を完了させる
      card = params[:card].permit(:team, :name, :kana, :nickname, :grade)
      @card = Card.new(card)
      text = @card.name
      image = OgpCreator.build(text).tempfile.open.read

      #作成した画像を保存（指定したパスに）するためのコード
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

      #ふりがなの入力
      text = @card.kana
      image = OgpCreator.build_furigana(text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

      #よさ名の入力
      text = @card.nickname
      image = OgpCreator.build_nickname(text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

      #チーム名名の入力
      text = @card.team
      image = OgpCreator.build_team(text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

      #回生の入力
      text = @card.grade
      image = OgpCreator.build_grade(text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

    end
  
    def ogp_params
      params.permit(:text)
    end

    def download
      send_file "./app/assets/images/card.png",
                :filename => 'よさこい名刺.png'
    end

end