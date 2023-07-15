require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe ImportService::OnSheet::Star do
  it 'ソースをもとにしたサービスのオブジェクトが生成されること' do
    expect(
      ImportService::OnSheet::Star.new(
        csv_filepath: Rails.root.join('db/csv_on_sheet/basic_attributes/stars.csv'),
        spreadsheet_title: 'basic_attributes',
        worksheet_name: 'stars'
      )
    ).to be_a ImportService::OnSheet::Star
  end

  describe '取得値' do
    let(:service) do
      ImportService::OnSheet::Star.new(
        csv_filepath: Rails.root.join('db/csv_on_sheet/basic_attributes/stars.csv'),
        spreadsheet_title: 'basic_attributes',
        worksheet_name: 'stars'
      )
    end

    it 'ヘッダが期待どおりであること' do
      expect(service.headers).to eq %i[
        id
        seating_order
        category
        name
        yomi
        name_en
      ]
    end

    it '行が期待どおりであること' do
      aggregate_failures do
        expect(service.rows.count).to eq 108
        expect(service.rows[0]).to eq [
          '1', '1', '0', '天魁星', 'てんかいせい', 'Leader Star'
        ]
      end
    end

    it 'id列 を取り除いたヘッダが期待どおりであること' do
      expect(service.headers_without_id_column).to eq %i[
        seating_order
        category
        name
        yomi
        name_en
      ]
    end

    it 'id列 を取り除いた行が期待どおりであること' do
      aggregate_failures do
        expect(service.rows_without_id_column.count).to eq 108
        expect(service.rows_without_id_column[0]).to eq [
          '1', '0', '天魁星', 'てんかいせい', 'Leader Star'
        ]
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
