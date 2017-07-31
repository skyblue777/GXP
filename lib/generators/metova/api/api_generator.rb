class Metova::ApiGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :attributes, type: :array, default: []

  hook_for :resource, in: :rails, type: :boolean, default: true do |instance, g|
    options = { template_engine: false, helper: false, assets: false }
    instance.invoke g, ["api/#{instance.name}"], options
  end

  def template_controller!
    template 'controller.rb.tt', "app/controllers/api/#{plural_file_name}_controller.rb", force: true
  end

end
