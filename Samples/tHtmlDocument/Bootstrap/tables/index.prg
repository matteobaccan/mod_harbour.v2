//Nu Html Checker :: https://validator.w3.org/nu/

/*
    replace default tHTMLDocument class with new tHTMLDocument class. 
    Source code: https://github.com/naldodj/naldodj-hb/tree/main/contrib/hbtip
    SetEnvIf Request_URI "/samples/tHtmlDocument/Bootstrap/tables/" MH_INITPROCESS=../pluggins/contrib/thtml.hrb,../pluggins/templates/addHarbourPRGFileAsCodeText.prg,../pluggins/templates/BootstrapStarterTemplate.prg
*/
{% MH_LoadHRB( '../pluggins/contrib/thtml.hrb' ) %}

procedure main()

    local aOptions as array
    
    local cHRef as character
    local cHTML as character
    local cTitle as character
    local cBackURL as character
    
    local hOption as hash
    
    local oDiv as object
    local oNode as object
    local oLang as object
    local oHTMLDoc as object
    
    local pHrbLoad as pointer

    cBackURL:="../"
    cHTML:=BootstrapStarterTemplate(cBackURL)
    oHTMLDoc:=tHTMLDocumentNew(cHTML,@pHrbLoad)

    oLang:=oHTMLDoc:root:html
    oLang:attr:={"lang"=>"en"}

    cTitle:="mod_harbour Bootstrap tables examples"

    /* Operator "+" creates a new node */
    oNode:=oHTMLDoc:head+"meta"
    oNode:name:="Generator"
    oNode:content:="Harbour/THtmlDocument"

    oNode:=oHTMLDoc:head+"title"
    oNode:text:=cTitle

    /* Operator ":" returns first "div" from body (creates if not existent) */
    oDiv:=oHTMLDoc:body:Main:div
    oDiv:attr:='class="container"'

    /* Operator ":" returns first "h4" from div (creates if not existent) */
    oNode:=oDiv:h4
    oNode:attr:='class="page-header"'
    oNode:text:=cTitle

    /* Operator "+" creates a new <div> node */
    oDiv:=oDiv+"div"
    oDiv:attr:='class="list-group"'

    cHRef:="../../../../samples/tHtmlDocument/Bootstrap/tables/"

    aOptions:=array(0)

    aAdd(aOptions,{"href"=>cHRef,"source"=>"01-dbf-table-table.prg","strong"=>"[DBF file]"})
    aAdd(aOptions,{"href"=>cHRef,"source"=>"02-dbf-table-table-striped.prg","strong"=>"[DBF file]"})
    aAdd(aOptions,{"href"=>cHRef,"source"=>"03-dbf-table-table-hover.prg","strong"=>"[DBF file]"})
    aAdd(aOptions,{"href"=>cHRef,"source"=>"04-json-to-Bootstrap-Table.prg","strong"=>"[JSON file]"})
    aAdd(aOptions,{"href"=>cHRef,"source"=>"05-dbf-json-to-Bootstrap-Table.prg","strong"=>"[JSON in MEMO field]"})
    aAdd(aOptions,{"href"=>cHRef,"source"=>"06-json-to-Bootstrap-Table.prg","strong"=>"[JSON in MEMO field]"})
    aAdd(aOptions,{"href"=>cHRef,"source"=>"07-dbf-json-to-Bootstrap-Table.prg","strong"=>"[JSON in MEMO field]"})
    aAdd(aOptions,{"href"=>cHRef,"source"=>"08-json-server-json-to-Bootstrap-Table.prg","strong"=>"[JSON-SERVER cURL]"})
    aAdd(aOptions,{"href"=>cHRef,"source"=>"09-json-server-json-to-Bootstrap-Table.prg","strong"=>"[JSON-SERVER XMLHTTP]"})
    aAdd(aOptions,{"href"=>cHRef,"source"=>"10-netio-dbf-json-to-Bootstrap-Table.prg","strong"=>"[NetIO-JSON in MEMO field]"})

    for each hOption in aOptions
        /* Operator "+" creates a new <a> node */
        oNode:=oDiv+"a"
        oNode:attr:='class="list-group-item list-group-item-action"'
        oNode:href:=hOption["href"]+hOption["source"]
        oNode:text:=hOption["source"]+" "
        /* Operator "+=" creates a new <strong> node */
        oNode+="strong"
        oNode:text:=hOption["strong"]
    next each

    oDiv:=oHTMLDoc:body:Main:div
    addHarbourPRGFileAsCodeText(oDiv,hb_getenv('PRGPATH')+'/01-dbf-table-table.prg')

    cHTML:=oHTMLDoc:toString(-9,4)

    ??cHTML

    return

{% MH_LoadFile('../pluggins/templates/tHTMLDocumentNew.prg') %}
{% MH_LoadFile('../pluggins/templates/BootstrapStarterTemplate.prg') %}
{% MH_LoadFile('../pluggins/templates/addHarbourPRGFileAsCodeText.prg') %}
