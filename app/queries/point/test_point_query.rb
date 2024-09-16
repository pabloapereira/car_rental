module PointQuery
  extend self
  attr_reader :query

  def get_employer

    @query = User.select("name").where(name: "Jimmy DeLocke")

    @query = @query.map do |entry|
      entry.name
    end
  end
end