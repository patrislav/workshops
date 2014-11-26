require 'spec_helper'

describe Category do
  it { is_expected.to validate_uniqueness_of(:name) }
end
