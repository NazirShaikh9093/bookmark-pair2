feature "index" do
  scenario "can load the page with test text" do
    visit('/')
    expect(page).to have_content('Test')
  end
end