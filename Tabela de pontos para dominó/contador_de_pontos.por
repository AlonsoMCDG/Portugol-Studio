/*
ESTﾃ宇ANE:	35 | 15 | 25
ALONSO:	65 | 45 | 15
VINﾃ垢IUS	20 | 25 | 30


*/
programa
{
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g 
	inclua biblioteca Teclado --> t
	inclua biblioteca Texto --> txt
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat
	inclua biblioteca Tipos --> tp
	
	/// CONSTANTES
	const inteiro LARGURA_JANELA_PADRAO = 720
	const inteiro ALTURA_JANELA_PADRAO = 480

	const inteiro MAXIMO_DE_JOGADORES = 10
	const inteiro NUMERO_DE_BOTOES_DE_PONTUACAO_TABELA_DE_JOGADORES = 4

	const inteiro JANELA_TABELA = 0
	const inteiro JANELA_ADICIONAR_JOGADOR = 1
	const inteiro JANELA_REMOVER_JOGADOR = 2
	
	/// VARIÁVEIS DE CONFIGURAÇÃO DO MODO DE DESENHO
	
	const inteiro ALTURA_PADRAO_DE_BOTAO = 40
	const real TAMANHO_PADRAO_DE_TEXTO_DE_BOTAO = 20.0

	const inteiro ANCORA_CENTRO = 0
	const inteiro ANCORA_NO = 1
	const inteiro ANCORA_N = 2
	const inteiro ANCORA_NE = 3
	const inteiro ANCORA_E = 4
	const inteiro ANCORA_SE = 5
	const inteiro ANCORA_S = 6
	const inteiro ANCORA_SO = 7
	const inteiro ANCORA_O = 8
	inteiro ancora_de_desenho_de_objetos = ANCORA_NO

	const inteiro PADDING_INTERNO_PADRAO_DE_TEXTO_DE_BOTAO = 10

	logico PREENCHER_FIGURAS = verdadeiro

	/// VARIÁVEIS DA JANELA
	inteiro largura_janela = LARGURA_JANELA_PADRAO
	inteiro altura_janela = ALTURA_JANELA_PADRAO

	inteiro janela_atual = JANELA_TABELA

	/// VARIÁVEIS DO MENU SUPERIOR
	real tamanho_texto_botoes_menu = 20.0

	// dimensões do menu superior
	inteiro largura_barra_menu_superior = largura_janela
	inteiro altura_barra_menu_superior = 40
	inteiro x_barra_menu_superior = 0
	inteiro y_barra_menu_superior = 0

	// dimensões do botão de adicionar jogador
	inteiro largura_botao_adicionar_jogador = largura_janela / 2
	inteiro altura_botao_adicionar_jogador = ALTURA_PADRAO_DE_BOTAO
	inteiro x_botao_adicionar_jogador = 0
	inteiro y_botao_adicionar_jogador = 0
	inteiro cor_fundo_botao_adicionar_jogador = 0x11ff44

	// dimensões do botão de remover jogador
	inteiro largura_botao_remover_jogador = largura_janela / 2
	inteiro altura_botao_remover_jogador = ALTURA_PADRAO_DE_BOTAO
	inteiro x_botao_remover_jogador = largura_janela / 2
	inteiro y_botao_remover_jogador = 0
	inteiro cor_fundo_botao_remover_jogador = 0xff3322

	// dimensões do botão de salvar partida
	inteiro padding_botao_salvar_partida = 20
	inteiro padding_inferior_botao_salvar_partida = 20
	inteiro largura_botao_salvar_partida = largura_janela / 2 - 2 * padding_botao_salvar_partida
	inteiro altura_botao_salvar_partida = 50
	inteiro x_botao_salvar_partida = largura_janela / 2 + padding_botao_salvar_partida
	inteiro y_botao_salvar_partida = altura_janela - altura_botao_salvar_partida - padding_inferior_botao_salvar_partida
	inteiro cor_botao_salvar_partida = 0x666666

	// dimensões do botão de histórico de partidas
	// A-FAZER

	/// VARIÁVEIS DA TELA DE TABELA DE JOGADORES
	real tamanho_texto_tabela_de_jogadores = 30.0

	// dimensões da tabela
	inteiro padding_lateral_tabela_de_jogadores = 10
	inteiro largura_tabela_de_jogadores = largura_janela - 2 * padding_lateral_tabela_de_jogadores
	inteiro altura_tabela_de_jogadores = altura_janela
	inteiro x_tabela_de_jogadores = padding_lateral_tabela_de_jogadores
	inteiro y_tabela_de_jogadores = 10 + y_barra_menu_superior + altura_barra_menu_superior
	inteiro cor_fundo_tabela_de_jogadores = 0x33aa99

	// dimensões da linha
	inteiro altura_linha_tabela_de_jogadores = 60
	inteiro largura_linha_tabela_de_jogadores = largura_tabela_de_jogadores
	inteiro cor_fundo_linha_tabela_de_jogadores = 0xeeeeee

	// dimensões do cabeçalho
	inteiro largura_cabecalho_tabela_de_jogadores = largura_tabela_de_jogadores
	inteiro altura_cabecalho_tabela_de_jogadores = 30
	inteiro x_cabecalho_tabela_de_jogadores = x_tabela_de_jogadores
	inteiro y_cabecalho_tabela_de_jogadores = y_tabela_de_jogadores
	inteiro cor_fundo_cabecalho_tabela_de_jogadores = 0xcccccc

	// dimensões dos botões de pontuação
	inteiro padding_botoes_de_pontuacao_tabela_de_jogadores = 5
	inteiro tamanho_botoes_de_pontuacao_tabela_de_jogadores = altura_linha_tabela_de_jogadores - 2 * padding_botoes_de_pontuacao_tabela_de_jogadores
	inteiro x_inicial_botoes_tabela_de_jogadores = largura_linha_tabela_de_jogadores / 2 + largura_linha_tabela_de_jogadores / 4
	inteiro cor_fundo_botoes_de_pontuacao_tabela_de_jogadores = 0xabcdef

	real tamanho_texto_botoes_de_pontuacao_tabela_de_jogadores = 22.0
	cadeia texto_botoes_de_pontuacao_tabela_de_jogadores[NUMERO_DE_BOTOES_DE_PONTUACAO_TABELA_DE_JOGADORES] = {"-5", "-10", "+5", "+10"}
	inteiro acao_botoes_de_pontuacao_tabela_de_jogadores[NUMERO_DE_BOTOES_DE_PONTUACAO_TABELA_DE_JOGADORES] = {-5, -10, +5, +10}
	inteiro cor_botoes_de_pontuacao_positiva_tabela_de_jogadores = 0x22ff77
	inteiro cor_botoes_de_pontuacao_negativa_tabela_de_jogadores = 0xff5555

	// controle do número de jogadores
	inteiro numero_de_jogadores = 3
	cadeia nome_jogadores[MAXIMO_DE_JOGADORES] = {"ALONSO", "ESTEFANE", "VINICIUS", "", "", "", "", "", "", ""}
	inteiro pontuacao_jogadores[MAXIMO_DE_JOGADORES] = {5, 10, 15, 0, 0, 0, 0, 0, 0, 0}

	inteiro x_botoes_de_pontuacao_tabela_de_jogadores_de_cada_jogador[MAXIMO_DE_JOGADORES][NUMERO_DE_BOTOES_DE_PONTUACAO_TABELA_DE_JOGADORES]
	inteiro y_botoes_de_pontuacao_tabela_de_jogadores_de_cada_jogador[MAXIMO_DE_JOGADORES][NUMERO_DE_BOTOES_DE_PONTUACAO_TABELA_DE_JOGADORES]

	/// VARIÁVEIS DA TELA DE ADICIONAR JOGADOR
	
	// caixa de texto
	cadeia nome_novo_jogador = "FULANO"
	logico nome_novo_jogador_eh_valido = verdadeiro

	logico ponteiro_de_texto_esta_ativo = falso
	inteiro intervalo_para_flick_do_ponteiro_de_texto = 500 // em milissegundos
	inteiro tempo_atual_flicker = 0

	// dimensões da janela
	inteiro largura_janela_adicionar_jogador = largura_janela / 2
	inteiro altura_janela_adicionar_jogador = altura_janela / 2
	inteiro x_janela_adicionar_jogador = largura_janela / 4
	inteiro y_janela_adicionar_jogador = altura_janela / 4

	inteiro padding_janela_adicionar_jogador = 10

	// dimensões dos botões
	inteiro largura_botoes_janela_adicionar_jogador = (largura_janela_adicionar_jogador - padding_janela_adicionar_jogador * 3) / 2
	inteiro altura_botoes_janela_adicionar_jogador = ALTURA_PADRAO_DE_BOTAO
	inteiro y_botoes_janela_adicionar_jogador = y_janela_adicionar_jogador + altura_janela_adicionar_jogador - padding_janela_adicionar_jogador - altura_botoes_janela_adicionar_jogador
	inteiro x_botao_cancelar_janela_adicionar_jogador = x_janela_adicionar_jogador + padding_janela_adicionar_jogador
	inteiro x_botao_confirmar_janela_adicionar_jogador = x_janela_adicionar_jogador + largura_janela_adicionar_jogador / 2 + padding_janela_adicionar_jogador / 2

	inteiro cor_botao_confirmar_ativado = 0x39cc00
	inteiro cor_botao_confirmar_desativado = 0x38522e
	inteiro cor_botao_cancelar = 0xaaaaaa

	// dimensões da caixa de texto
	inteiro altura_caixa_de_texto_janela_adicionar_jogador = 50
	inteiro largura_caixa_de_texto_janela_adicionar_jogador = largura_janela_adicionar_jogador - padding_janela_adicionar_jogador * 2
	inteiro x_caixa_de_texto_janela_adicionar_jogador = x_janela_adicionar_jogador + padding_janela_adicionar_jogador
	inteiro y_caixa_de_texto_janela_adicionar_jogador = y_janela_adicionar_jogador + padding_janela_adicionar_jogador + altura_janela_adicionar_jogador / 2 - altura_caixa_de_texto_janela_adicionar_jogador

	// mensagem de "nome inválido"
	inteiro x_mensagem_de_nome_invalido = x_caixa_de_texto_janela_adicionar_jogador + largura_caixa_de_texto_janela_adicionar_jogador / 2
	inteiro y_mensagem_de_nome_invalido = y_caixa_de_texto_janela_adicionar_jogador + altura_caixa_de_texto_janela_adicionar_jogador + 20
	inteiro cor_mensagem_de_nome_invalido = 0xff8888
	inteiro tempo_atual_mensagem_de_nome_invalido = 0
	inteiro intervalo_para_mensagem_de_nome_invalido = 5000 // em milissegundos
	logico deve_mostrar_mensagem_de_nome_invalido = falso


	/// VARIÁVEIS DA TELA DE REMOVER JOGADOR
	logico jogadores_para_remover[MAXIMO_DE_JOGADORES] = {falso, falso, falso, falso, falso, falso, falso, falso, falso, falso}

	// dimensões do check box
	inteiro padding_check_box_remover_jogador = 10
	inteiro tamanho_check_box_remover_jogador = altura_linha_tabela_de_jogadores - 2 * padding_botoes_de_pontuacao_tabela_de_jogadores - padding_check_box_remover_jogador
	inteiro x_check_boxes[MAXIMO_DE_JOGADORES]
	inteiro y_check_boxes[MAXIMO_DE_JOGADORES]

	// dimensões dos botões
	inteiro largura_botoes_janela_remover_jogador = largura_janela / 2
	inteiro altura_botoes_janela_remover_jogador = 50
	inteiro y_botoes_janela_remover_jogador = altura_janela - altura_botoes_janela_remover_jogador
	inteiro x_botao_cancelar_janela_remover_jogador = 0
	inteiro x_botao_confirmar_janela_remover_jogador = largura_janela / 2



	/**********/
	
	funcao inicio()
	{
		inicializar()
		
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC))
			game_loop()
		
		finalizar()
	}

	// inicializa a janela e o modo gráfico
	funcao inicializar()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(largura_janela, altura_janela)
		g.definir_titulo_janela("Tabela de pontos no dominó")
	}

	funcao game_loop()
	{
		g.renderizar()
		
		desenhar_fundo()
		desenhar_tabela_de_jogadores()
		desenhar_menu_superior()

		se (janela_atual == JANELA_ADICIONAR_JOGADOR)
		{
			desenhar_janela_de_adicionar_jogador()
			capturar_entrada_de_texto()
		}

		se (janela_atual == JANELA_REMOVER_JOGADOR)
		{
			desenhar_interface_remover_jogador()
		}

		capturar_cliques_do_mouse()
	}

	funcao definir_modo_de_preenchimento(logico preencher)
	{
		PREENCHER_FIGURAS = preencher
	}

	funcao definir_modo_de_ancoramento(inteiro ancora)
	{
		ancora_de_desenho_de_objetos = ancora
	}

	funcao inteiro escurecer_cor(inteiro cor, inteiro valor)
	{
		inteiro r = tp.real_para_inteiro(mat.maior_numero(0.0, (cor & 0xff0000) - valor + 0.0))
		inteiro g = tp.real_para_inteiro(mat.maior_numero(0.0, (cor & 0x00ff00) - valor + 0.0))
		inteiro b = tp.real_para_inteiro(mat.maior_numero(0.0, (cor & 0x0000ff) - valor + 0.0))
		
		retorne r | g | b
	}

	funcao real luminancia(inteiro cor)
	{
		inteiro r = cor & 0xff0000
		inteiro g = cor & 0x00ff00
		inteiro b = cor & 0x0000ff

		retorne 0.299 * r + 0.587 * g + 0.114 * b
	}

	funcao inteiro escolher_cor_sombra(inteiro cor_texto, inteiro cor_botao)
	{
		real l_texto = luminancia(cor_texto)
		real l_botao = luminancia(cor_botao)

		// Se o texto for claro e o botão também, use sombra escura
		se (l_texto > 128 e l_botao > 128)
			retorne 0x000000 // preto
		// Se o texto for escuro e o botão também, use sombra clara
		senao se (l_texto < 128 e l_botao < 128)
			retorne 0xffffff // branco
		// Caso o texto tenha bom contraste com o botão, use sombra intermediária
		retorne escurecer_cor(cor_botao, 0x3c)
	}
	
	funcao desenhar_botao(inteiro x_botao, inteiro y_botao, inteiro largura_botao, inteiro altura_botao, inteiro cor_botao, logico arredondar_cantos, cadeia texto, real tamanho_texto, inteiro cor_texto, logico centralizar_texto)
	{
		inteiro x_b = x_botao, y_b = y_botao
		inteiro x_t, y_t
		logico preencher = PREENCHER_FIGURAS 
		
		g.definir_tamanho_texto(tamanho_texto)
		
		se (ancora_de_desenho_de_objetos == ANCORA_NO)
		{
			x_t = x_b + PADDING_INTERNO_PADRAO_DE_TEXTO_DE_BOTAO
			y_t = x_b + altura_botao / 2 - g.altura_texto(texto)
		}
		senao se (ancora_de_desenho_de_objetos == ANCORA_CENTRO)
		{
			x_b = x_botao - largura_botao / 2
			y_b = y_botao - altura_botao / 2
		}
		
		se (centralizar_texto)
		{
			x_t = x_b + largura_botao / 2- g.largura_texto(texto) / 2
			y_t = y_b + altura_botao / 2 - g.altura_texto(texto) / 2
		}
		senao
		{
			x_t = x_b + PADDING_INTERNO_PADRAO_DE_TEXTO_DE_BOTAO
			y_t = y_b + altura_botao / 2 - g.altura_texto(texto)
		}
		
		inteiro cor_sombra = tp.real_para_inteiro(mat.maior_numero(0.0, cor_botao - 0x022222 + 0.0))

		// sombra do botão
		g.definir_cor(cor_sombra)
		g.desenhar_retangulo(x_b, y_b, largura_botao, altura_botao, arredondar_cantos, preencher)

		// fundo do botão
		g.definir_cor(cor_botao)
		g.desenhar_retangulo(x_b + 1, y_b + 1, largura_botao - 4, altura_botao - 4, arredondar_cantos, preencher)

		// bordas pretas do botão
		g.definir_cor(0x000000)
		g.desenhar_retangulo(x_b, y_b, largura_botao, altura_botao, arredondar_cantos, falso)

		// sombra do texto
		g.definir_cor(escolher_cor_sombra(cor_texto, cor_botao))
		g.desenhar_texto(x_t + 1, y_t + 1, texto)

		// texto
		g.definir_cor(cor_texto)
		g.desenhar_texto(x_t, y_t, texto)
	}

	funcao desenhar_fundo()
	{
		g.definir_cor(0xffffff)
		g.desenhar_retangulo(0, 0, largura_janela, altura_janela, falso, verdadeiro)
	}

	funcao desenhar_menu_superior()
	{
		inteiro largura_texto, altura_texto, x, y, largura, altura, cor_botao, cor_texto
		real tamanho_texto = tamanho_texto_botoes_menu

		// definir modos de como os botões serão desenhados
		definir_modo_de_preenchimento(verdadeiro)
		definir_modo_de_ancoramento(ANCORA_NO)
		
		// definir tamanho do texto que aparece no menu superior
		g.definir_tamanho_texto(tamanho_texto_botoes_menu)
		
		// pintar fundo do menu superior
		g.definir_cor(0x5cbafa)
		g.desenhar_retangulo(x_barra_menu_superior, y_barra_menu_superior, largura_barra_menu_superior, altura_barra_menu_superior, falso, verdadeiro)

		
		
		/*  DESENHAR O BOTÃO DE ADICIONAR JOGADOR */
		x = x_botao_adicionar_jogador
		y = y_botao_adicionar_jogador
		largura = largura_botao_adicionar_jogador
		altura = altura_botao_adicionar_jogador
		cor_botao = cor_fundo_botao_adicionar_jogador
		cor_texto = 0x000000
		
		desenhar_botao(x, y, largura, altura, cor_botao, verdadeiro, "Adicionar jogador", tamanho_texto, cor_texto, verdadeiro)
		
		/*
		// pintar fundo do botão
		g.definir_cor(cor_fundo_botao_adicionar_jogador)
		g.desenhar_retangulo(x_botao_adicionar_jogador, y_botao_adicionar_jogador, largura_botao_adicionar_jogador, altura_botao_adicionar_jogador, verdadeiro, verdadeiro)
		// desenhar bordas do botão
		g.definir_cor(0x000000)
		g.desenhar_retangulo(x_botao_adicionar_jogador, y_botao_adicionar_jogador, largura_botao_adicionar_jogador, altura_botao_adicionar_jogador, verdadeiro, falso)
		// desenhar texto do botão
		x = x_botao_adicionar_jogador + largura_botao_adicionar_jogador / 2
		y = y_botao_adicionar_jogador + altura_botao_adicionar_jogador / 2
		g.definir_cor(0x000000)
		desenhar_texto_centralizado(x, y, "Adicionar jogador")
		*/
		
		/*  DESENHAR O BOTÃO DE REMOVER JOGADOR */
		
		x = x_botao_remover_jogador
		y = y_botao_remover_jogador
		largura = largura_botao_remover_jogador
		altura = altura_botao_remover_jogador
		cor_botao = cor_fundo_botao_remover_jogador
		cor_texto = 0x000000
		
		desenhar_botao(x, y, largura, altura, cor_botao, verdadeiro, "Remover jogador", tamanho_texto, cor_texto, verdadeiro)
		
		/*
		// pintar fundo do botão
		g.definir_cor(cor_fundo_botao_remover_jogador)
		g.desenhar_retangulo(x_botao_remover_jogador, y_botao_remover_jogador, largura_botao_remover_jogador, altura_botao_remover_jogador, verdadeiro, verdadeiro)
		// desenhar bordas do botão
		g.definir_cor(0x000000)
		g.desenhar_retangulo(x_botao_remover_jogador, y_botao_remover_jogador, largura_botao_remover_jogador, altura_botao_remover_jogador, verdadeiro, falso)
		// desenhar texto do botão
		x = x_botao_remover_jogador + largura_botao_remover_jogador / 2
		y = y_botao_remover_jogador + altura_botao_remover_jogador / 2
		g.definir_cor(0x000000)
		desenhar_texto_centralizado(x, y, "Remover jogador")
		*/

		/*  DESENHAR O BOTÃO DE SALVAR PARTIDA */
		// pintar fundo do botão
		g.definir_cor(cor_botao_salvar_partida)
		x = x_botao_salvar_partida
		y = y_botao_salvar_partida
		g.desenhar_retangulo(x, y, largura_botao_salvar_partida, altura_botao_salvar_partida, verdadeiro, verdadeiro)

		// pintar fundo mais claro
		g.definir_cor(cor_botao_salvar_partida + 0x333333)
		x += 2
		y += 2
		g.desenhar_retangulo(x_botao_salvar_partida, y_botao_salvar_partida - 3, largura_botao_salvar_partida - 3, altura_botao_salvar_partida, verdadeiro, verdadeiro)
		
		// desenhar texto do botão
		x = x_botao_salvar_partida + largura_botao_salvar_partida / 2
		y = y_botao_salvar_partida + altura_botao_salvar_partida / 2
		g.definir_cor(0x000000)
		desenhar_texto_centralizado(x, y, "FINALIZAR RODADA")
	}
	
	funcao desenhar_tabela_de_jogadores()
	{
		inteiro x, y, padding_esquerda = 10
		/*  DESENHAR FUNDO DA TABELA DE JOGADORES */
		g.definir_cor(cor_fundo_tabela_de_jogadores)
		g.desenhar_retangulo(x_tabela_de_jogadores, y_tabela_de_jogadores, largura_tabela_de_jogadores, altura_tabela_de_jogadores, falso, verdadeiro)

		/*  DESENHAR CABEÇALHO DA TABELA */
		x = x_cabecalho_tabela_de_jogadores
		
		g.definir_cor(cor_fundo_cabecalho_tabela_de_jogadores)
		g.desenhar_retangulo(x, y_cabecalho_tabela_de_jogadores, largura_cabecalho_tabela_de_jogadores, altura_cabecalho_tabela_de_jogadores, falso, verdadeiro)
		y = y_cabecalho_tabela_de_jogadores + (altura_cabecalho_tabela_de_jogadores - g.altura_texto("A")) / 2
		
		se (janela_atual == JANELA_REMOVER_JOGADOR)
			x = x_cabecalho_tabela_de_jogadores + tamanho_check_box_remover_jogador + padding_check_box_remover_jogador
		
		g.definir_cor(0x000000)
		g.desenhar_texto(x + padding_esquerda, y, "Nome")
		g.desenhar_texto(x + padding_esquerda + largura_tabela_de_jogadores / 3, y, "Pontuação")

		se (janela_atual != JANELA_REMOVER_JOGADOR)
			g.desenhar_texto(x + padding_esquerda + 2 * largura_tabela_de_jogadores / 3, y, "Ação")

		/*  DESENHAR NOME E PONTUAÇÃO DOS JOGADORES */
		
		inteiro fim_cabecalho = y_cabecalho_tabela_de_jogadores + altura_cabecalho_tabela_de_jogadores + 5
		inteiro largura, altura
		para (inteiro i = 0; i < numero_de_jogadores; i ++)
		{
			//("Desenhando informações do jogador ", i, "\n")
			g.definir_cor(0x000000)
			g.definir_tamanho_texto(tamanho_texto_tabela_de_jogadores)
		
			cadeia nome_jogador = nome_jogadores[i]
			inteiro largura_texto = g.largura_texto(nome_jogador)
			inteiro altura_texto = g.altura_texto(nome_jogador)

			// pintar fundo da linha da tabela
			x = x_cabecalho_tabela_de_jogadores + padding_esquerda / 2
			inteiro x_linha = x
			y = fim_cabecalho + altura_linha_tabela_de_jogadores * i
			largura = largura_linha_tabela_de_jogadores - padding_esquerda
			altura = altura_linha_tabela_de_jogadores - 5
			g.definir_cor(cor_fundo_linha_tabela_de_jogadores)
			g.desenhar_retangulo(x, y, largura, altura, verdadeiro, verdadeiro)

			// desenhar nome do jogador i
			se (janela_atual == JANELA_REMOVER_JOGADOR)
				x = x_cabecalho_tabela_de_jogadores + padding_esquerda / 2 + tamanho_check_box_remover_jogador + padding_check_box_remover_jogador
			
			g.definir_cor(0x000000)
			x += padding_esquerda / 2
			y += altura_linha_tabela_de_jogadores / 2
			desenhar_texto_a_esquerda(x, y, nome_jogador)

			// desenhar pontuacao do jogador i
			x += largura_linha_tabela_de_jogadores / 3
			g.definir_cor(0x000000) // fundo do visor de pontuação
			g.desenhar_retangulo(x - 10, y - altura_linha_tabela_de_jogadores / 2 + 5, 150, altura_linha_tabela_de_jogadores - 15, verdadeiro, verdadeiro)
			g.definir_cor(0xffffff) // valor da pontuação do jogador
			desenhar_texto_a_esquerda(x, y, pontuacao_jogadores[i] + "")

			
			inteiro x_inicial = x + largura_linha_tabela_de_jogadores / 3
			inteiro y_inicial = y
			se (janela_atual != JANELA_REMOVER_JOGADOR)
			{
				/*  DESENHAR BOTÕES DE ADICIONAR OU REMOVER PONTUAÇÃO */
				
				para (inteiro j = 0; j < NUMERO_DE_BOTOES_DE_PONTUACAO_TABELA_DE_JOGADORES; j ++)
				{
					x = x_inicial + (tamanho_botoes_de_pontuacao_tabela_de_jogadores + padding_botoes_de_pontuacao_tabela_de_jogadores) * j
					
					// pintar fundo do botão
					se (acao_botoes_de_pontuacao_tabela_de_jogadores[j] < 0)
						g.definir_cor(cor_botoes_de_pontuacao_negativa_tabela_de_jogadores)
					senao
						g.definir_cor(cor_botoes_de_pontuacao_positiva_tabela_de_jogadores)
					
					y = y_inicial - (tamanho_botoes_de_pontuacao_tabela_de_jogadores / 2 + padding_botoes_de_pontuacao_tabela_de_jogadores / 2)
					g.desenhar_retangulo(x, y - 1, tamanho_botoes_de_pontuacao_tabela_de_jogadores, tamanho_botoes_de_pontuacao_tabela_de_jogadores, verdadeiro, verdadeiro)
	
					// pintar bordas do botão
					g.definir_cor(0x000000)
					y = y_inicial - (tamanho_botoes_de_pontuacao_tabela_de_jogadores / 2 + padding_botoes_de_pontuacao_tabela_de_jogadores / 2)
					g.desenhar_retangulo(x, y - 1, tamanho_botoes_de_pontuacao_tabela_de_jogadores, tamanho_botoes_de_pontuacao_tabela_de_jogadores, verdadeiro, falso)
					
					// atualizar as coordenadas do botão
					x_botoes_de_pontuacao_tabela_de_jogadores_de_cada_jogador[i][j] = x
					y_botoes_de_pontuacao_tabela_de_jogadores_de_cada_jogador[i][j] = y
					
					// desenhar texto do botão de pontuação
					g.definir_cor(0x000000)
					g.definir_tamanho_texto(tamanho_texto_botoes_de_pontuacao_tabela_de_jogadores)
					inteiro x_aux = x + tamanho_botoes_de_pontuacao_tabela_de_jogadores / 2
					inteiro y_aux = y + tamanho_botoes_de_pontuacao_tabela_de_jogadores / 2
					desenhar_texto_centralizado(x_aux, y_aux, texto_botoes_de_pontuacao_tabela_de_jogadores[j])
				}
			}

			se (janela_atual == JANELA_REMOVER_JOGADOR)
			{
				/*  DESENHAR OS CHECK-BOXES */
				
				inteiro x_aux = x_linha + padding_check_box_remover_jogador / 2
				inteiro y_aux = y - tamanho_check_box_remover_jogador / 2 - padding_check_box_remover_jogador / 3
				// pintar fundo
				g.definir_cor(0xffffff)
				se (falso e jogadores_para_remover[i])
					g.definir_cor(0xff2222)
				g.desenhar_retangulo(x_aux, y_aux, tamanho_check_box_remover_jogador, tamanho_check_box_remover_jogador, verdadeiro, verdadeiro)
		
				// desenhar bordas
				g.definir_cor(0x3388aa)
				g.desenhar_retangulo(x_aux, y_aux, tamanho_check_box_remover_jogador, tamanho_check_box_remover_jogador, verdadeiro, falso)

				// desenhar se o check box está marcado
				se (jogadores_para_remover[i])
				{
					inteiro t = 3 * tamanho_check_box_remover_jogador / 4
					g.definir_cor(0xff2222)
					g.desenhar_elipse(x_aux + t / 6, y_aux + t / 6, t, t, verdadeiro)
				}

				// atualizar as coordenadas do check box do jogador
				x_check_boxes[i] = x_aux
				y_check_boxes[i] = y_aux
			}
		}
	}

	// encerra o modo gráfico e finaliza o programa
	funcao finalizar()
	{
		g.encerrar_modo_grafico()
	}

	funcao desenhar_interface_remover_jogador()
	{
		/*  DESENHAR OS BOTÕES DE CANCELAR E CONFIRMAR */

		inteiro x_botao_cancelar = x_botao_cancelar_janela_remover_jogador
		inteiro x_botao_confirmar = x_botao_confirmar_janela_remover_jogador
		inteiro y_botoes = y_botoes_janela_remover_jogador
		
		// desenha o fundo do botão de cancelar
		g.definir_cor(cor_botao_cancelar)
		g.desenhar_retangulo(x_botao_cancelar, y_botoes, largura_botoes_janela_remover_jogador, altura_botoes_janela_remover_jogador, verdadeiro, verdadeiro)

		// desenhar o texto do botão
		g.definir_cor(0x000000)
		desenhar_texto_centralizado(x_botao_cancelar + largura_botoes_janela_remover_jogador / 2, y_botoes + altura_botoes_janela_remover_jogador / 2, "Cancelar")
		
		// desenha o fundo do botão de confirmar
		se (nome_novo_jogador_eh_valido)
			g.definir_cor(cor_botao_confirmar_ativado)
		senao
			g.definir_cor(cor_botao_confirmar_desativado)
			
		g.desenhar_retangulo(x_botao_confirmar, y_botoes, largura_botoes_janela_remover_jogador, altura_botoes_janela_remover_jogador, verdadeiro, verdadeiro)

		// desenhar o texto do botão
		g.definir_cor(0x000000)
		desenhar_texto_centralizado(x_botao_confirmar + largura_botoes_janela_remover_jogador / 2, y_botoes + altura_botoes_janela_remover_jogador / 2, "Confirmar")
	}

	funcao desenhar_janela_de_adicionar_jogador()
	{
		inteiro cor_fundo_janela_adicionar_jogador = 0xffffff
		inteiro cor_bordas_janela_adicionar_jogador = 0x000000
		inteiro x = x_janela_adicionar_jogador
		inteiro y = y_janela_adicionar_jogador
		inteiro grossura_bordas = 2
		inteiro padding = padding_janela_adicionar_jogador
		inteiro largura_botoes = largura_botoes_janela_adicionar_jogador
		inteiro altura_botoes = altura_botoes_janela_adicionar_jogador

		/*  DESENHAR A SUBJANELA */
		// desenha a borda da subjanela
		g.definir_cor(cor_bordas_janela_adicionar_jogador)
		g.desenhar_retangulo(x, y, largura_janela_adicionar_jogador, altura_janela_adicionar_jogador, falso, verdadeiro)

		// pinta o fundo da subjanela
		g.definir_cor(cor_fundo_janela_adicionar_jogador)
		g.desenhar_retangulo(x + grossura_bordas, y + grossura_bordas, largura_janela_adicionar_jogador - 2 * grossura_bordas, altura_janela_adicionar_jogador - 2 * grossura_bordas, falso, verdadeiro)

		/*  DESENHAR OS BOTﾃ髭S DE CANCELAR E CONFIRMAR */

		inteiro x_botao_cancelar = x_botao_cancelar_janela_adicionar_jogador
		inteiro x_botao_confirmar = x_botao_confirmar_janela_adicionar_jogador
		inteiro y_botoes = y_botoes_janela_adicionar_jogador
		
		// desenha o fundo do botão de cancelar
		g.definir_cor(cor_botao_cancelar)
		g.desenhar_retangulo(x_botao_cancelar, y_botoes, largura_botoes, altura_botoes, verdadeiro, verdadeiro)

		// desenhar o texto do botão
		g.definir_cor(0x000000)
		desenhar_texto_centralizado(x_botao_cancelar + largura_botoes / 2, y_botoes + altura_botoes / 2, "Cancelar")
		
		// desenha o fundo do botão de confirmar
		se (nome_novo_jogador_eh_valido)
			g.definir_cor(cor_botao_confirmar_ativado)
		senao
			g.definir_cor(cor_botao_confirmar_desativado)
			
		g.desenhar_retangulo(x_botao_confirmar, y_botoes, largura_botoes, altura_botoes, verdadeiro, verdadeiro)

		// desenhar o texto do botão
		g.definir_cor(0x000000)
		desenhar_texto_centralizado(x_botao_confirmar + largura_botoes / 2, y_botoes + altura_botoes / 2, "Confirmar")
		
		/*  DESENHAR TEXTO INSTRUTIVO */
		g.definir_cor(0x000000)
		desenhar_texto_centralizado(x + largura_janela_adicionar_jogador / 2, y + 30, "Escreva o nome:")
		
		/*  DESENHAR A CAIXA DE ENTRADA DO NOME */

		inteiro x_input = x_caixa_de_texto_janela_adicionar_jogador
		inteiro y_input = y_caixa_de_texto_janela_adicionar_jogador
		
		// fundo
		g.definir_cor(0xffffff)
		g.desenhar_retangulo(x_input, y_input, largura_caixa_de_texto_janela_adicionar_jogador, altura_caixa_de_texto_janela_adicionar_jogador, falso, verdadeiro)
		
		// bordas
		g.definir_cor(0x000000)
		g.desenhar_retangulo(x_input, y_input, largura_caixa_de_texto_janela_adicionar_jogador, altura_caixa_de_texto_janela_adicionar_jogador, falso, falso)

		// desenhar o nome escrito
		flicker_ponteiro_de_texto()
		
		g.definir_cor(0x000000)
		desenhar_texto_a_esquerda(x_input + padding, y_input + altura_caixa_de_texto_janela_adicionar_jogador / 2, nome_novo_jogador)

		/*  DESENHAR MENSAGEM DE NOME INV�ｾδｴIDO */
		se (deve_mostrar_mensagem_de_nome_invalido)
		{
			g.definir_cor(cor_mensagem_de_nome_invalido)
			desenhar_texto_centralizado(x_mensagem_de_nome_invalido, y_mensagem_de_nome_invalido, "Nome de jogador inválido")
			
			inteiro tempo_atual = u.tempo_decorrido()
			se (tempo_atual - tempo_atual_mensagem_de_nome_invalido >= intervalo_para_mensagem_de_nome_invalido)
			{
				deve_mostrar_mensagem_de_nome_invalido = falso
			}
		}
		
	}

	funcao flicker_ponteiro_de_texto()
	{
		inteiro tempo_atual = u.tempo_decorrido()

		se (tempo_atual - tempo_atual_flicker >= intervalo_para_flick_do_ponteiro_de_texto)
		{
			tempo_atual_flicker = tempo_atual
			ponteiro_de_texto_esta_ativo = nao ponteiro_de_texto_esta_ativo

			se (ponteiro_de_texto_esta_ativo)
			{
				nome_novo_jogador += "_"
				//escreva("Flicker ativado\n")
			}
			senao
			{
				nome_novo_jogador = txt.extrair_subtexto(nome_novo_jogador, 0, txt.numero_caracteres(nome_novo_jogador) - 1)
				//escreva("Flicker desativado\n")
			}
		}
	}
	
	funcao desenhar_texto_centralizado(inteiro x, inteiro y, cadeia texto)
	{
		inteiro largura_texto = g.largura_texto(texto)
		inteiro altura_texto = g.altura_texto(texto)
		x = x - largura_texto / 2
		y = y - altura_texto / 2
		g.desenhar_texto(x, y, texto)
	}

	funcao desenhar_texto_a_esquerda(inteiro x, inteiro y, cadeia texto)
	{
		inteiro altura_texto = g.altura_texto(texto)
		y = y - altura_texto / 2
		g.desenhar_texto(x, y, texto)
	}

	/*****/

	funcao capturar_cliques_do_mouse()
	{
		se (m.botao_pressionado(m.BOTAO_ESQUERDO))
		{
			enquanto(m.algum_botao_pressionado()){}
			
			inteiro mx = m.posicao_x()
			inteiro my = m.posicao_y()

			se (janela_atual == JANELA_TABELA)
			{
				tratar_botao_pontuacao_para_jogador(mx, my)
				tratar_botao_adicionar_jogador(mx, my)
				tratar_botao_remover_jogador(mx, my)
			}
			senao se (janela_atual == JANELA_ADICIONAR_JOGADOR)
			{
				tratar_botoes_janela_adicionar_jogador(mx, my)
			}
			senao se (janela_atual == JANELA_REMOVER_JOGADOR)
			{
				tratar_botoes_janela_remover_jogador(mx, my)
			}
		}
	}

	/// CHECA E TRATA O CASO ONDE O CLIQUE DO MOUSE FOI EM ALGUM BOTÃO DE PONTUA�ｾ�ｿｽ�ｾ�繧ｰ
	funcao tratar_botao_pontuacao_para_jogador(inteiro mx, inteiro my)
	{
		escreva("[Pontuação] Posição x: ", mx, " | Posição y: ", my, "\n")
		
		logico algum_botao_pressionado = falso
		para (inteiro i = 0; i < numero_de_jogadores; i ++)
		{
			para (inteiro j = 0; j < NUMERO_DE_BOTOES_DE_PONTUACAO_TABELA_DE_JOGADORES; j ++)
			{
				inteiro x = x_botoes_de_pontuacao_tabela_de_jogadores_de_cada_jogador[i][j]
				inteiro y = y_botoes_de_pontuacao_tabela_de_jogadores_de_cada_jogador[i][j]
				
				se ((x < mx e mx < x + tamanho_botoes_de_pontuacao_tabela_de_jogadores) e (y < my e my < y + tamanho_botoes_de_pontuacao_tabela_de_jogadores))
				{
					pontuacao_jogadores[i] += acao_botoes_de_pontuacao_tabela_de_jogadores[j]

					algum_botao_pressionado = verdadeiro
					escreva("Botão de ", texto_botoes_de_pontuacao_tabela_de_jogadores[j], " pressionado\n")
				}
			}
		}

		se (nao algum_botao_pressionado)
		{
			escreva("Nenhum botão de pontuação foi pressionado\n")
		}
	}

	/// CHECA E TRATA O CASO ONDE O CLIQUE DO MOUSE FOI NO BOTÃO DE ADICIONAR JOGADOR
	funcao tratar_botao_adicionar_jogador(inteiro mx, inteiro my)
	{
		escreva("[Adicionar Jogador] Posição x: ", mx, " | Posição y: ", my, "\n")
		
		inteiro x = x_botao_adicionar_jogador
		inteiro y = y_botao_adicionar_jogador
		
		logico foi_pressionado = falso

		se ((x < mx e mx < x + largura_botao_adicionar_jogador) e (y < my e my < y + altura_botao_adicionar_jogador))
		{
			foi_pressionado = verdadeiro

			se (numero_de_jogadores < MAXIMO_DE_JOGADORES)
				janela_atual = JANELA_ADICIONAR_JOGADOR
			senao
				escreva("Mﾃ々IMO DE JOGADORES ATINGIDO.\n")
		}

		se (nao foi_pressionado)
		{
			escreva("Botão de adicionar jogador não foi pressionado\n")
		}
	}

	funcao tratar_botoes_janela_adicionar_jogador(inteiro mx, inteiro my)
	{
		escreva("Posição x: ", mx, " | Posição y: ", my, "\n")
		
		inteiro y1 = y_botoes_janela_adicionar_jogador
		inteiro y2 = y_botoes_janela_adicionar_jogador + altura_botoes_janela_adicionar_jogador
		
		// botão cancelar
		inteiro x1 = x_botao_cancelar_janela_adicionar_jogador
		inteiro x2 = x_botao_cancelar_janela_adicionar_jogador + largura_botoes_janela_adicionar_jogador
		
		se ((x1 < mx e mx < x2) e (y1 < my e my < y2))
		{
			escreva("Botão cancelar pressionado\n")
			cancelar_adicao_de_novo_jogador()
			retorne
		}

		// botao confirmar
		x1 = x_botao_confirmar_janela_adicionar_jogador
		x2 = x_botao_confirmar_janela_adicionar_jogador + largura_botoes_janela_adicionar_jogador
		
		se ((x1 < mx e mx < x2) e (y1 < my e my < y2))
		{
			escreva("Botão confirmar pressionado\n")
			confirmar_adicao_de_novo_jogador()
			retorne
		}

		escreva("Nenhum dos botões foi pressionado\n")
	}

	funcao capturar_entrada_de_texto()
	{
		se (nao t.alguma_tecla_pressionada())
			retorne
		
		inteiro tecla = t.ler_tecla()
		
		se (t.TECLA_A <= tecla e tecla <= t.TECLA_Z ou tecla == t.TECLA_BACKSPACE ou tecla == t.TECLA_ESPACO ou tecla == t.TECLA_ESC)
		{
			se (tecla == t.TECLA_ESC)
			{
				cancelar_adicao_de_novo_jogador()
				retorne
			}

			se (ponteiro_de_texto_esta_ativo)
			{
				se (tecla == t.TECLA_BACKSPACE)
				{
					se (nome_novo_jogador != "_")
						nome_novo_jogador = txt.extrair_subtexto(nome_novo_jogador, 0, txt.numero_caracteres(nome_novo_jogador) - 2) + "_"
				}
				senao se (g.largura_texto(nome_novo_jogador + "W") < largura_caixa_de_texto_janela_adicionar_jogador)
					nome_novo_jogador = txt.extrair_subtexto(nome_novo_jogador, 0, txt.numero_caracteres(nome_novo_jogador) - 1) + t.caracter_tecla(tecla) + "_"
			}
			senao
			{
				se (tecla == t.TECLA_BACKSPACE)
				{
					se (nome_novo_jogador != "")
						nome_novo_jogador = txt.extrair_subtexto(nome_novo_jogador, 0, txt.numero_caracteres(nome_novo_jogador) - 1)
				}
				senao se (g.largura_texto(nome_novo_jogador + "WW") < largura_caixa_de_texto_janela_adicionar_jogador)
					nome_novo_jogador += t.caracter_tecla(tecla)
			}
		}
	}
	
	funcao cancelar_adicao_de_novo_jogador()
	{
		nome_novo_jogador = ""
		ponteiro_de_texto_esta_ativo = falso
		janela_atual = JANELA_TABELA
	}

	funcao confirmar_adicao_de_novo_jogador()
	{
		se (validar_nome_novo_jogador())
		{
			escreva("O nome \"", nome_novo_jogador, "\" ﾃｩ válido\n")
			escreva("Inserindo o jogador no �ｾ�ｽｭndice ", numero_de_jogadores, "\n")
			nome_novo_jogador = txt.substituir(nome_novo_jogador, "_", "")
			nome_jogadores[numero_de_jogadores] = nome_novo_jogador
			pontuacao_jogadores[numero_de_jogadores] = 0
			numero_de_jogadores ++
			escreva("Total de jogadores agora: ", numero_de_jogadores, "\n")

			cancelar_adicao_de_novo_jogador()
		}
		senao
		{
			// escreve uma mensagem dizendo que o nome ﾃｩ inválido
			deve_mostrar_mensagem_de_nome_invalido = verdadeiro
			tempo_atual_mensagem_de_nome_invalido = u.tempo_decorrido()
			escreva("O nome \"", nome_novo_jogador, "\" ﾃｩ inválido\n")
		}
	}

	funcao logico validar_nome_novo_jogador()
	{
		se (ponteiro_de_texto_esta_ativo)
			retorne nome_novo_jogador != "_"
		
		retorne nome_novo_jogador != ""
	}

	
	/// CHECA E TRATA O CASO ONDE O CLIQUE DO MOUSE FOI NO BOTÃO DE REMOVER JOGADOR
	funcao tratar_botao_remover_jogador(inteiro mx, inteiro my)
	{
		inteiro x = x_botao_remover_jogador
		inteiro y = y_botao_remover_jogador
		
		logico foi_pressionado = falso

		se ((x < mx e mx < x + largura_botao_remover_jogador) e (y < my e my < y + altura_botao_remover_jogador))
		{
			foi_pressionado = verdadeiro
			
			para (inteiro i = 0; i < MAXIMO_DE_JOGADORES; i ++)
			{
				jogadores_para_remover[i] = falso
			}
			
			se (numero_de_jogadores > 0)
				janela_atual = JANELA_REMOVER_JOGADOR
			senao
				escreva("NÃO HÁ JOGADORES PARA REMOVER.\n")
		}

		se (nao foi_pressionado)
			escreva("botão de remover jogador não foi pressionado\n")
		senao
			escreva("botão de remover jogador foi pressionado\n")
	}

	
	funcao tratar_botoes_janela_remover_jogador(inteiro mx, inteiro my)
	{
		escreva("[Remover Jogador] Posição x: ", mx, " | Posição y: ", my, "\n")

		conferir_check_boxes_marcados(mx, my)
		
		inteiro y1 = y_botoes_janela_remover_jogador
		inteiro y2 = y_botoes_janela_remover_jogador + altura_botoes_janela_remover_jogador
		
		// botão cancelar
		inteiro x1 = x_botao_cancelar_janela_remover_jogador
		inteiro x2 = x_botao_cancelar_janela_remover_jogador + largura_botoes_janela_remover_jogador
		
		se ((x1 < mx e mx < x2) e (y1 < my e my < y2))
		{
			escreva("botão cancelar pressionado\n")
			janela_atual = JANELA_TABELA
			retorne
		}

		// botao confirmar
		x1 = x_botao_confirmar_janela_adicionar_jogador
		x2 = x_botao_confirmar_janela_adicionar_jogador + largura_botoes_janela_adicionar_jogador
		
		se ((x1 < mx e mx < x2) e (y1 < my e my < y2))
		{
			escreva("botão confirmar pressionado\n")
			confirmar_remocao_de_jogadores()
			retorne
		}

		escreva("Nenhum dos botões foi pressionado\n")
	}

	funcao conferir_check_boxes_marcados(inteiro mx, inteiro my)
	{
		logico check_box_foi_marcado = falso
		para (inteiro i = 0; i < numero_de_jogadores; i ++)
		{
			inteiro x = x_check_boxes[i]
			inteiro y = y_check_boxes[i]

			//inteiro t = tamanho_check_box_remover_jogador
			//escreva("Check box ", i, ": ", x, " < ", mx, " < ", x + t, " e ", y, " < ", my, " < ", y + t, "\n")
			se ((x < mx e mx < x + tamanho_check_box_remover_jogador) e (y < my e my < y + tamanho_check_box_remover_jogador))
			{
				jogadores_para_remover[i] = nao jogadores_para_remover[i]

				se (jogadores_para_remover[i])
					escreva("O jogador \"", nome_jogadores[i], "\" foi marcado\n")
				senao
					escreva("O jogador \"", nome_jogadores[i], "\" foi desmarcado\n")

				check_box_foi_marcado = verdadeiro
			}
		}

		se (nao check_box_foi_marcado)
		{
			escreva("Nenhum check box marcado\n")
		}
	}

	funcao confirmar_remocao_de_jogadores()
	{
		inteiro j = 0
		
		para (inteiro i = 0; i < numero_de_jogadores; i ++)
		{
			escreva("Jogador[", i, "] está marcado para remoção = ", jogadores_para_remover[i], "\n")
			se (nao jogadores_para_remover[i])
			{
				copiar_informacoes_de_jogadores(i, j)
				j ++
			}
		}

		numero_de_jogadores = j
		janela_atual = JANELA_TABELA
	}

	// COPIA TODAS AS INFORMAÇÕES DO JOGADOR FONTE PARA O JOGADOR DESTINO
	funcao copiar_informacoes_de_jogadores(inteiro indice_fonte, inteiro indice_destino)
	{
		inteiro i = indice_fonte, j = indice_destino

		nome_jogadores[j] = nome_jogadores[i]
		pontuacao_jogadores[j] = pontuacao_jogadores[i]
		x_check_boxes[j] = x_check_boxes[i]
		y_check_boxes[j] = y_check_boxes[i]

		para (inteiro k = 0; k < NUMERO_DE_BOTOES_DE_PONTUACAO_TABELA_DE_JOGADORES; k ++)
		{
			x_botoes_de_pontuacao_tabela_de_jogadores_de_cada_jogador[j][k] = x_botoes_de_pontuacao_tabela_de_jogadores_de_cada_jogador[i][k]
			y_botoes_de_pontuacao_tabela_de_jogadores_de_cada_jogador[j][k] = y_botoes_de_pontuacao_tabela_de_jogadores_de_cada_jogador[i][k]
		}
	}

}
