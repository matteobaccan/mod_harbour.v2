//Nu Html Checker :: https://validator.w3.org/nu/

/*
    replace default tHTMLDocument class with new tHTMLDocument class. 
    Source code: https://github.com/naldodj/naldodj-hb/tree/main/contrib/hbtip
    SetEnvIf Request_URI "/samples/tHtmlDocument/Bootstrap/forms/" MH_INITPROCESS=../pluggins/contrib/thtml.hrb,../pluggins/templates/addHarbourPRGFileAsCodeText.prg,../pluggins/templates/BootstrapStarterTemplate.prg
*/
{% MH_LoadHRB( '../pluggins/contrib/thtml.hrb' ) %}

procedure main()
    
    local cHTML as character
    local cTitle as character

    local oHTMLDoc as object

    local hHtmlNode as hash := {=>}

    local pHrbLoad as pointer

    cHTML:=BootstrapStarterTemplate("./")
    oHTMLDoc:=tHTMLDocumentNew(cHTML,@pHrbLoad)

    hHtmlNode["Lang"]:=oHTMLDoc:root:html
    hHtmlNode["Lang"]:attr:={"lang"=>"en"}

    cTitle:="mod_harbour :: Bootstrap :: Forms :: Brazilian Zip Code"

    with object hHtmlNode["style"]:=oHTMLDoc:head+"style"
        :attr:='class="anchorjs"'
    end

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

        with object hHtmlNode["DivContainer-4"]:=:form
        
            :id:="ZipForm"
            :attr:='method="post"'
        
            with object hHtmlNode["DivContainer-4-1"]:=hHtmlNode["DivContainer-4"]+'Div'
            
                :attr:='class="form-row"'

                with object hHtmlNode["DivContainer-4-1-1"]:=hHtmlNode["DivContainer-4-1"]+'Div'
                    
                    :attr:='class="col-sm-12"'
                
                    with object hHtmlNode["DivContainer-4-1-1-1"]:=hHtmlNode["DivContainer-4-1-1"]+'label'
                        :attr:='for="Zip"'
                        :text:=''
                    end 
                    
                    with object hHtmlNode["DivContainer-4-1-1-2"]:=hHtmlNode["DivContainer-4-1-1"]+'input'
                        :attr:='type="text" style="border-style:solid;border-width:1px;" class="form-control is-invalid" id="ZipInputID" placeholder="Zip" name="ZipInputName" required'
                    end

                    with object hHtmlNode["DivContainer-4-1-1-4"]:=hHtmlNode["DivContainer-4-1-1"]+'select'
                        :attr:='class="custom-select custom-select-lg mb-3" multiple aria-label="ViaCEP Options" style="height: 100px;border-style:solid;border-width:1px;display:flex;" name="ViaCEPOptionsName" id="ViaCEPOptionsID"'
                        with object hHtmlNode["DivContainer-4-1-1-4-1"]:=hHtmlNode["DivContainer-4-1-1-4"]+'optgroup'
                            :attr:='label="ViaCEP Options"'
                            with object hHtmlNode["DivContainer-4-1-1-4-1-1"]:=hHtmlNode["DivContainer-4-1-1-4-1"]+'option'
                                :attr:='value="json" selected'
                                :text:="json"
                            end
                            :AddNode(THtmlNode():New(hHtmlNode["DivContainer-4-1-1-4-1"],"/option"))
                            with object hHtmlNode["DivContainer-4-1-1-4-1-2"]:=hHtmlNode["DivContainer-4-1-1-4-1"]+'option'
                                :attr:='value="xml"'
                                :text:="xml"
                            end
                            :AddNode(THtmlNode():New(hHtmlNode["DivContainer-4-1-1-4-1"],"/option"))
                            with object hHtmlNode["DivContainer-4-1-1-4-1-3"]:=hHtmlNode["DivContainer-4-1-1-4-1"]+'option'
                                :attr:='value="piped"'
                                :text:="piped"
                            end
                            :AddNode(THtmlNode():New(hHtmlNode["DivContainer-4-1-1-4-1"],"/option"))
                        end
                        :AddNode(THtmlNode():New(hHtmlNode["DivContainer-4-1-1-4"],"/optgroup"))
                    end 

                    with object hHtmlNode["DivContainer-4-1-1-5"]:=hHtmlNode["DivContainer-4-1-1"]+'select'
                        :attr:='class="custom-select custom-select-lg mb-3" multiple aria-label="Harbour Options" style="height: 80px;border-style:solid;border-width:1px;display:flex;" name="HarbourOptionsName" id="HarbourOptionsID"'
                        with object hHtmlNode["DivContainer-4-1-1-5-1"]:=hHtmlNode["DivContainer-4-1-1-5"]+'optgroup'
                            :attr:='label="Harbour Options"'
                            with object hHtmlNode["DivContainer-4-1-1-5-1-1"]:=hHtmlNode["DivContainer-4-1-1-5-1"]+'option'
                                :attr:='value="CURL" selected'
                                :text:="CURL"
                            end
                            :AddNode(THtmlNode():New(hHtmlNode["DivContainer-4-1-1-5-1"],"/option"))
                            with object hHtmlNode["DivContainer-4-1-1-5-1-2"]:=hHtmlNode["DivContainer-4-1-1-5-1"]+'option'
                                :attr:='value="XMLHTTP"'
                                :text:="XMLHTTP"
                            end
                            :AddNode(THtmlNode():New(hHtmlNode["DivContainer-4-1-1-5-1"],"/option"))
                        end
                        :AddNode(THtmlNode():New(hHtmlNode["DivContainer-4-1-1-5"],"/optgroup"))
                    end 

                    with object hHtmlNode["DivContainer-4-1-1-5"]:=hHtmlNode["DivContainer-4-1-1"]+'button'
                        :attr:='class="btn btn-primary" type="submit"'
                        :text:='Submit form'
                        :formaction:='./01-get-Brazilian-ZipCodeResult.prg'
                    end 

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
