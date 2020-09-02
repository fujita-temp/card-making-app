module UsersHelper

    # 渡されたユーザーのGravatar画像を返す
    def gravatar_for(user, options = { size: 80 })
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=mp&?s=#{size}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
  end