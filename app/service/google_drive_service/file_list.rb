module GoogleDriveService
  class FileList
    def initialize(drive_id)
      @api = GoogleDriveService::DriveApi.create
      @drive_id = drive_id
    end

    # *options を追加しても良い
    def get
      @api.list_files(
        q: "'#{@drive_id}' in parents"
      )
    end

    def files
      get.files
    end
  end
end
