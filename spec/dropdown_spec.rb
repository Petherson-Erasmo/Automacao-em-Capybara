
describe 'Caixa de opção', :dropdown do
    # o , :dropdow significa uma tag
    it 'Item especifico simples' do
        visit '/dropdown'
        select('Loki', from: 'dropdown')
    end
    
    it 'Item especifico com find' do
        visit '/dropdown'
        element_drop = find('.avenger-list')
        element_drop.find('option', text: 'Scott Lang').select_option
        sleep 3
    end

    it 'Item aleatorio', :aleatorio do 
        visit '/dropdown'
        element_drop = find('.avenger-list')
        # o metodo all vai retornar todos os options e transformar e um array
        # o metodo sample vai selecionar um valor aleatoria dentro de um array
        element_drop.all('option').sample.select_option
    end

end