feature 'Feature - When I want to start a new game' do
  scenario 'I see a link to "New Game"' do
    visit '/'
    expect(page).to have_content "New Game"
  end

  feature 'Feature - When I click on "New Game"' do
    scenario 'I am asked to enter my name' do
      visit '/'
      click_on 'New Game'
      expect(page).to have_content "What's your name?"
    end

    feature 'Feature - When I enter my name' do
      scenario 'I am taken to the play page' do
        visit '/'
        click_on 'New Game'
        fill_in('Name', with: "Sanj")
        click_on 'Play'
        expect(current_path).to eq '/play'
      end

      scenario 'I am welcomed to the game' do
        visit '/'
        click_on 'New Game'
        fill_in('Name', with: "Sanj")
        click_on 'Play'
        expect(page).to have_content "Welcome Sanj"
      end
    end

    feature 'Feature - When I do not enter my name' do
      scenario 'I am taken back to the name input form' do
        visit '/'
        click_on 'New Game'
        fill_in('Name', with: "")
        click_on 'Play'
        expect(page).to have_content "What's your name?"
      end

      scenario 'I am told I must enter my name to play' do
        visit '/'
        click_on 'New Game'
        fill_in('Name', with: "")
        click_on 'Play'
        expect(page).to have_content "Must enter name to play"
      end
    end
  end
end
