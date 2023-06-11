module ImportService
  class Title
    def execute
      ActiveRecord::Base.transaction do
        ::Title.import(columns, values, validate: true)
      end
    end

    def columns
      [:name]
    end

    def values
      [
        ['abc'],
        ['def'],
      ]
    end
  end
end
