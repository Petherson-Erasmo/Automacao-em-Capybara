

describe 'Select 2', :select2 do
    # o , :select2 significa uma tag

    describe('Single', :single) do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/apps/select2/single.html'
        end

        it 'Seleciona ator por nome' do
            find('.select2-selection--single').click
            find('.select2-results__option', text: 'Adam Sandler').click
        end

        it 'Busca e clica no ator' do
            find('.select2-selection--single').click
            find('.select2-search__field').set 'Chris Rock'
            find('.select2-results__option').click
        end
    end

    describe('Multiple', :multi) do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/apps/select2/multi.html'
        end

        # eu criei um método para não precisar ficar repetindo código
        def selecione(ator)
            find('.select2-selection--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click
        end

        it 'Seleciona atores' do
            # Da forma a seguiar vamos selecionar uma ator por vez passando o metodo selecione que criamos
            # selecione('Jim Carrey')
            # selecione('Owen Wilson')

            # Para melhorar ainda mais os testes criamos um array
            atores = ['Jim Carrey','Owen Wilson','Kevin James']
            atores.each do |um_ator|
                selecione(um_ator)
            end
        end
    end
end