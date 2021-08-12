require_relative '../lib/bookmarks.rb'
require_relative './database_helpers.rb'

describe Bookmarks do 
  it "# all method returns all bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    bookmark = Bookmarks.create(url: 'http://www.example.org', title: 'Test Bookmark')
    persisted_data = persisted_data(id: bookmark.id)

    expect(bookmark).to be_a Bookmarks
    expect(bookmark.id).to eq persisted_data['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.example.org'

    connection.exec("TRUNCATE bookmarks;")
  end

  describe '.create' do
    it 'creates a new bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmarks.create(url: 'http://www.example.org', title: 'Test Bookmark')

      expect(bookmark.url).to eq 'http://www.example.org'
      expect(bookmark.title).to eq 'Test Bookmark'

      connection.exec("TRUNCATE bookmarks;")
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmarks.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
  
      Bookmarks.delete(id: bookmark.id)
  
      expect(Bookmarks.all.length).to eq 0
    end
  end

end