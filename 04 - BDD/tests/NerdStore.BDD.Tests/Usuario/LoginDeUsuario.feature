﻿Funcionalidade: Usuário - Login
	Como um usuario
	Eu desejo realizar o Login
	Para que eu possa acessar as demais funcionalidades

Cenario:  Realizar login com sucesso
Dado Que o visitante está acessando o site da loja
Quando Ele clicar em login
E Preencher os dados do formulario de login
		| Dados                |
		| E-mail               |
		| Senha                |
E Clicar no botão login
Então Ele será redirecionado para a vitrine
E Uma saudação com seu e-mail será exibida no menu superior
E Uma saudação com seu e-mail será exibida no menu superior