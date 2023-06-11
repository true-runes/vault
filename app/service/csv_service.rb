require 'csv'

class CsvService
  attr_accessor :filepath, :csv_table

  def initialize(filepath)
    @filepath = filepath
    @csv_table = CSV.read(filepath, headers: true)
  end
end
