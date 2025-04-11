module GoogleDriveService
  # File だと名前が衝突するので FileManager にした
  class FileManager
    def initialize(file)
      @api = GoogleDriveService::DriveApi.create
      @file = file
    end

    def file?
      # 以下のような mime_type を持つオブジェクトはファイルではない
      # "application/vnd.google-apps.folder"
      # "application/vnd.google-apps.spreadsheet"
      # "application/vnd.google-apps.document"
      return false if @file.mime_type.start_with?('application')

      true
    end

    def folder?
      @file.mime_type == 'application/vnd.google-apps.folder'
    end

    def download(destination_filepath)
      @api.get_file(
        @file.id,
        download_dest: destination_filepath
      )
    end
  end
end
