//Nu Html Checker :: https://validator.w3.org/nu/

/*
    replace default tHTMLDocument class with new tHTMLDocument class. 
    Source code: https://github.com/naldodj/naldodj-hb/tree/main/contrib/hbtip
    SetEnvIf Request_URI "/samples/tHtmlDocument/Bootstrap/tables/" MH_INITPROCESS=../pluggins/contrib/thtml.hrb,../pluggins/templates/addHarbourPRGFileAsCodeText.prg,../pluggins/templates/BootstrapStarterTemplate.prg
*/
{% MH_LoadHRB( '../pluggins/contrib/thtml.hrb' ) %}

procedure main()

    local aOptions as array
    
    local cHTML as character
    local cTitle as character
    local cBackURL as character

    local nOption as numeric
    
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

    aOptions:=array(0)
    aAdd(aOptions,{"../../../../samples/tHtmlDocument/Bootstrap/tables/01-dbf-table-table.prg","01-dbf-table-table.prg","[DBF file]"})
    aAdd(aOptions,{"../../../../samples/tHtmlDocument/Bootstrap/tables/02-dbf-table-table-striped.prg","02-dbf-table-table-striped.prg","[DBF file]"})
    aAdd(aOptions,{"../../../../samples/tHtmlDocument/Bootstrap/tables/03-dbf-table-table-hover.prg","03-dbf-table-table-hover.prg","[DBF file]"})
    aAdd(aOptions,{"../../../../samples/tHtmlDocument/Bootstrap/tables/04-json-to-Bootstrap-Table.prg","04-json-to-Bootstrap-Table.prg","[JSON file]"})
    aAdd(aOptions,{"../../../../samples/tHtmlDocument/Bootstrap/tables/05-dbf-json-to-Bootstrap-Table.prg","05-dbf-json-to-Bootstrap-Table.prg","[JSON in MEMO field]"})
    aAdd(aOptions,{"../../../../samples/tHtmlDocument/Bootstrap/tables/06-json-to-Bootstrap-Table.prg","06-json-to-Bootstrap-Table.prg","[JSON file]"})
    aAdd(aOptions,{"../../../../samples/tHtmlDocument/Bootstrap/tables/07-dbf-json-to-Bootstrap-Table.prg","07-dbf-json-to-Bootstrap-Table.prg","[JSON in MEMO field]"})
    aAdd(aOptions,{"../../../../samples/tHtmlDocument/Bootstrap/tables/08-json-server-json-to-Bootstrap-Table.prg","08-json-server-json-to-Bootstrap-Table.prg","[JSON-SERVER cURL]"})
    aAdd(aOptions,{"../../../../samples/tHtmlDocument/Bootstrap/tables/09-json-server-json-to-Bootstrap-Table.prg","09-json-server-json-to-Bootstrap-Table.prg","[JSON-SERVER XMLHTTP]"})
    aAdd(aOptions,{"../../../../samples/tHtmlDocument/Bootstrap/tables/10-netio-dbf-json-to-Bootstrap-Table.prg","10-netio-dbf-json-to-Bootstrap-Table.prg","[NetIO-JSON in MEMO field]"})
    
    for nOption:=1 to Len(aOptions)
        /* Operator "+" creates a new <a> node */
        oNode:=oDiv+"a"
        oNode:attr:='class="list-group-item list-group-item-action"'
        oNode:href:=aOptions[nOption][1]
        oNode:text:=aOptions[nOption][2]+" "
        oNode+="strong"
        oNode:text:=aOptions[nOption][3]
    next nOption

    addHarbourPRGFileAsCodeText(oHTMLDoc:body:Main:div,hb_getenv('PRGPATH')+'/index.prg')

    cHTML:=oHTMLDoc:toString(-9,4)

    ??cHTML

    return

{% MH_LoadFile('../pluggins/templates/tHTMLDocumentNew.prg') %}
{% MH_LoadFile('../pluggins/templates/BootstrapStarterTemplate.prg') %}
{% MH_LoadFile('../pluggins/templates/addHarbourPRGFileAsCodeText.prg') %}
