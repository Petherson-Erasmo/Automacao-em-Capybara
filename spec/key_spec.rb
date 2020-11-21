

describe 'Precionando um botão no teclado', :key do

    it 'Item especifico simples' do
        visit 'https://training-wheels-protocol.herokuapp.com/key_presses'
    end
    
    it 'Enviando teclas' do
        # criei um array de simbolos para selecinar as teclas que eu precionei 
        teclas = %i[tab escape space enter shift control alt]

        # uso o each para selecionar uma tecla
        teclas.each do |uma_tecla|
            find('#campo-id').send_keys uma_tecla
            expect(page).to have_content 'You entered: ' + uma_tecla.to_s.upcase
            # uso o to_s para converter o simbolo em uma string
            # uso o método upcase para deixar tudo em maiúsclulo
        end
    end

    it 'Enviando letras'
        # criei um array de string para selecionar as letras que eu precionei
        letras = %w[a s d f g h j k l]
        letras.each do |uma_letra|
            find('#campo-id').send_keys uma_letra
            expect(page).to have_content 'You entered: ' + uma_letra.to_s.upcase
        end
    end
end
