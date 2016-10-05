require 'rails_helper'

RSpec.describe Book, type: :model do
   it { should validate_presence_of(:title) }
   it { should validate_presence_of(:description) }
   it { should validate_length_of(:title).is_at_most(255) }
end
