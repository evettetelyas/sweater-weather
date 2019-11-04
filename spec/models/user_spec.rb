require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes" do
    it { should validate_uniqueness_of :email }
  end
end
