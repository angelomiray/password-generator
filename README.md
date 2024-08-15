Gerador de senhas em ShellScript

# Alunos

Ângelo Miranda e Olive Medeiros, DIMAp, 2024.

# Gerador de Senhas

Este ShellScript permite gerar senhas com base em critérios definidos pelo usuário. As senhas podem ser armazenadas e nomeadas, e o histórico de senhas pode ser visualizado.

## Funcionalidades

- Gerar Senhas: Crie senhas de acordo com o comprimento e os tipos de caracteres desejados.
- Salvar Senhas: Armazene senhas geradas em um arquivo.
- Nomear Senhas: Dê um nome às senhas armazenadas.
- Listar Senhas: Visualize todas as senhas armazenadas no arquivo.

## Uso

Antes de tudo, é necessário permitir que o arquivo seja executado. Para isso:
```bash
chmod +x /password-generator/pwd-gen.sh
```

### Exibir Mensagem de Ajuda

Para exibir a mensagem de ajuda com a descrição das opções, execute:
```bash
./password-generator.sh -h
```

### Gerar uma Senha

Para gerar uma senha de 8 caracteres minúsculos (comportamento padrão):
```bash
./password-generator.sh
```

### Gerar uma Senha com Comprimento e Tipos de Caracteres Específicos

Gerar uma senha de 12 caracteres com letras maiúsculas:
```bash
./password-generator.sh -l 12 -u
```

Gerar uma senha com tamanho 42 com letras maiúsculas, números e símbolos:
```bash
./password-generator.sh -l 42 -u -d -s
```

### Salvar Senha em um Arquivo

Para salvar a senha gerada em um arquivo passwords.txt, use a opção -o:
```bash
./password-generator.sh -o
```

Para adicionar um nome à senha gerada e salvá-la, use a opção -n [NOME] junto com -o:
```bash
./password-generator.sh -n SIGAA -o
```

### Listar Senhas Armazenadas

Para listar todas as senhas armazenadas no arquivo passwords.txt, use a opção -p:
```bash
./password-generator.sh -p
```

## Exemplo Completo

Um exemplo completo que gera uma senha de 16 caracteres, incluindo letras maiúsculas, números e símbolos, e a salva com o nome "DIMAP":
```bash
./password-generator.sh -l 16 -u -d -s -n DIMAP -o
```