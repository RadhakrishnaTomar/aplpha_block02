require 'rails_helper'

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
#   subject { Article.new(title: "Jack", description: "Smith")}
  describe 'columns' do
  it { is_expected.to have_db_column(:title) }
  it { is_expected.to have_db_column(:description)}
end
 describe 'columns' do 
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description)}
  end

  describe 'association' do 
    it {is_expected.to belong_to(:user)}
  end

  describe 'validate_length_of' do
  it do
        should validate_length_of(:title).
        is_at_least(5).is_at_most(7)
      end 
    it do 
      should validate_length_of(:description).
      is_at_least(10).is_at_most(15)
    end
  end

end
