#!/bin/bash

# Função para exibir a ajuda
show_help() {
    echo "Bem vindo ao password-generator! Versão 1.0, (c) 2024, Ângelo e Olive, DIMAp, UFRN"
    echo "Uso: $0 [OPÇÕES]"
    echo "Opções:"
    echo "  -l [COMPRIMENTO] : comprimento da senha"
    echo "  -u               : incluir letras maiúsculas"
    echo "  -d               : incluir números"
    echo "  -s               : incluir símbolos"
    echo "  -h               : exibir essa mensagem de ajuda"
}

# Definir variáveis padrão
LENGTH=8
USE_UPPERCASE=false
USE_DIGITS=false
USE_SYMBOLS=false

# Parsear argumentos
while getopts "l:udsh" opt; do
    case $opt in
        l) LENGTH=$OPTARG ;;
        u) USE_UPPERCASE=true ;;
        d) USE_DIGITS=true ;;
        s) USE_SYMBOLS=true ;;
        h) show_help; exit 0 ;;
        *) show_help; exit 1 ;;
    esac
done

# Definir conjuntos de caracteres
LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SYMBOLS="!@#$%^&*()-_=+[]{}|;:,.<>?/~"