require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_many(:orders) }
  it { is_expected.to have_many(:products).through(:orders) }

end
