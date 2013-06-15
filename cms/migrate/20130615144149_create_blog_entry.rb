class CreateBlogEntry < ::RailsConnector::Migration
  def up
    create_obj_class(
      name: 'BlogEntry',
      type: 'publication',
      title: 'Page: Blog Entry',
      attributes: [
        {:name=>"headline", :type=>:string, :title=>"Headline"},
        {:name=>"author", :type=>:string, :title=>"Author"},
        {:name=>"main_content", :type=>:widget, :title=>"Main content"},
        {:name=>"abstract", :type=>:html, :title=>"Abstract"},
      ],
      preset_attributes: {},
      mandatory_attributes: []
    )
  end
end