

describe 'Alerta de JS', :alerts do

    before(:each) do
        visit '/javascript_alerts'
    end

    it 'Alerta' do
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text
        puts msg # só para garantir que a mensagem está certa
        expect(msg).to eql 'Isto é uma mensagem de alerta'
        sleep 3 
    end

    it 'Sim confirma' do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end

    it 'Não confirma' do
        click_button 'Confirma'
    
        # O alert é um componente do JS e o selenium consegue manipular.
        # Chamo o .driver e informo que desejo usar o navegador da sessão .browser.
        # O switch_to.alert informo para o selenium que quero trabalhar com outra janela no caso o alert.
        # O .text obtém o texto que está dentro do alert.
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'Accept Prompt', :accept_prompt do
        accept_prompt(with: 'Petherson') do
            click_button 'Prompt'
        end
        expect(page).to have_content 'Olá, Petherson'
    end

    it 'Dismiss Prompt', :dismiss_prompt do
        dismiss_prompt do
            click_button 'Prompt'
            
        end
        expect(page).to have_content 'Olá, null'

    end

end
