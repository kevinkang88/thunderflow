class QuestionsController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all
  end

  def show
    @answer = Answer.new
    @question = Question.find params[:id]
  end

  def create
    @question = Question.create(title: params[:question][:title], content: params[:question][:content])
    # @image = params[:question][:picture].tempfile
    @question.img_url = HTTParty.post("https://api.imgur.com/3/image", :body => { :image => Base64.encode64(params[:question][:picture].tempfile.read) }.to_json, :headers => { 'Content-Type' => 'application/json', "Authorization" => "Client-ID 691c16a3ed9cf63" } )["data"]["link"]
    @question.save
    HardWorker.perform_async
    redirect_to questions_path
  end

  def destroy
    @question = Question.find params[:id]
    @question.destroy
    redirect_to questions_path
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    @question.update_attributes params[:question]
    redirect_to question_path @question
  end


end