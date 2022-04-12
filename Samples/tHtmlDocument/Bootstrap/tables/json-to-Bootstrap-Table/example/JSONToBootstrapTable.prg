#ifdef __PLATFORM__WINDOWS
   #include "c:\harbour\contrib\hbcURL\hbcURL.ch"
#else
   #include "/usr/include/harbour/hbcURL.ch"
#endif

#define TIMEOUT_Resolve (5*1000)
#define TIMEOUT_Connect (5*1000)
#define TIMEOUT_Send    (15*1000)
#define TIMEOUT_Receive (15*1000)

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

static function getJsonServerData(lCURL as logical)

    local cURL as character
    local cBuffer as character

    local hcURL as hash

    local nError as numeric

    local lServerXMLHTTP as logical

    local oXMLHTTP as object

    local xValue

    //https://github.com/naldodj/naldodj-json-server-multiple-files
    cURL:="http://naldodj-28214.portmap.io:28214/db/get/JSONToBootstrapTable.json"

    hb_Default(@lCURL,.T.)

    if (lCURL)

        cURL_global_init()

            if (!empty(hcURL:=cURL_easy_init()))
                cURL_easy_setopt(hcURL,HB_CURLOPT_URL,cURL)
                cURL_easy_setopt(hcURL,HB_CURLOPT_SSL_VERIFYPEER,.f.)
                cURL_easy_setopt(hcURL,HB_CURLOPT_SSL_VERIFYHOST,.f.)
                cURL_easy_setopt(hcURL,HB_CURLOPT_NOPROGRESS,.f.)
                cURL_easy_setopt(hcURL,HB_CURLOPT_VERBOSE,.t.)
                cURL_easy_setopt(hcURL,HB_CURLOPT_DL_BUFF_SETUP)
                if (cURL_easy_perform(hcURL)==HB_CURLE_OK)
                    xValue:=curl_easy_getinfo(hcURL,HB_CURLINFO_RESPONSE_CODE,@nError)
                    if (nError==HB_CURLE_OK)
                        switch hb_jsonEncode(xValue)
                        case "200"
                        case "202"
                            cBuffer:=cURL_easy_dl_buff_get(hcURL)
                        endswitch
                    endif
                endif
            endif

        cURL_global_cleanup()

    else

         //https://msdn.microsoft.com/es-es/library/ms535874(v=vs.85).aspx#methods
         TRY
            oXMLHTTP := CreateObject( 'MSXML2.ServerXMLHTTP.6.0' )
            lServerXMLHTTP:=.T.
         CATCH
            TRY
               oXMLHTTP := CreateObject( 'MSXML2.XMLHTTP' )
            CATCH
               TRY
                  oXMLHTTP := CreateObject( 'Microsoft.XMLHTTP' )
               END TRY
            END TRY
         END TRY

         TRY

            HB_Default(@lServerXMLHTTP,.F.)
            IF (lServerXMLHTTP)
               oXMLHTTP:setTimeouts(TIMEOUT_Resolve,TIMEOUT_Connect,TIMEOUT_Send,TIMEOUT_Receive)
            ENDIF

            oXMLHTTP:Open("GET",cURL,.F.)
            oXMLHTTP:SetRequestHeader( "Content-Type", "application/json;charset=utf-8" )
            oXMLHTTP:Send()

            switch (oXMLHTTP:STATUS)
            case 200
            case 202
                cBuffer:=oXMLHTTP:ResponseText
            endswitch

         END TRY

    endif

return(cBuffer)
