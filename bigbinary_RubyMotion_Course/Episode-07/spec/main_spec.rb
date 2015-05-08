describe "Application 'Episode-04'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end
end
