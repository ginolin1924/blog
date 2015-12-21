class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  
  def index
    @lessons = Lesson.order(:level)
  end
  
  def show
  end
  
  def new
    @lesson = Lesson.new
  end
  
  def edit
  end
  
  def create
    @lesson = Lesson.create(lesson_params)
    
    if @lesson.save
      redirect_to lessons_path
    else
      render :new
    end
  end
  
  def update
    if @lesson.update(lesson_params)
      redirect_to lessons_path, notice: "修改成功"
    else
      render :edit
    end
  end
  
  def destroy
    @lesson.destroy
    redirect_to lessons_path, alert: "已刪除"
  end
  
  private
  
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
  
  def lesson_params
    params.require(:lesson).permit(:title, :content, :level)
  end
end
