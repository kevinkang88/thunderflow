require 'spec_helper'
require 'capybara/rspec'

feature 'A user browsing the site' do
  # let(:question) { Question.create(title: "Question title", content: "latin latin latin") }
  before(:each) do
    @question = Question.create(title: "Question title", content: "latin latin latin")
  end
  context "on homepage" do
    it "sees a list of all questions" do
      visit root_path
      expect(page).to have_content "Question title"
    end
    it "can create a new question" do
      visit root_path
      expect {
        fill_in 'question_title', with: "Example Title"
        fill_in 'question_content', with: "Example Content"
        click_button "Submit"
      }.to change(Question, :count).by(1)
      expect(page).to have_content "Example Title"
      expect(page).to have_content "Example Content"
    end
    it "can upvote a question" do
      visit root_path
      within(".question") do
        expect {
          click_link "upvote"
        }.to change(Vote, :count).by(1)
      end
    end
    it "can downvote a question" do
      visit root_path
      within(".question") do
        expect {
          click_link "downvote"
        }.to change(Vote, :count).by(1)
      end
    end
    it "can see question vote totals" do
      visit root_path
      within(".question") do
        click_link "upvote"
      end
      expect(page).to have_content "Votes: 1"
    end
  end

  context "on a question" do
    it "sees all associated answers" do
      Answer.create(title: "Here is my opinion", content: "Listen to my opinion", question_id: 1)
      visit question_path(@question)
      expect(page).to have_content "Question title"
      expect(page).to have_content "Listen to my opinion"
    end
    it "can create a new answer for the question" do
      visit question_path(@question)
      expect {
        fill_in 'answer_title', with: "Example Answer Title"
        fill_in 'answer_content', with: "Example Answer Content"
        click_button "Answer"
      }.to change(Answer, :count).by(1)
      expect(page).to have_content "Example Answer Title"
      expect(page).to have_content "Example Answer Content"
    end
    it "can destroy the question" do
      visit question_path(@question)
      expect {
        click_button 'Delete'
      }.to change(Question, :count).by(-1)
    end
    it "can edit the question" do
      visit edit_question_path(@question)
      fill_in 'question_title', with: "Updated Title"
      fill_in 'question_content', with: "Updated Content"
      click_button "Submit"
      expect(page).to have_content "Updated Title"
      expect(page).to have_content "Updated Content"
    end
    it "can upvote an answer" do
      Answer.create(title: "Here is my opinion", content: "Listen to my opinion", question_id: 1)
      visit question_path(@question)
      within(".answer") do
        expect {
          click_link "upvote"
        }.to change(Vote, :count).by(1)
      end
    end
    it "can downvote an answer" do
      Answer.create(title: "Here is my opinion", content: "Listen to my opinion", question_id: 1)
      visit question_path(@question)
      within(".answer") do
        expect {
          click_link "downvote"
        }.to change(Vote, :count).by(1)
      end
    end
    it "can see answer vote totals" do
      Answer.create(title: "Here is my opinion", content: "Listen to my opinion", question_id: 1)
      visit question_path(@question)
      within(".answer") do
        click_link "upvote"
      end
      expect(page).to have_content "Votes: 1"
    end
  end
end