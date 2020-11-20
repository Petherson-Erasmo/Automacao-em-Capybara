
describe 'Forms' do
    it 'login com sucesso' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'

        page.has_css?('.button', text: 'Login', wait: 10)
    
        fill_in 'username', with: 'stark'
    
        fill_in 'password', with: 'jarvis!'
    
        find('i', text:'Login').click()
    
        #click_button ' Login'
    
        page.has_css?('#flash', wait: 5)
    
        expect(find('#flash').visible?).to be true
        
        # expect(find('#flash').text).to eql 'Olá, Tony Stark. Você acessou a área logada!' # essa da erro pois é encontrado um X 
        # expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!' # essa funciona também.
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!' # essa e a de cima funciona normalmente
        
        # visit "https://training-wheels-protocol.herokuapp.com/login"
        # fill_in 'username', with: 'stark'
        # fill_in 'password', with: 'jarvis!'
        
        # page.current_window.resize_to(1366, 768) 
        # click_button ' Login'
        
        # expect(find('#flash').visible?).to be true
    end
end