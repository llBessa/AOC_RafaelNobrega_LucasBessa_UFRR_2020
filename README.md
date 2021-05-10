# Projeto de Desenvolvimento de processador MIPS de 8 bits

![LogoProcessador](https://github.com/KylixXD/AOC_RafaelNobrega_LucasBessa_UFRR_2020/blob/main/LogoProcessador.png?raw=true)

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

![File, type, vscode Free Icon of vscode](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAwFBMVEX///8ptvYCiNECd70IsfXU8P0ctPaF0fkAdLoquPceoOMepukAgs8AhdAAhtAAcrsAbbkAf84Aa7gAi9IAer/H6vzs+P74/f/W5/OXwN+m3fvo9PvW6vfd7vhxqtXc8/9eoNBdxfhOwPe65fyd2vq41Ol4zflZxPi04vsuiMVyy/ijx+PL4fBBkclztOGx1e6BvOQ8ndmrzOVBn9lUp9wgg8J/sdibwuCJwucXkNR6rtZlo9GMutyOxehkrt8rh8WR1ACvAAAJD0lEQVR4nO2de1/iOBSGQ8tWWFtShAUdRtdxhplRERXvMzr7/b/VttwsNLdzQtrEX97/hT7mpedtkpMS4uXl5eXl5eXl5eXl5eXl5eWF1vi0H54/Htd9GeZ0ckDDsEXT6b91X4kZDU/TcCG6f/FX3VdjQMMrugQMWw9R88s/dV/QrjU4XwNmajai5tnXuq9ppzp+KAK29huNnPHnsO7r2pkO+0XAsPV3u5Gr2f42qPvSdqNJ2ApZhNlANvY+AuOYbgIWCDPGaG9U9wXqapaGIZ8wZ/zudoE8KgFuEeY3nQuHi8drGbBEmDP+cLV4nDAAGYTOFo/3pCYlzBnbn1xjLCQ1BUIHC+TonA3IJ8wGsu1Q8dhMaoqE8wLpSPGY9HmAYsKc0Ymnq3GrxQOUEeY3HfufrkpJDUS4KJBW31gvmVUCQDgvkBYXD1aQgRJmap7Z6tVHMaAyYXbP+VQ3C1O/JYDqhNkwWog4vJIBQggbTeuMOuAkNSxho21ZjhtxgwyWMNqrm2lDx/wggyVsRDYN4iRUAYQSWnSzEQYZPOGXurnWmikNIJiw0agbbKUnaZVAEjYt+SFKkpoOoR3Pi8wppx0RWvG0yJ5y+jiEvCmnD0M44E05fRRC/pTTByE8VEpqDhNOBFNOH4JQNak5S3gJdahrhIzFwY9FKJtycp7wN8aiVRGOxs/Tm8vPOnzDUyRgFYSjaS+OkyRO7sZ4QFhSq5bwuhd3grmSeIqcOecuDlpAOLxZ8eWKb1FWPYQmtQoJB/dxUFTSu4YDChYHaycc3W4CBkEH7tRxCA8yBVGThJ9fkqAkqFNniKRWBDz/AQGEEU6CThkQ6tQnHYeGYXo63ItMEV53mIAwp75qAbboESHGCK9jDmDu1DvFPfS/tADpw4SYI3wTACo7FZvUFkpP57tlDBGKRnDh1BvpZ2gEmTB36OviY8wQDntCPiWnqiwO8rVwqDnCp+06yHSqMKeO/tMBXDrUHOGt2KNLpyYCp+oltZVDjREOFYYwR4zveDvntJIa7RfdYYRw1FUizJz6wnaqVlJLrzb+b/UScpyqk9Ra6evmh9Xp0oVT70tOPdqZQ40Rqt1p1k6dbP7xowbglkPNEb6pD2Lu1Lfi357oAD6Wr8UM4YCXunlOXa8t46ecMoeGrPuWqdSmfK/ZdKpOUqNXzJRkKnnfwBCXTh1pAKa/2Fdi7OnpDYiYOxW8OFgYwBYvA5p7Ar7sQn6LuVNnGoDn3BxvjlD6BFUexj4WMD3hzxoYJCSTBIaYQeIGkM4EV2GSkHzuQREDxDAKHGqckByz5hN3jChyqHlCMoIjwpxKU5FDKyAkw9K0904R6YN01s40IRnegxHVnZr+ls+8GickZAqr/erD2EovFb6+AkJoglMdRgWHVkUITXBqiOmp2tpAJYTZowa4MAaJ2KEHT4rfXQ0hOMHlEv0Yaf9Q9asrIkQkuEDgVFWHVkmYJThw7ecNY+vgCPDFlRFi4k0mlkNDZYdWS0gG8HgTMJyaXsF2AlRISIZ3GMQtpx68yr+oNkJCEAluE5FSkEOrJ8QkuKDgVKhDayBEJbj1MIIdWgdhluAQhXF+T6V0Iv94CwizeIMhDPr0Ctd0VT0hbFHjXS/Ir6uecEb7KMLk1pExfDoIQyRi4sTv8PVgfldE3W063Wf7Cdedg6hRDLp3ttfDQucgahQzp4J3GVeaSzfWznCIne6b/IvqItzuHMQhgp1a4fNhae0MiZgEIKdWRsjqHMRVDaBTK5unYXYOIhGD7r118zTjlL3LCYuY9JSdWg1h+VhRXcROV2VGvzLCowMeIB4x6P6xZ877UQCIv6UG8YuSUysglJ7xgEXsxFasPals48IiKjnV+Bqw0i4nNGL8UvcasOp+dDRiJ5Z1bhjei6G8XRsz479A7Ep6jIwSQs54QFeNIL6tbT/NBLRdG4+YJCKnGiQcQxvoEauoCwmdanBvIhCQPsxQ629zCZxqjBBwWNUC8HSA2SS2Et+ppgiBZzzMeyHzJUaNeyqnx8gQ4UwcRUsDuOo0wy0xLsRxqqG9+rCel9yhS2E2ia2UBNXt1Qd1vWx0mhEyxSMy+zbNEJ4DxvC9F3KpG3TVyPs2q+mZGQJuM7TcxyPuIRar3LdppndN+T6z5dClZpjtRUt14q3FjXoJy51mC12zDytQ05ZTzbhU8UbDcOhSE/ge+HclveIv28ydRumxt0UZnWYrMc/UUNWGUw31cisQ8hy6FG6T2EqFvk1D/fh9abngdJq9SyPBBcW+TUOpTfbkJHTo6t+kEW8KfZumkrf4+DiJQ1f6o4W4dKqxpyfRYc1Sh650o4MYxC8mzzYRHOPYor+UV46eNeLN0qkGZzE45yLQvqyPp6hLPcT4j8EzhjhnWyg7dKlrjQQX5A+NBs+JYp0kB3HoUmOdBJeVjX2ThGSwdTA1zKFLTTB74NfqmCXMD0hoFR0K3uGbS2OCqgJCMlvfbyiV9EJypZPgzBOS0Uk/pZSm9Erj7Ev8BFUFhPn5pa8nj5cog64R0QmuEsKdCJvg3CHEJjiHCJETVC4R4hKcU4SoBOcWIZmATvZxkRDRxegaITzBOUcI7mJ0jxCa4BwkBMYbJwlBXYxuEpJndUQooR3v7CLkSbmLEUpoyXvXAIc0AAmteXceIWPFBAcjtOj9h9wj3zUJLXqHpeoSI5DQmp/hXEoTVCBCy94lq5bgQIS2vQ9YaYIKQmjfO50z/ZHVfgChje/lJvJDGpQJbX23uvSYLVXC5pmNFl1IPEGlRBg1zz4hVxwqkTDBKRBGzR9fbeYj4gkqKWHU/GKvP9cSTFBJCKPowpInQon4E1RCwijas+V5UKryy7PkhFF7j7dz0EbxJqi4hM32N+symlicBMcmjJptq8sDR8wJKhZhVv5+OshH2AmuTJiXv7qvFC3GMVvbhFHzwoHyx1c53mwSRtF3Z8oDR6UlxiJhVv5cKg8cbSe4d8KosedYeeBoK8GtCN0rf3xtJrg5obvlga3NCapmzudueWCrmOBe3Hg6gmq4WmLsJPuOPB2BNe0mnU4njqeulz++xve94PYGtuPay8vLy8vLy8vLy8vLy8vLy2n9Dxu8F6IkEOfvAAAAAElFTkSuQmCC)

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

