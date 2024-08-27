require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with attributes valid" do
    user = User.new(name: "pablo", age: 12, cpf: 123, driver_license: "A", card: 10)
    expect(user).to be_valid
  end
end
