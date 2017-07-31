class Metova::AdminGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :attributes, type: :array, default: []

  hook_for :resource, in: :rails, type: :boolean, default: true do |instance, g|
    instance.invoke g, ["admin/#{instance.name}"]
  end

  def template_controller
    template 'controller.rb.tt', "app/controllers/admin/#{plural_file_name}_controller.rb"
  end

  def template_views
    %w(index new edit).each do |action|
      template "#{action}.html.erb.tt", "app/views/admin/#{plural_file_name}/#{action}.html.erb"
    end

    template '_form.html.erb.tt', "app/views/admin/#{plural_file_name}/_form.html.erb"
    template '_record.html.erb.tt', "app/views/admin/#{plural_file_name}/_#{singular_table_name}.html.erb"
  end

  def template_essentials
    templates = {
      'admin.scss.tt' => 'app/assets/stylesheets/admin.scss',
      'layout.html.erb.tt' => 'app/views/layouts/admin.html.erb',
      'responder.rb.tt' => 'lib/responders/admin_responder.rb',
      'base_controller.rb.tt' => 'app/controllers/admin/base_controller.rb'
    }

    templates.each do |tt, file|
      template tt, file unless File.exist? file
    end
  end

  def add_resource_href_to_sidebar
    return unless File.exist?('app/views/layouts/admin.html.erb')
    insert_into_file 'app/views/layouts/admin.html.erb', after: %Q[<ul id="resource-list" class="nav nav-sidebar">\n] do
      "          <li><%= link_to '#{human_name.pluralize.capitalize}', admin_#{plural_file_name}_path %></li>\n"
    end
  end

end




