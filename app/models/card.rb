class Card
    include ActiveModel::Model

    attr_accessor :team, :name, :kana, :nickname, :grade, :template
end