# frozen_string_literal: true

module PersonalOkrDecorator
  def user_image
    user.image.present? ? user.image : "/assets/user_icon.png"
  end
end
