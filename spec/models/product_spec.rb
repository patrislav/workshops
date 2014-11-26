require 'spec_helper'

describe Product do
  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_numericality_of :price }
    it { is_expected.to belong_to :category }
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :reviews }
  end

  describe '#price' do
    let(:product) { build(:product, price: 1.234) }

    it 'is limited to two decimal places' do
      expect(product).to_not be_valid
    end
  end

  describe '#average_rating' do
    let(:user)    { create(:user) }
    let(:product) { create(:product) }
    let(:review1) { create(:review, rating: 2, user: user) }
    let(:review2) { create(:review, rating: 3, user: user) }

    before do
      product.reviews << [review1, review2]
    end

    it 'calculates average rating' do
      expect(product.average_rating).to eq 2.5
    end
  end
end
