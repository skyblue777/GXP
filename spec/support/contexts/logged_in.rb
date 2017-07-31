shared_context 'logged in' do |proc|

  before do
    _user = instance_eval(&proc)
    type = _user.class.to_s.downcase

    visit send(:"new_#{type}_session_path")
    fill_in "#{type}_email", with: _user.email
    fill_in "#{type}_password", with: 'metova123'
    click_button 'Sign in'
  end

end

def login(&proc)
  include_context 'logged in', proc
end