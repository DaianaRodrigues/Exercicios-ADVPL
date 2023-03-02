#include "protheus.ch"

/*
+===========================================+
| Programa: Sorteio cartas de baralho |
| Autor : Daiana Rodrigues Nascimento |
| Data : 02/03/23 |
+===========================================+
*/

Class baralho
    PROTECTED DATA cNaipes
    PROTECTED DATA cRanks

    PUBLIC METHOD New() CONSTRUCTOR
    PUBLIC METHOD sorteio()
    PUBLIC METHOD sorteio2()
    PUBLIC METHOD mensagem()
endclass

METHOD new() Class baralho
    Self:cNaipes := {"Copas", "Espadas", "Paus", "Ouros"}
    Self:cRanks := {"Ás", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Valete", "Dama", "Rei"}
Return Self

METHOD sorteio() Class baralho
    LOCAL cSorteio := Self:cNaipes[Randomize(1, 4)]
return cSorteio

METHOD sorteio2() Class baralho
    LOCAL cSort2 := Self:cRanks[Randomize(1, 13)]
return cSort2

METHOD mensagem() Class baralho
    FWAlertSuccess("Sorteando uma carta de baralho!! " + chr(13) + chr(10) +;
    "A carta sorteada foi: " + Self:Sorteio2() + " de " + Self:sorteio())
return 

User Function PLSORTEIO()
    Local oClasse := baralho():new()
    oClasse:mensagem()
return