
describe 'Iframes' do
    describe 'Iframe bom', :nice_iframe do
        # Esse cenário contém um Id para poder selecionar o Iframe.

        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/nice_iframe'
        end
    
        it 'Adicionar ao carrinho' do
            within_frame('burgerId') do
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                produto.find('a').click
                expect(find('#cart')).to have_content 'R$ 4,50'
            end
        end
    end

    describe 'Iframe ruim', :bad_iframe do
        # Esse cenário não contém um Id para poder selecionar o Iframe 
        # E o método within_iframe só aceita tag name ou id

        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/bad_iframe'
        end
    
        it 'Carrinho deve estar vazio' do
            # A função attr serve para add um atributo temporário.
            # O comando $(".box-iframe").attr("id", "tempId") é um comando do JQuery 
            # E transformei o comando JQuery uma string colocando-os dentro de ''
            script = '$(".box-iframe").attr("id", "tempId");'
            # Com o comando a seguir eu peço para a página executar um script que criei
            # Com isso antes executar os comandos dentro do within eu add um id 
            page.execute_script(script)

            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
            end
        end
    end
end