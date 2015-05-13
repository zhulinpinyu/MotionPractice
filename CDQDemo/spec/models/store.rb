describe 'Store' do

  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Store entity' do
    Store.entity_description.name.should == 'Store'
  end
end
