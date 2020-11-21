

describe 'Caixa de seleção', :drag do
    # o , :drag significa uma tag

    before(:each) do
        visit '/drag_and_drop'
    end

    it 'Homem Aranhapertence ao time do Stark' do
        # o .team-stark é o elemento pai e o .column é o elemento filho
        stark = find('.team-stark .column')
        cap = find('.team-cap .column')

        spiderman = find('img[alt$=Aranha]')
        spiderman.drag_to stark

        expect(stark).to have_css 'img[alt$=Aranha]'
        expect(cap).not_to have_css 'img[alt$=Aranha]'
    end
end