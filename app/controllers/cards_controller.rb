class CardsController < ApplicationController
    def new
      @card = Card.new
    end
    
    def result
      #ファイルの作成に関するコード
      #画像のイメージを立ち上げ、名前の入力を完了させる
      card = params[:card].permit(:name, :name2, :company, :address1, :address2, :mail, :tell, :position)
      @card = Card.new(card)
      text = @card.name
      image = OgpCreator.build(text).tempfile.open.read
      #send_data image, :type => 'image/png',:disposition => 'inline'

      #作成した画像を保存（指定したパスに）するためのコード
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

      #ふりがなの入力
      text = @card.name2
      image = OgpCreator.build_furigana(text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

      #組織名の入力
      text = @card.company
      image = OgpCreator.build_company(text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

      #役職名の入力
      text = @card.position
      image = OgpCreator.build_position(text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

      #郵便番号の入力
      text = @card.address1
      image = OgpCreator.build_address1("〒"+text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close
      
      #所在地の入力
      text = @card.address2
      image = OgpCreator.build_address2(text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

      #電話番号の入力
      text = @card.tell
      image = OgpCreator.build_tell(text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

      #メールアドレスの入力(16文字以前)
      text = @card.mail[0,16]
      image = OgpCreator.build_mail(text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

      #メールアドレスの入力(16文字以降)
      text = @card.mail[16, 32]
      image = OgpCreator.build_mail2(text).tempfile.open.read
      card_image = File.open("./app/assets/images/card.png", "w+b")
      card_image.write(image)
      card_image.close

    end
  
    def ogp_params
      params.permit(:text)
    end

end  