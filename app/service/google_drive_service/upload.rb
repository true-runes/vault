module GoogleDriveService
  class Upload
    def initialize(
      source_filepath: nil,
      uploaded_filename: nil,
      drive_id: nil
    )
      @api = GoogleDriveService::DriveApi.create

      @source_filepath = source_filepath
      @uploaded_filename = uploaded_filename
      # mime_type が "application/vnd.google-apps.folder" の id
      @drive_id = drive_id
    end

    def execute
      @api.create_file(
        {
          name: @uploaded_filename,
          parents: [@drive_id]
        },
        upload_source: @source_filepath
      )
    end
  end
end
