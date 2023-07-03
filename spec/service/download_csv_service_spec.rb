require 'rails_helper'

describe DownloadCsvService do
  let(:service) do
    DownloadCsvService.new(
      spreadsheet_id: SpreadsheetService::SheetId.title_to_id('basic_attributes'),
      worksheet_name: 'stars'
    )
  end

  # 設定ファイルの煩雑さ上、CI ではスキップする
  describe 'CSVファイル' do
    unless ENV['CI'] == 'true'
      it '期待どおりにダウンロード（＝生成）されていること' do
        service.execute('tmp/vault_test.csv')

        expect(File.exist?('tmp/vault_test.csv')).to be_truthy
      end

      it '一行目（ヘッダ）の内容が期待どおりであること' do
        service.execute('tmp/vault_test_check_first_row.csv')

        expect(
          File.open('tmp/vault_test_check_first_row.csv').readline.chomp
        ).to eq 'id,seating_order,name,name_en'
      end

      it '二行目（内容の行の一行目）の内容が期待どおりであること' do
        service.execute('tmp/vault_test_check_second_row.csv')

        expect(
          File.open('tmp/vault_test_check_first_row.csv').readlines[1].chomp
        ).to eq '1,1,天魁星,Leader Star'
      end
    end
  end
end
