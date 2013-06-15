class CreateAnnouncement < ::RailsConnector::Migration
  def up
    create_obj_class(
      name: 'Announcement',
      type: 'publication',
      title: 'Announcement',
      attributes: [
        {:name=>"message", :type=>"string"},
      ],
      preset_attributes: {},
      mandatory_attributes: []
    )
  end
end