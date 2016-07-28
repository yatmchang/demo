class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      redirect_to question_path(@question), notice: "Changes Saved!"
    else
      redirect_to new_question_path(current_user), alert: "Unable To Save"
    end
  end

  def show
  end

  def index
    @questions = Question.all
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: "question deleted"
  end

private

  def question_params
    params.require(:question).permit(:title, :body, :link)
  end

  def find_question
    @question = question.find params[:id]
  end
end
