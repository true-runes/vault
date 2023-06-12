module ImportService
  class Base
    def execute
      raise NotImplementedError
    end

    def columns
      raise NotImplementedError
    end

    def values
      raise NotImplementedError
    end

    def data_table
      raise NotImplementedError
    end
  end
end
