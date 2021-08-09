feature "bookmarks" do
  scenario "can load page with text" do
    visit('/bookmarks')
    expect(page).to have_content('Bookmarks')
    expect(page).to have_content('https://www.google.com/')
    expect(page).to have_content('https://www.youtube.com/')
    expect(page).to have_content('https://www.livechart.me/summer-2021/tv')
  end
end