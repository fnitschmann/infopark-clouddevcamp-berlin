class CreateExamples < ::RailsConnector::Migration
  def up
    homepage = Obj.find_by_path("/website/en")
    add_widget(homepage, 'main_content', {
      _obj_class: 'HeroUnitWidget',
      headline: 'Welcome to Infopark',
      content: '<p>You successfully started your
        project. Basic components such as a top navigation, a search panel, this text widget, and a
        login page have been created for you to experiment with the building blocks of your website
        application. To access the documentation or get in touch with the Infopark support team,
        visit the Dev Center.</p><p>
        <a class="btn btn-large btn-primary" href="https://dev.infopark.net/preparation" target="_blank">
        Browse Infopark Dev Center</a></p>',
    })
  end

  private

  def add_widget(obj, attribute, widget_params)
    widget_params.reverse_merge!({
      _path: "_widgets/#{obj.id}/#{SecureRandom.hex(8)}",
    })

    widget = create_obj(widget_params)

    widgets = obj.widgets(attribute)

    list = widgets.inject([]) do |values, widget|
      values << { widget: widget['id'] }
    end

    list << { widget: widget['id'] }

    update_obj(obj.id, attribute => { layout: list })
  end
end