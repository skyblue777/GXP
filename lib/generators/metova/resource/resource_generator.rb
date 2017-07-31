require 'rails/generators/rails/model/model_generator'

class Metova::ResourceGenerator < Rails::Generators::ModelGenerator
  source_root File.expand_path('../templates', __FILE__)

  hook_for :api, in: :metova, type: :boolean, default: true do |instance, g|
    instance.invoke g, [instance.name] + instance.attributes.map(&:name)
    invocations = instance.instance_variable_get('@_invocations')
    invocations[Rails::Generators::ResourceGenerator].clear
    invocations[Rails::Generators::ControllerGenerator].clear
    invocations[Rails::Generators::ResourceRouteGenerator].clear
    invocations[Rspec::Generators::ControllerGenerator].clear
  end

  hook_for :admin, in: :metova, type: :boolean, default: true do |instance, g|
    instance.invoke g, [instance.name] + instance.attributes.map(&:name)
  end

end
