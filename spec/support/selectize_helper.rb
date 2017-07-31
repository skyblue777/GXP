module SelectizeHelper

  def selectize(locator, text)
    first("#{locator} div.selectize-input").click
    find('div.option', text: text).click
  end

end

RSpec.configure do |config|
  config.include SelectizeHelper
end
