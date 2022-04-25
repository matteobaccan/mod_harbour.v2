//Nu Html Checker :: https://validator.w3.org/nu/
//https://github.com/pbse/JSON-to-Bootstrap-Table

{% MH_LoadHRB( '..\pluggins\contrib\_THtml.hrb' ) %}

procedure main()

    local cHTML as character

    local oLang as object
    local oScript as object
    local oHTMLDoc as object

    local oHeadTitle as object

    local oDivContainer as object

    local oDivPageHeader as object
    local oDivPageHeaderH4 as object
    local oDivPageHeaderRow as object
    local oDivPageHeaderRowH5 as object
    local oDivPageHeaderRowDiv as object

    local oDivCreateTableJSON as object

    local oFigureHighlight as object
    local oFigureHighlightPre as object
    local oFigureHighlightPreH4 as object
    local oFigureHighlightPreCode as object

    cHTML:=hb_MemoRead(hb_GetEnv('PRGPATH')+"/json-to-Bootstrap-Table/example/index-json-dbf.html")
    oHTMLDoc:=_THtmlDocument():New(cHTML)
    
    oLang:=oHTMLDoc:root:html
    oLang:attr:={"lang"=>"en"}

    oHeadTitle:=oHTMLDoc:Head:title
    oHeadTitle:text:="MOD_HARBOUR :: CURL :: JSON-SERVER/JSON to Bootstrap table"

    oDivContainer:=oHTMLDoc:body:Main:div
    oDivContainer:attr:='class="container"'

    oDivPageHeader:=oDivContainer+"div"
    oDivPageHeader:attr:='class="page-header"'
    oDivPageHeaderH4:=oDivPageHeader:h4
    oDivPageHeaderH4:text:="MOD_HARBOUR :: CURL :: JSON-SERVER/JSON to Bootstrap table"

    oDivPageHeaderRow:=oDivContainer+"div"

    oDivPageHeaderRowH5:=oDivPageHeaderRow:h5
    oDivPageHeaderRowH5:text:="mod_harbour :: Bootstrap Table with JSON Data - Ajax request"

    oDivPageHeaderRowDiv:=oDivPageHeaderRow+"div"
    oDivCreateTableJSON:=oDivPageHeaderRowDiv+"div"
    oDivCreateTableJSON:attr:='class="createTableJSON"'

    oFigureHighlight:=oDivPageHeaderRowDiv:AddNode(_THtmlNode():New(oDivPageHeaderRowDiv,"figure"))
        oFigureHighlight:attr:='class="highlight"'

        oFigureHighlightPreH4:=oFigureHighlight+"h4"
        oFigureHighlightPreH4:text:="Code Used"

        oFigureHighlightPre:=oFigureHighlight+"pre"
        oFigureHighlightPreCode:=oFigureHighlightPre+"code"

        TEXT INTO oFigureHighlightPreCode:text
&lt;script src="./json-to-Bootstrap-Table/example/jsonToTable.js"&gt;&lt;/script&gt;
&lt;script&gt;
    var dtbl = new createTable({
    url:'./json-to-Bootstrap-Table/example/JSONToBootstrapTable.prg?file=json-server&clientURL=CURL',
    wrapper:".createTableJSON"
    }).create();
&lt;/script&gt;
        ENDTEXT

        oFigureHighlightPreH4:=oFigureHighlight+"h4"
        oFigureHighlightPreH4:text:="To Pass a Data instead of URL"

        oFigureHighlightPre:=oFigureHighlight+"pre"
        oFigureHighlightPreCode:=oFigureHighlightPre+"code"
        TEXT INTO oFigureHighlightPreCode:text
&lt;script src="./json-to-Bootstrap-Table/example/jsonToTable.js"&gt;&lt;/script&gt;
&lt;script&gt;
    var ctbl = new createTable({
    data:[{"d":"a", "e":"b"},{"e":"a", "d":"b"}],
    wrapper:".createTable"
    }).create();
&lt;/script&gt;
        ENDTEXT

        oFigureHighlightPreH4:=oFigureHighlight+"h4"
        oFigureHighlightPreH4:text:="JSON Data"

        oFigureHighlightPre:=oFigureHighlight+"pre"
        oFigureHighlightPreCode:=oFigureHighlightPre+"code"
        TEXT INTO oFigureHighlightPreCode:text
[
    {"id": 1,"gender": "Male","first_name": "Randy","last_name": "Russell","email": "rrussell0@ebay.com","ip_address": "65.239.17.202"},
    {"id": 2,"gender": "Male","first_name": "Mark","last_name": "Ryan","email": "mryan1@cbsnews.com","ip_address": "69.21.244.122"}.... & more
]
        ENDTEXT

        oFigureHighlightPreH4:=oFigureHighlight+"h4"
        oFigureHighlightPreH4:text:="JSON-SERVER"

        oFigureHighlightPre:=oFigureHighlight+"pre"
        oFigureHighlightPreCode:=oFigureHighlightPre+"code"
        TEXT INTO oFigureHighlightPreCode:text
# 🚤 json-server-multiple-files

Using json-server to server multiple json files in less than *45 seconds* (trust me).

https://github.com/naldodj/naldodj-json-server-multiple-files

## Prequisite
- nodemon `sudo npm install -g nodemon`

## Getting Started
1. Place your .json files into the `db` folder (⚠️ make sure they match the format)
2. Install dependencies with `npm install`
3. Run the server : `npm run start:server`

## Output
````
[nodemon] 1.18.10
[nodemon] to restart at any time, enter `rs`
[nodemon] watching: test/mock
[nodemon] starting `node json-server.index.js`


🗒    JSON file loaded : places.json
🗒    JSON file loaded : teams.json

⛴    JSON Server is running at http://localhost:3002
🥁    Endpoint : http://localhost:3002/organisations
🥁    Endpoint : http://localhost:3002/tenders
````

## Todo
- Check the json format, and remove json that does not match.

## Built With
- [typicode/json-server](https://github.com/typicode/json-server)

## License
MIT
        ENDTEXT

    oFigureHighlight:=oDivPageHeaderRowDiv:AddNode(_THtmlNode():New(oDivPageHeaderRowDiv,"/figure"))

    oScript:=oHTMLDoc:body:Main+"script"
    oScript:src:="./json-to-Bootstrap-Table/example/jsonToTable.min.js"

    oScript:=oHTMLDoc:body:Main+"script"
    TEXT INTO oScript:text
var dtbl=new createTable(
    {
        url:'./json-to-Bootstrap-Table/example/JSONToBootstrapTable.prg?file=json-server&clientURL=CURL',
        wrapper:".createTableJSON"
    }
).create();
    ENDTEXT

    addHarbourPRGFileAsCodeText(oHTMLDoc:body:Main:div,hb_getenv('PRGPATH')+'/08-json-server-json-to-Bootstrap-Table.prg')

    cHTML:=oHTMLDoc:toString(-9,4)

    ??cHTML

    return

{% MH_LoadFile('..\pluggins\templates\addHarbourPRGFileAsCodeText.prg') %}
