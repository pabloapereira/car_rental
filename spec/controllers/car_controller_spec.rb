require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  let(:car) { create(:car) }

  describe 'GET #index' do
    it "return all cars" do
      store = create(:store)
      create_list(:car, 10, store: store)

      get :index, format: :json

      responseJson = JSON.parse(response.body)
      expectedJson = Car.all.map { |car|
        format_json(car)
      }
      #binding.pry

      validate_success(response, 200, 10)
      expect(responseJson).to eq(expectedJson)
    end
  end

  def validate_success(response, status, cars_in_db = 0)
    expect(response).to have_http_status(status)
    expect(Car.count).to eq(cars_in_db)
  end


  def format_json(e)
    return {
      "id" => e.id,
      "name" => e.name,
      "brand" => e.brand,
      "year" => e.year,
      "plate" => e.plate,
      "store_id" => e.store_id,
      "created_at" => e.created_at.iso8601(3),
      "updated_at" => e.updated_at.iso8601(3)
    }
  end
end