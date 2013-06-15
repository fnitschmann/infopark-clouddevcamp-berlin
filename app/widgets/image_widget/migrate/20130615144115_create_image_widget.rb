class CreateImageWidget < ::RailsConnector::Migration
  def up
    create_obj_class(
      name: 'ImageWidget',
      type: 'publication',
      title: 'Image widget',
      attributes: [
        {:name=>"headline", :type=>:string, :title=>"Headline"},
        {:name=>"caption", :type=>:string, :title=>"Caption"},
        {:name=>"source", :type=>:linklist, :title=>"Source", :max_size=>1},
      ],
      preset_attributes: {},
      mandatory_attributes: []
    )
  end
end