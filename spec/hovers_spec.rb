
describe 'Caixa de seleção', :hover do
    # o , :hover significa uma tag

    before(:each) do
        visit '/hovers'
    end

    it 'Quando passo o mause sobre o Blade' do
        card = find('img[alt=Blade]')
        card.hover

        expect(page).to have_content 'Nome: Blade'
    end

    it 'Quando passo o mause sobre o Pantera negra' do
        # o ^ serve para indicar a primeira palavra. 
        # No caso vai trazar uma imagem que tem a tag alt que o contúdo começa com Pantera
        card = find('img[alt^=Pantera]')
        card.hover

        expect(page).to have_content 'Nome: Pantera Negra'
    end
        
        it 'Quando passo o mause sobre o Homem Aranha' do
            # o $ serve para indicar a ultima palavra. 
            # No caso vai trazar uma imagem que tem a tag alt que o contúdo termina com Aranha
            card = find('img[alt$=Aranha]')
            card.hover
    
            expect(page).to have_content 'Nome: Homem Aranha'
    end
    # tem também o * que serve para indicar que a tag contem. 
    # No caso vai trazer uma imagem que tem a tag alt que contem a palavra aranha
end