require_relative '../lib/bookmarks.rb'

describe Bookmarks do 
  it "# all method returns all bookmarks" do
    bookmarks = Bookmarks.all

    expect(bookmarks).to include("https://www.google.com/")
    expect(bookmarks).to include("https://www.youtube.com/")
    expect(bookmarks).to include("https://www.livechart.me/summer-2021/tv")
  end
end