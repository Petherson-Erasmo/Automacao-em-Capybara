
describe 'Tabelas', :table do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/tables'
    end
    
    it 'Deve exibir o salario do stark' do
        # o find só aceita um valor o all aceita todas
        atores = all('table tbody tr')
        stark = atores.detect {|ator| ator.text.include?('Robert Downey Jr')}

        expect(stark.text).to include '10.000.000'
    end

    it 'Deve exibir o salario do vin diesel' do
        diesel = find('table tbody tr', text: '@vindiesel')
        expect(diesel).to have_content '10.000.000'
    end

    it 'Deve exibir o filme velozes' do
        # O have_content está verificando na linha inteira
        # Nesse cenário eu pego exatamente na coluna
        diesel = find('table tbody tr', text: '@vindiesel')
        movie = diesel.all('td')[2].text
        # Deste jeito os teste traz exatamente o texto da coluna
        expect(movie).to eql 'Velozes e Furiosos'
    end

    it 'Deve exibir o instagram do chris evans' do
        evans = find('table tbody tr', text: 'Chris Evans')
        insta = evans.all('td')[4].text
        expect(insta).to eql '@teamcevans'
    end

    it 'Deve selecionar Chris Prat para remoção' do
        prat = find('table tbody tr', text: 'Chris Pratt')
        prat.find('a', text: 'delete').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    it 'Deve selecionar Chris Prat para edição' do
        prat = find('table tbody tr', text: 'Chris Pratt')
        prat.find('a', text: 'edit').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
    end
end