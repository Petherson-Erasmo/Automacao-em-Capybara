

describe 'Caixa de seleção', :radio do
    # o , :radio signiradioica uma tag

    before(:each) do
        visit '/radios'
    end

    it 'Seleção por ID' do
        choose('cap')
    end

    it 'Seleção por find e css selector' do
        find('input[value=guardians]').click
    end

end