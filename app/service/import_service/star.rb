module ImportService
  class Star < Base
    def rows
      on_sheet_stars = ::OnSheet::Star.all

      seating_orders = on_sheet_stars.map(&:seating_order)
      names = on_sheet_stars.map(&:name)
      name_ens = on_sheet_stars.map(&:name_en)

      seating_orders.zip(names, name_ens)
    end
  end
end
