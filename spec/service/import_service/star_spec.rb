require 'rails_helper'

describe ImportService::Star do
  it 'ソースをもとにしたサービスのオブジェクトが生成されること' do
    expect(
      ImportService::Star.new(
        csv_filepath: Rails.root.join('db/csv/basic_attributes/stars.csv'),
        spreadsheet_title: 'basic_attributes',
        worksheet_name: 'stars'
      )
    ).to be_a ImportService::Star
  end

  describe '取得値' do
    let(:service) do
      ImportService::Star.new(
        csv_filepath: Rails.root.join('db/csv/basic_attributes/stars.csv'),
        spreadsheet_title: 'basic_attributes',
        worksheet_name: 'stars'
      )
    end

    it 'ヘッダが期待どおりであること' do
      expect(service.columns).to eq %i[
        id
        seating_order
        name
        name_en
      ]
    end

    it '行が期待どおりであること' do
      expect(service.values.count).to eq 108
      expect(service.values[0]).to eq [
        '1', '1', '天魁星', 'Leader Star'
      ]
    end

    it 'id列 を取り除いたヘッダが期待どおりであること' do
      expect(service.headers_without_id).to eq %i[
        seating_order
        name
        name_en
      ]
    end

    it 'id列 を取り除いた行が期待どおりであること' do
      expect(service.values_without_id.count).to eq 108
      expect(service.values_without_id[0]).to eq [
        '1', '天魁星', 'Leader Star'
      ]
    end
  end
end
