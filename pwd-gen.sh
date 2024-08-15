#!/bin/bash

# Função para exibir a ajuda
show_help() {
    echo "Bem vindo ao password generator! Versão 1.0, (c) 2024, Ângelo e Olive, DIMAp, UFRN"
    echo "Uso: $0 [OPÇÕES]"
    echo "Opções:"
    echo "  -l [COMPRIMENTO] : comprimento da senha (padrão: 8)"
    echo "  -u               : incluir letras maiúsculas"
    echo "  -d               : incluir números"
    echo "  -s               : incluir símbolos"
    echo "  -h               : exibir essa mensagem de ajuda"
    echo "  -o               : salvar a senha gerada em um arquivo"
    echo "  -n [NOME]        : adicionar um nome à senha gerada"
    echo "  -p               : listar senhas armazenadas"
}

# Definir variáveis padrão
LENGTH=8
USE_UPPERCASE=false
USE_DIGITS=false
USE_SYMBOLS=false
SAVE_PASSWORD=false
PASSWORD_NAME=""
PASSWORD_FILE="passwords.txt"

# Parsear argumentos
while getopts "l:udso:n:p" opt; do
    case $opt in
        l) LENGTH=$OPTARG ;;
        u) USE_UPPERCASE=true ;;
        d) USE_DIGITS=true ;;
        s) USE_SYMBOLS=true ;;
        o) SAVE_PASSWORD=true ;;
        n) PASSWORD_NAME=$OPTARG ;;
        p) 
            if [ -f "$PASSWORD_FILE" ]; then
                cat "$PASSWORD_FILE"
            else
                echo "Arquivo de senhas não encontrado."
            fi
            exit 0 ;;
        h) show_help; exit 0 ;;
        *) show_help; exit 1 ;;
    esac
done

# Definir conjuntos de caracteres
LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SYMBOLS="!@#$%^&*()-_=+[]{}|;:,.<>?/~"

# Construir a lista de caracteres permitidos
CHAR_SET=$LOWERCASE
[ "$USE_UPPERCASE" = true ] && CHAR_SET+=$UPPERCASE
[ "$USE_DIGITS" = true ] && CHAR_SET+=$DIGITS
[ "$USE_SYMBOLS" = true ] && CHAR_SET+=$SYMBOLS

# Função para gerar a senha
generate_password() {
    tr -dc "$CHAR_SET" < /dev/urandom | head -c $LENGTH
}

# Gerar a senha
PASSWORD=$(generate_password)

# Exibir a senha gerada
echo "Senha gerada: $PASSWORD"

# Salvar a senha em um arquivo
if [ "$SAVE_PASSWORD" = true ]; then
    if [ -n "$PASSWORD_NAME" ]; then
        echo "$PASSWORD_NAME: $PASSWORD" >> "$PASSWORD_FILE"
    else
        echo "$PASSWORD" >> "$PASSWORD_FILE"
    fi
fi

# Opcional: salvar a senha em um arquivo criptografado
if [ "$SAVE_PASSWORD" = true ]; then
    echo "$PASSWORD" | openssl enc -aes-256-cbc -e -base64 -out password.txt.enc -pass pass:yourpassword
fi
