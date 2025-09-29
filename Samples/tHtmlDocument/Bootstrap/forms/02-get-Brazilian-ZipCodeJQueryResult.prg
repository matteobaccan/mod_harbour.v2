procedure main()
    
    local cURL as character
    local cData as character
    local cZipCode as character
    local cViaCEPOption as character

    local hParameters as hash := AP_GetPairs()

    local lCURL as logical

    if (!hb_HHasKey(hParameters,"ZipInputName"))
        hParameters["ZipInputName"]:="70635815"
    endif

    if (!hb_HHasKey(hParameters,"ViaCEPOptionsName"))
        hParameters["ViaCEPOptionsName"]:="json"
    endif

    if (!hb_HHasKey(hParameters,"HarbourOptionsName"))
        hParameters["HarbourOptionsName"]:="CURL"
    endif

    cZipCode:=allTrim(hParameters["ZipInputName"])
    cZipCode:=strTran(cZipCode,"-","")

    cViaCEPOption:=hParameters["ViaCEPOptionsName"]
    lCURL:=(hParameters["HarbourOptionsName"]=="CURL")

    cURL:="http://viacep.com.br/ws/"+cZipCode+"/"+cViaCEPOption+"/"
    
    cData:=getJsonServerData(lCURL,cURL)

    AP_SetContentType("application/json")

    ?? cData

    return

{% MH_LoadFile('../pluggins/templates/getJsonServerData.prg') %}