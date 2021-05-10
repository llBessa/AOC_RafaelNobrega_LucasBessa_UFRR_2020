# Projeto de Desenvolvimento de processador MIPS de 8 bits

![Capa_Process2](E:\Nova pasta\Capa_Process2.png)

## Autores do Projeto 🤝

* [**Rafael Nóbrega de Lima**](https://https://github.com/KylixXD)
* [**Lucas Bessa Façanha Pereira**](https://github.com/llBessa) 
---
## Sobre 📚
Projeto de conclusão de semestre referente a matéria de **Arquitetura e Organização de Computadores**, ofertada no 3° Semestre do curso de **Ciências da Computação**, ministrada por Hebert Oliveira, na **Universidade Federal de Roraima - UFRR**.

O objetivo é desenvolver um processador MIPS de 8 bits, levando em conta as limitações existentes pela pequena quantidade de bits dentre outros.

A organização dos diretórios é a seguinte e cada um possui as seguintes informações:
* **COMPONENTS** : diretórios contendo os arquivos de extensão `.vhd` utilizados para desenvolvimento do processador;
* **DATAPATH** : diretório contendo arquivo visual da organização dos componentes;
* **RELATÓRIO**: contém arquivo explicando o funcionamento e resultado de testes do projeto.

---
## Ferramentas Utilizadas 🛠
### Intel Quartus
<p align='center'>
<img src="https://www.jackenhack.com/wp-content/uploads/2020/01/Quartus_prime_icon.png">
</p>

> **Intel Quartus Prime** é um software de design de dispositivo lógico programável produzido pela Intel; antes da aquisição da Altera pela Intel, a ferramenta era chamada Altera Quartus Prime, anteriormente Altera Quartus II. (fonte: [Wikipedia](https://en.wikipedia.org/wiki/Intel_Quartus_Prime))

### Visual Studio Code

![File, type, vscode Free Icon of vscode](data:image/png;base64,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)

> O **Visual Studio Code** é um editor de código-fonte desenvolvido pela Microsoft para Windows, Linux e macOS. Ele inclui suporte para depuração, controle Git incorporado, realce de sintaxe, complementação inteligente de código, *snippets* e refatoração de código.(fonte:[Wikipedia](https://pt.wikipedia.org/wiki/Visual_Studio_Code))

### Draw.io

![Free Video Tutorial: draw.io - Apple Mac, iPad & iPhone Tutorials from  ScreenCastsOnline](https://screencastsonline.com/site/show/icons-new/180/SCOM0897-180.png)

>O **Draw.io** é um editor gráfico online no qual é possível desenvolver desenhos, gráficos e outros sem a necessidade de usar um software caro e pesado. Ele disponibiliza recursos para criação de qualquer tipo de desenho porém, possui uma parte dedicada à arquitetura da informação.(fonte:[TechTudo](https://www.techtudo.com.br/tudo-sobre/drawio.html))



---
## Fontes Bibliográficas 📚

<p>
<img align="left" width="200" height="270" src="https://images-na.ssl-images-amazon.com/images/I/8118crB0kyL.jpg"><br>
<b> Livro</b>: <i>Organização e Projeto de Computadores - 4° Edição</i> <br>
<b> Autor</b>: <b>David A. Patterson/John L.Hennessy</b> <br>
 <b>Disponível em</b>: <a href="https://www.amazon.com.br/Organiza%C3%A7%C3%A3o-Projeto-Computadores-David-Patterson/dp/853523585X">Link</a>
</p>
.
