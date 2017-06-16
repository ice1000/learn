describe "Solution" do
  it "should test something" do
    scoreThrows([1, 5, 11]).should eq 15
    scoreThrows([1, 5, 11]).should eq 15
    scoreThrows([15, 20, 30, 31, 32, 44, 100]).should eq 0
    scoreThrows([1, 2, 3, 4]).should eq 140
    scoreThrows([0]).should eq 110
    scoreThrows([1, 2, 3, 4, 5, 6, 7, 8, 9]).should eq 65
    scoreThrows([0, 5, 10, 10.5, 4.5]).should eq 30
  end
end
