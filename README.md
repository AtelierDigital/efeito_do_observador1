# Efeito do Observador 1

Processing. Instalacao visual com LEAP Motion e webcam.

![](https://raw.githubusercontent.com/AtelierDigital/efeito_do_observador1/master/example_ju_hoffmann.png)  
*imagem: artista Juliana Hoffmann realiza experimentacoes*

Ao iniciar a aplicacao, uma quantidade de particulas é lancada do centro da tela, radialmente para fora. As particulas se movimentam em linha e reta e performam wrap-around (quando saem da tela de um lado, reaparecem do outro). 

O video so é atualizado onde ha particulas. Ou, dito de outra forma, cada particula é desenhada com a cor que o video teria naquele pixel e instante. Isso resulta em interessantes texturas desde o comeco ate a situacao de equilibrio onde ha particulas preenchendo a tela uniformemenete.

Registro na exposicao Experimental #1, no O Sitio Arte Educacao Coworking: ![https://www.facebook.com/ositiofloripa/videos/290319741758201/](https://raw.githubusercontent.com/AtelierDigital/efeito_do_observador1/master/experimental1.png)  
*imagem: artista Osmar Domingues experimenta a instalacao*

As posicoes das duas maos do usuario, mapeadas na tela, definem areas circulares (com o raio de cada circulo sendo funcao da distancia vertical da mao correspondente ao LEAP) dentro das quais as particulas sao maiores. Assim, cobrem maior superficie, levando a uma atualizacao mais rapida do video na regiao (ja que o video so e atualizado onde ha particulas), às custas de uma perda de definicao nessa regiao, ja que as particulas estao grandes. Esse compromisso é o nosso *efeito do observador*.

![](https://raw.githubusercontent.com/AtelierDigital/efeito_do_observador1/master/example_tiago_brizolara.png)  
*imagem: teste pelo autor, Tiago Brizolara*

Based upon code of Daniel Shifman (see reference in efeito_do_observador1.pde)
