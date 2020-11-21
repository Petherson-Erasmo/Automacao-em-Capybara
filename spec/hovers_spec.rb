
describe 'Caixa de seleção', :hover do
    # o , :hover significa uma tag

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/hovers'
    end

    it 'Quando passo o mause sobre o Blade' do
        card = find('img[alt=Blade]')
        card.hover

        expect(page).to have_content 'Nome: Blade'
    end

    it 'Quando passo o mause sobre o Pantera negra' do
        card = find('img[alt="Pantera Negra"]')
        card.hover

        expect(page).to have_content 'Nome: Pantera Negra'
    end
        
        it 'Quando passo o mause sobre o Homem Aranha' do
            card = find('img[alt="Homem Aranha"]')
            card.hover
    
            expect(page).to have_content 'Nome: Homem Aranha'
    end
end