User Function PLCALINS()

Local nsalario := 0
Local ncontribuicao := 0

Local ninss1 := 0.075
Local ninss2 := 0.09
Local ninss3 := 0.12
Local ninss4 := 0.14

Local nbase1 := 1212.00
Local nbase2 := 2437.35
Local nbase3 := 3641.03
Local nbase4 := 7087.22

Local nsoma  := nbase1 * ninss1
Local nsoma1 := (nbase2 - nbase1) * ninss2
Local nsoma2 := (nbase3 - nbase2) * ninss3
Local nsoma3 := (nbase4 - nbase3) * ninss4

Local ndesconto1 := 0
Local ndesconto2 := 0
Local ndesconto3 := 0
Local ndesconto4 := 0
Local ndesconto5 := 0

nsalario = Val(fwInputBox(decodeUtf8("Digite aqui o seu salário: ")))

If nsalario <= nbase1
    ndesconto1 := nsalario * ninss1
    ncontribuicao := ndesconto1  
ELSEIF nsalario <= nbase2
    ndesconto2 := (nsalario - nbase1) * ninss2 + nsoma
    ncontribuicao := ndesconto2
ELSEIF nsalario <= nbase3
    ndesconto3 := (nsalario - nbase2) * ninss3 + nsoma + nsoma1
    ncontribuicao := ndesconto3
ELSEIF nsalario <= nbase4
    ndesconto4 := (nsalario - nbase3) * ninss4 + nsoma + nsoma1 + nsoma2
    ncontribuicao := ndesconto4
ELSEIF nsalario >= nbase4
    ndesconto5 := nsoma + nsoma1 + nsoma2 + nsoma3
    ncontribuicao := ndesconto5
    
EndIf
    mensagem(nsalario, ncontribuicao)
return

/*/{Protheus.doc} nomeStaticFunction
    (long_description)
    @type  Static Function
    @author user
    @since date
    @version version
    @param param, param_type, param_descr
    @return return, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
 Static Function mensagem(nsalario, ncontribuicao)
    FWalertSuccess(decodeUtf8("O salário bruto informado foi " +cValToChar(nsalario) + chr(13) + chr(10) + ;
    "O valor de contribuição ao INSS é" + cValToChar(ncontribuicao)))
 return

