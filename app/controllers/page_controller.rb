class PageController < ApplicationController
  def home
    if (!user_signed_in? && !is_guest?)
      redirect_to sign_in_path
    end
  end
  
  def lesson_list
    @lessons = Lesson.order(:level)
  end
end
