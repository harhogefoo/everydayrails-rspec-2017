require 'rails_helper'

RSpec.describe Note, type: :model do
  # ユーザー、プロジェクト、メッセージがあれば有効な状態であること
  it 'is valid with a user, project, and message' do
    note = FactoryBot.create(:note)
    expect(note).to be_valid
  end

  # メッセージがなければ無効な状態であること
  it 'is invalid without a message' do
    note = FactoryBot.build(:note, message: nil)
    note.valid?
    expect(note.errors[:message]).to include("can't be blank")
  end

  # 文字列に一致するメッセージを検索する
  describe 'search message for a term' do
    let(:note1) { FactoryBot.create(:note, message: 'This is the first note') }
    let(:note2) { FactoryBot.create(:note, message: 'This is the second note') }
    let(:note3) { FactoryBot.create(:note, message: 'First, preheat the oven.') }

    # 一致するデータがみつかるとき
    context 'when a match is found' do
      # 検索文字列に一致するメモを返すこと
      it 'returns notes that match the search term' do
        expect(Note.search('first')).to include(note1, note3)
      end
    end

    # 一致するデータが1件も見つからないとき
    context 'when no match is found' do
      # 空のコレクションを返すこと
      it 'returns an empty collection' do
        expect(Note.search('message')).to be_empty
      end
    end
  end
end
