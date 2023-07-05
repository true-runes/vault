module ImportService
  class Star < Base
    def rows
      resources = JSON.parse(File.read('db/json/stars.json'))

      binding.break

      # seating_orders = on_sheet_stars.map(&:seating_order)
      # names = on_sheet_stars.map(&:name)
      # yomis = on_sheet_stars.count.times.map { |_| '' }
      # name_ens = on_sheet_stars.map(&:name_en)

      # seating_orders.zip(names, yomis, name_ens)
    end
  end
end
