

describe 'Caixa de seleção', :checkbox do
    # o , :checkbox significa uma tag

    before(:each) do
        visit '/checkboxes'
    end

    it 'Marcando opção' do
        check('thor')
    end

    it  'Desmarcando uma opção' do
        uncheck('antman')
    end

    it 'Marcando com find set true' do
        # eu vou buscar o elemento do tipo input que tem o value com o valor igual passado
        find('input[value=cap]').set(true)
    end

    it 'Desmarcando com find set false' do
        find('input[value=guardians]').set(false)
    end

    after(:each) do
        sleep 2
    end
end