#define DBSERVER  "127.0.0.1"
#define DBPORT    2941
#define DBPASSWD  "topsecret"
#define DBDIR     "base"
#define DBFILE    "json"

#define DBNAME    "net:"+DBSERVER+":"+hb_ntos(DBPORT )+":"+DBPASSWD+":"+DBDIR+"/"+DBFILE

function Main()

    local aData as array

    local cDbf as character
    local cAlias as character
    local cData as character

    local lCURL as logical

    local hData as hash
    local hParam as hash

    hParam:=AP_GetPairs()

    if (!HB_ISNIL(hParam).and.(HB_HHasKey(hParam,"file")))
        switch (hParam["file"])
        case ("dbf")
            cDbf:=hb_getenv('PRGPATH')+'/../../data/json.dbf'
            use (cDbf) shared new
            cAlias:=alias()
            aData:=array(0)
            (cAlias)->(dbGoTop())
            while ((cAlias)->(!eof()))
                cData:=(cAlias)->JSON
                hData:=hb_JsonDecode(cData)
                aAdd(aData,hData)
                (cAlias)->(dbSkip())
            end while
            cData:=hb_jsonEncode(aData,.T.)
            exit
        case ("netio")
            netio_Connect(DBSERVER,DBPORT,nil,DBPASSWD)
            cDbf:=DBNAME
            use (cDbf) shared new
            cAlias:=alias()
            aData:=array(0)
            (cAlias)->(dbGoTop())
            while ((cAlias)->(!eof()))
                cData:=(cAlias)->JSON
                hData:=hb_JsonDecode(cData)
                aAdd(aData,hData)
                (cAlias)->(dbSkip())
            end while
            netio_Disconnect(DBSERVER,DBPORT)
            cData:=hb_jsonEncode(aData,.T.)
            exit
        case ("json-server")
            lCURL:=(!HB_HHasKey(hParam,"clientURL").or.hParam["clientURL"]=="CURL")
            cData:=getJsonServerData(lCURL)
            exit
        case ("json")
            cData:=hb_MemoRead(hb_GetEnv('PRGPATH')+"/JSONToBootstrapTable.json")
            exit
        end switch
    else
        cData:=hb_MemoRead(hb_GetEnv('PRGPATH')+"/JSONToBootstrapTable.json")
    endif

    if (empty(cData))
        TEXT INTO cData
            [
                {"id": 1,"gender": "Male","first_name": "none","last_name": "none","email": "none@ebay.com","ip_address": "65.239.17.202"},
                {"id": 2,"gender": "Male","first_name": "none","last_name": "none","email": "none@cbsnews.com","ip_address": "69.21.244.122"}
            ]
        ENDTEXT
    endif

    AP_SetContentType("application/json")

    ?? cData

return

{% MH_LoadFile('../../../pluggins/templates/getJsonServerData.prg') %}