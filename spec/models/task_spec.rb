require 'rails_helper'

RSpec.describe Task, type: :model do

  describe 'validate task' do
    context 'when task is valid' do
      it 'is valid with a project, name' do
        task = FactoryBot.build(:task)
        expect(task).to be_valid
      end
    end

    context 'when task is invalid' do
      it 'is invalid without a name' do
        task = FactoryBot.build(:task, name: nil)
        task.valid?
        expect(task.errors[:name]).to include("can't be blank")
      end

      it 'is invalid without a project' do
        task = FactoryBot.build(:task, project: nil)
        task.valid?
        expect(task.errors[:project]).to include("can't be blank")
      end
    end
  end
end
