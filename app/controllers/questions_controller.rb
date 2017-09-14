class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
      flash[:notice] = "Your question was successfully saved."
      redirect_to @question
    else
      flash.now[:alert] = "Your question could not be saved. Try again."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
      flash[:notice] = "Your question was successfully edited."
      redirect_to @question
    else
      flash.now[:alert] = "Your question could not be edited. Try again."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "Your question was deleted."
      redirect_to @question
    else
      flash.now[:alert] = "Your question could not be deleted."
      render :show
    end
  end
end
