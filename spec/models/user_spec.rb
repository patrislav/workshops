require 'spec_helper'

describe User do
  it { is_expected.to validate_presence_of :firstname }
  it { is_expected.to validate_presence_of :lastname }

  it "by default isn't admin" do
    expect(User.new).to_not be_admin
  end
end
