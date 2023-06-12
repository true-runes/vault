require 'csv'

module FetchDataTableService
  class FromCsv < Base
    def initialize(csv_filepath)
      super

      @csv = CSV.read(csv_filepath, headers: true)
    end

    def headers
      @csv.headers
    end

    def rows
      @csv.to_a.drop(1)
    end

    # @csv.values_at(*headers) だと複数列が取得できる（*headers の要素は文字列）
    def header_to_rows
      {}.tap do |hash|
        headers.each do |header|
          rows.each do |row|
            hash[header.to_sym] ||= []
            hash[header.to_sym] << row[headers.index(header)]
          end
        end
      end
    end
  end
end
