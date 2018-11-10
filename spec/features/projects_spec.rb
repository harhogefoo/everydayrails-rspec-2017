require 'rails_helper'

RSpec.feature 'Projects', type: :feature do
  # ユーザは新しいプロジェクトを作成する
  scenario 'user creates a new project' do

  end

  # ユーザはプロジェクトを完了済みにする
  scenario 'user completes a project' do
    # プロジェクトを持ったユーザを準備する
    user = FactoryBot.create(:user)
    project = FactoryBot.create(:project, owner: user)
    # ユーザはログインしている
    sign_in user

    # ユーザがプロジェクト画面を開き、
    visit project_path(project)

    expect(page).to_not have_content "Completed"

    # "complete" ボタンをクリックすると、
    click_button 'Complete'
    # プロジェクトは完了済みとしてマークされる
    expect(project.reload.completed?).to be true
    expect(page).to \
      have_content 'Congratulations, this project is complete!'
    expect(page).to have_content 'Completed'
    expect(page).to_not have_button 'Complete'
  end
end
