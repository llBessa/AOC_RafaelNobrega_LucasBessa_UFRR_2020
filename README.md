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

