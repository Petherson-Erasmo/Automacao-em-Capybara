
describe 'login com cadastro', :login3 do

    before(:each) do
        visit '/access'
    end
    
    it 'Login com sucesso' do
    #     # Eu preciso usar um escopo para poder encontrar os campos
    #     login_form = find('#login')
    #     # Tive que usar um seletor pois o id era dinâmico.
    #     login_form.find('input[name=username]').set 'stark'
    #     login_form.find('input[name=password]').set 'jarvis!'
    #     # as linhas de cima estão certas eu posso trabalhar desta forma.

        # A seguir eu chamo uma função do capybara e passo o elemento pai que é o #login (id).
        # Eu chamo o método e dentro dele faço um escopo.
        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'
            click_button 'Entrar'
        end

        # click_button 'Entrar'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'Cadastro com sucesso' do

        within('#signup') do
            find('input[name=username]').set 'Petherson'
            find('input[name=password]').set 'pet123'
            click_link 'Criar Conta'
            # O elemento é um link e não um botão ele está apenas estilizado.
        end
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
        
    end
end