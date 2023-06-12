module ImportService
  class Title < Base
    def execute
      ActiveRecord::Base.transaction do
        ::Title.import(columns, values, validate: true)
      end
    end

    def columns
      @data_table.headers.map(&:to_sym)
    end

    def values
      @data_table.rows
    end
  end
end
