    #include "protheus.ch"
    /*/{Protheus.doc} nomeFunction
    (long_description)
    @type  Function
    @author user
    @since date
    @version version
    @param param, param_type, param_descr
    @return return, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
    User Function Exer1()

    Local nAnoAtual := 2022
    Local nResultado := 0
    Local cAno := ""

    cAno := fwInputBox("Me informe o ano do seu nascimento: ", " ")

    nResultado := nAnoAtual - Val(cAno)

    Alert("Você vai fazer: " + cValToChar(nResultado) + " anos")
    
    return

    User Function Exer2()

    Local nFileiras := ""
    Local nCadeiras := ""
    Local nResul := 0
    Local nPorcentagem := (nResultado * 10) / 100

    nFileiras := fwInputBox("Digite a quantidade de fileiras: ", "")
    nCadeiras:= fwInputBox("Digite a quantidade de cadeiras: ", "")
    nResul := Val(nFileiras) * Val(nCadeiras)

    Alert("A sala de cinema tem " + nFileiras + " fileiras e " + nCadeiras + " cadeiras.")
    Alert("A quantidade total de cadeiras é de " + nResul)


