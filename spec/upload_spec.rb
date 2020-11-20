

describe 'Caixa de seleção', :upload do
    # o , :upload signiradioica uma tag

    before(:each) do
# O método pwd retorna o caminho no qual a onde eu tenho o diretório de execução do meu projeto. 
# Desta forma se eu tiver o meu projeto em diretórios diferente vai funcionar.
# depois eu concateno com o caminho relativo.
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/banner640x480.png'
        visit 'https://training-wheels-protocol.herokuapp.com/upload'
    end

    it 'Upload com arquivo texto' do
        # O método attach_file é um método nativo do capybara para fazer o upload
        attach_file('file-upload', @arquivo)
        click_button 'Upload'
        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'arquivo.txt'
    end

    it 'Upload com imagem' do
        attach_file('file-upload', @imagem)
        click_button 'Upload'
        
        sleep 5
        div_image = find('#new-image')
        expect(div_image[:src]).to include '/uploads/banner640x480.png'
    end

end