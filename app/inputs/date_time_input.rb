class DateTimeInput < SimpleForm::Inputs::StringInput

  def input(wrapper_options)
    _input = super(wrapper_options)
    template.content_tag :div, class: 'input-group' do
      # _input += template.content_tag :span, class: 'input-group-addon' do
        # template.content_tag :span, '', class: 'fa fa-calendar'
      # end
      _input
    end
  end

  def input_html_options
    super.merge data: { date_format: 'YYYY-MM-DD' }
  end

end
