

describe 'Caixa de seleção', :upload do
    # o , :upload signiradioica uma tag

    before(:each) do
# O método pwd retorna o caminho no qual a onde eu tenho o diretório de execução do meu projeto. 
# Desta forma se eu tiver o meu projeto em diretórios diferente vai funcionar.
# depois eu concateno com o caminho relativo.
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/banner640x480.png'
        visit '/upload'
    end

    it 'Upload com arquivo texto' do
        # O método attach_file é um método nativo do capybara para fazer o upload
        attach_file('file-upload', @arquivo)
        click_button 'Upload'
        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'arquivo.txt'
    end

    it 'Upload com imagem', :imagem do
        attach_file('file-upload', @imagem)
        click_button 'Upload'
        
        # Pedindo para imprimir o tempo que o capybara espera para até um elemento seja exibido na página é de no máx 2s
        # Com isso mexemos no arquivo spec_helper.rb para aumentarmos esse tempo de espera.
        # puts Capybara.default_max_wait_time
        # sleep 5
        div_image = find('#new-image')
        expect(div_image[:src]).to include '/uploads/banner640x480.png'
    end

end