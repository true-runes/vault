module ImportService
  class Star < Base
    def rows
      ::OnSheet::Star.all.map do |on_sheet_star|
        [
          on_sheet_star.seating_order,
          on_sheet_star.name,
          on_sheet_star.yomi,
          on_sheet_star.name_en,
        ]
      end
    end
  end
end
