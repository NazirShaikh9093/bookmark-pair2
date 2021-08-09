feature "bookmarks" do
  scenario "can load the page" do
    visit('/')
    expect(page).to have_content('Bookmarks')
  end
end