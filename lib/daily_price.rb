require 'sequel'
DB = Sequel.connect("sqlite://db/price.sqlite")

class DailyPrice < Sequel::Model(:prices)
  def before_create
    self.date = Date.today
    super
  end
end
