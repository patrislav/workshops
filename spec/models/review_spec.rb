require 'spec_helper'

describe Review do
  describe 'validations' do
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :rating }
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to belong_to :user }

  end
end
