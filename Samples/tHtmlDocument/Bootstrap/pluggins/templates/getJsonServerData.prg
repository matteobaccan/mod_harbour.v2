#ifdef __PLATFORM__WINDOWS
   #include "c:\harbour\contrib\hbcURL\hbcURL.ch"
#else
   #include "/usr/include/harbour/hbcURL.ch"
#endif

#define TIMEOUT_Resolve (5*1000)
#define TIMEOUT_Connect (5*1000)
#define TIMEOUT_Send    (15*1000)
#define TIMEOUT_Receive (15*1000)

REQUEST HB_CODEPAGE_UTF8EX

function getJsonServerData(lCURL as logical,cURL as character)

    local cBuffer as character

    local hcURL as hash

    local nError as numeric

    local lServerXMLHTTP as logical

    local oXMLHTTP as object

    local xValue

    hb_CdpSelect("UTF8EX")

    //https://github.com/naldodj/naldodj-json-server-multiple-files
    hb_Default(@cURL,"http://naldodj.duckdns.org:28214/db/get/JSONToBootstrapTable.json")

    hb_Default(@lCURL,.T.)
    
    #ifndef __PLATFORM__WINDOWS
        lCURL:=.T.
    #endif

    if (lCURL)

        cURL_global_init()

            if (!empty(hcURL:=cURL_easy_init()))
                cURL_easy_setopt(hcURL,HB_CURLOPT_URL,cURL)
                cURL_easy_setopt(hcURL,HB_CURLOPT_SSL_VERIFYPEER,.f.)
                cURL_easy_setopt(hcURL,HB_CURLOPT_SSL_VERIFYHOST,.f.)
                cURL_easy_setopt(hcURL,HB_CURLOPT_NOPROGRESS,.f.)
                cURL_easy_setopt(hcURL,HB_CURLOPT_VERBOSE,.t.)
                cURL_easy_setopt(hcURL,HB_CURLOPT_DL_BUFF_SETUP)
                cURL_easy_setopt(hcURL,HB_CURLOPT_TIMEOUT,TIMEOUT_Resolve)
                cURL_easy_setopt(hcURL,HB_CURLOPT_CONNECTTIMEOUT,TIMEOUT_Connect)                
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
            oXMLHTTP := CreateObject('MSXML2.ServerXMLHTTP.6.0')
            lServerXMLHTTP:=.T.
         CATCH
            TRY
               oXMLHTTP:=CreateObject('MSXML2.XMLHTTP')
            CATCH
               TRY
                  oXMLHTTP:=CreateObject('Microsoft.XMLHTTP')
               END TRY
            END TRY
         END TRY

         TRY

            HB_Default(@lServerXMLHTTP,.F.)
            IF (lServerXMLHTTP)
               oXMLHTTP:setTimeouts(TIMEOUT_Resolve,TIMEOUT_Connect,TIMEOUT_Send,TIMEOUT_Receive)
            ENDIF

            oXMLHTTP:Open("GET",cURL,.F.)
            oXMLHTTP:SetRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8")
            oXMLHTTP:Send()

            switch (oXMLHTTP:STATUS)
            case 200
            case 202
                cBuffer:=oXMLHTTP:ResponseText
            endswitch

         END TRY

    endif

return(cBuffer)
