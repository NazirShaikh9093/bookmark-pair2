require_relative '../lib/bookmarks.rb'

describe Bookmarks do 
  it "# all method returns all bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    bookmarks = Bookmarks.all

    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmarks.create(url: 'http://www.example.org')

      expect(Bookmarks.all).to include 'http://www.example.org'
    end
  end

end