require 'rails_helper'

RSpec.describe Task, type: :model do

  describe 'validate task' do
    before do
      @user = User.create(
        first_name: 'Aaron',
        last_name: 'Summer',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )

      @project = @user.projects.create(
        name: 'Test Project'
      )
    end

    context 'when task is valid' do
      it 'is valid with a project, name' do
        task = @project.tasks.build(
          name: 'Sample Task'
        )

        expect(task).to be_valid
      end
    end

    context 'when task is invalid' do
      it 'is invalid without a name' do
        task = @project.tasks.build(
          name: nil
        )
        task.valid?
        expect(task.errors[:name]).to include("can't be blank")
      end

      it 'is invalid without a project' do
        task = Task.new(
          project: nil
        )
        task.valid?
        expect(task.errors[:project]).to include("can't be blank")
      end
    end
  end
end
