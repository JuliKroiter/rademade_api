require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:category) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
end
