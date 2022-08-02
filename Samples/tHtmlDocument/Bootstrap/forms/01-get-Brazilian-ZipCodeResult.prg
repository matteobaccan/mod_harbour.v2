//Nu Html Checker :: https://validator.w3.org/nu/

/*
    replace default tHTMLDocument class with new tHTMLDocument class. 
    Source code: https://github.com/naldodj/naldodj-hb/tree/main/contrib/hbtip
    SetEnvIf Request_URI "/samples/tHtmlDocument/Bootstrap/forms/" MH_INITPROCESS=../pluggins/contrib/thtml.hrb,../pluggins/templates/addHarbourPRGFileAsCodeText.prg,../pluggins/templates/BootstrapStarterTemplate.prg
*/
{% MH_LoadHRB( '../pluggins/contrib/thtml.hrb' ) %}

procedure main()
    
    local cURL as character
    local cData as character
    local cHTML as character
    local cTitle as character
    local cZipCode as character
    local cViaCEPOption as character

    local hHtmlNode as hash := {=>}
    local hParameters as hash := AP_PostPairs()

    local lCURL as logical

    local pHrbLoad as pointer
    
    local oHTMLDoc as object

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

    cHTML:=BootstrapStarterTemplate("./01-get-Brazilian-ZipCode.prg")
    oHTMLDoc:=tHTMLDocumentNew(cHTML,@pHrbLoad)

    cTitle:="mod_harbour :: Bootstrap :: Forms :: Brazilian Zip Code"

    with object hHtmlNode["Meta"]:=oHTMLDoc:head+"meta"
        :name:="Generator"
        :content:="Harbour/THtmlDocument"
    end 
    
    with object hHtmlNode["Title"]:=oHTMLDoc:head+"title"
        :text:=cTitle
    end
    
    with object hHtmlNode["DivContainer"]:=oHTMLDoc:body:Main:div
    
        :attr:='class="container"'

        with object hHtmlNode["DivContainer-1"]:=hHtmlNode["DivContainer"]+'h4'
            :attr:='class="page-header"'
            :text:=cTitle
        end

        hHtmlNode["DivContainer-2"]:=hHtmlNode["DivContainer"]+'hr'

        with object hHtmlNode["DivContainer-3"]:=hHtmlNode["DivContainer"]+'h4'
            :text:="This is a "
            with object hHtmlNode["DivContainer-3-1"]:=hHtmlNode["DivContainer-3"]+'b'
                with object hHtmlNode["DivContainer-3-1-1"]:=hHtmlNode["DivContainer-3-1"]+'strong'
                    :text:="sample "
                end
            end
            :text:="Bootstrap Forms :: Brazilian ZipCode"
        end
        
        hHtmlNode["DivContainer-4"]:=hHtmlNode["DivContainer"]+'hr'
        
        with object hHtmlNode["DivContainer-5"]:=hHtmlNode["DivContainer"]+'Div'
            :attr:='class="form-row"'
            with object hHtmlNode["DivContainer-5-1"]:=hHtmlNode["DivContainer-5"]+'Div'
                :attr:='class="form-group"'
                with object hHtmlNode["DivContainer-5-1-2"]:=hHtmlNode["DivContainer-5-1"]+'textarea'
                    :attr:='class="form-control rounded-0" style="height: 350px; padding: 10px; border:0px ;background-color:aliceblue;"'
                    :text:=cData
                end 
            end

        end

        addHarbourPRGFileAsCodeText(:div,AP_GetEnv("SCRIPT_FILENAME"))

    end

    cHTML:=oHTMLDoc:toString(-9,4)    
    cHTML:=strTran(cHTML,"><",">"+hb_eol()+"<")

    ??cHTML

    return

{% MH_LoadFile('../pluggins/templates/tHTMLDocumentNew.prg') %}
{% MH_LoadFile('../pluggins/templates/getJsonServerData.prg') %}
{% MH_LoadFile('../pluggins/templates/BootstrapStarterTemplate.prg') %}
{% MH_LoadFile('../pluggins/templates/addHarbourPRGFileAsCodeText.prg') %}
