require 'spec_helper'

describe User do
  describe 'validations' do
    it { is_expected.to validate_presence_of :firstname }
    it { is_expected.to validate_presence_of :lastname }
    it { is_expected.to have_many :reviews }
    it { is_expected.to have_many :products }
  end

  it "by default isn't admin" do
    expect(User.new).to_not be_admin
  end
end
