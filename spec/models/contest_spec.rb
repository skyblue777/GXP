describe Contest do

  before(:each) do
    @contest = contests(:tenK)
  end

  it 'has a valid contest' do
    expect(@contest).to be_valid
  end

  it 'requires the name attribute to be present' do
    @contest.name = nil
    expect(@contest).to_not be_valid
  end

  it 'requires the starts_at attribute to be present' do
    @contest.starts_at = nil
    expect(@contest).to_not be_valid
  end

  it 'requires the ends_at attribute to be present' do
    @contest.ends_at = nil
    expect(@contest).to_not be_valid
  end

end
