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

        with object hHtmlNode["DivContainer-4"]:=hHtmlNode["DivContainer"]+'form'
            :attr:='method="get" action="."'
            with object hHtmlNode["DivContainer-4-1"]:=hHtmlNode["DivContainer-4"]+"label"
                :text:="Cep:"
                with object hHtmlNode["DivContainer-4-1-1"]:=hHtmlNode["DivContainer-4-1"]+"input"
                    :attr:='class="form-control" name="cep" type="text" id="cep" size="10" maxlength="9" placeholder="Cep:" aria-label="Cep:" style="border-style:solid;border-width:1px;" required'
                end
            end
            with object hHtmlNode["DivContainer-4-2"]:=hHtmlNode["DivContainer-4"]+"label"
                :text:="Rua:"
                with object hHtmlNode["DivContainer-4-2-1"]:=hHtmlNode["DivContainer-4-2"]+"input"
                    :attr:='class="form-control" name="rua" type="text" id="rua" size="60" placeholder="Rua:" aria-label="Rua:" style="border-style:solid;border-width:1px;" readonly'
                end
            end
            with object hHtmlNode["DivContainer-4-3"]:=hHtmlNode["DivContainer-4"]+"label"
                :text:="Bairro:"
                with object hHtmlNode["DivContainer-4-3-1"]:=hHtmlNode["DivContainer-4-3"]+"input"
                    :attr:='class="form-control" name="bairro" type="text" id="bairro" size="40" placeholder="Bairro:" aria-label="Bairro:" style="border-style:solid;border-width:1px;" readonly'
                end
            end
            with object hHtmlNode["DivContainer-4-4"]:=hHtmlNode["DivContainer-4"]+"label"
                :text:="Cidade:"
                with object hHtmlNode["DivContainer-4-4-1"]:=hHtmlNode["DivContainer-4-4"]+"input"
                    :attr:='class="form-control" name="cidade" type="text" id="cidade" size="40" placeholder="Cidade:" aria-label="Cidade:" style="border-style:solid;border-width:1px;" readonly'
                end
            end
            with object hHtmlNode["DivContainer-4-5"]:=hHtmlNode["DivContainer-4"]+"label"            
                :text:="UF:"
                with object hHtmlNode["DivContainer-4-5-1"]:=hHtmlNode["DivContainer-4-5"]+"input"
                    :attr:='class="form-control" name="uf" type="text" id="uf" size="2" placeholder="UF:" aria-label="UF:" style="border-style:solid;border-width:1px;" readonly'
                end
            end    
            with object hHtmlNode["DivContainer-4-6"]:=hHtmlNode["DivContainer-4"]+"label"                        
                :text:="IBGE:"
                with object hHtmlNode["DivContainer-4-6-1"]:=hHtmlNode["DivContainer-4-6"]+"input"
                    :attr:='class="form-control" name="ibge" type="text" id="ibge" size="8" placeholder="IBGE:" aria-label="IBGE:" style="border-style:solid;border-width:1px;" readonly'
                end
            end

        end
        
        addHarbourPRGFileAsCodeText(:div,AP_GetEnv("SCRIPT_FILENAME"))

    end

    with object oHTMLDoc:head+"script"
        TEXT INTO :text
/*script*/        
$(document).ready(function() {

            function limpa_formulário_cep() {
                // Limpa valores do formulário de cep.
                $("#rua").val("");
                $("#bairro").val("");
                $("#cidade").val("");
                $("#uf").val("");
                $("#ibge").val("");
            }
           
            // Get the input field
            var input=document.getElementById("cep");
            // Execute a function when the user presses a key on the keyboard
            input.addEventListener("keypress", function(event) {
              // If the user presses the "Enter" key on the keyboard
              if (event.key === "Enter") {
                // Cancel the default action, if needed
                event.preventDefault();
                // Trigger the $("#cep").blur()
                document.getElementById("cep").blur();
              }
            });            
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova variável "cep" somente com dígitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if(validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#rua").val("...");
                        $("#bairro").val("...");
                        $("#cidade").val("...");
                        $("#uf").val("...");
                        $("#ibge").val("...");
                        
                        //Consulta o webservice viacep.com.br/
                        $.getJSON("./02-get-Brazilian-ZipCodeJQueryResult.prg?ZipInputName="+cep, function(dados) {
                            if (!("erro" in dados)) {
                                limpa_formulário_cep();
                                //Atualiza os campos com os valores da consulta.
                                $("#rua").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#cidade").val(dados.localidade);
                                $("#uf").val(dados.uf);
                                $("#ibge").val(dados.ibge);
                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulário_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            });
        });
        ENDTEXT
    end

    cHTML:=oHTMLDoc:toString(-9,4)    
    cHTML:=strTran(cHTML,"><",">"+hb_eol()+"<")

    ??cHTML

    return

{% MH_LoadFile('../pluggins/templates/tHTMLDocumentNew.prg') %}
{% MH_LoadFile('../pluggins/templates/getJsonServerData.prg') %}
{% MH_LoadFile('../pluggins/templates/BootstrapStarterTemplate.prg') %}
{% MH_LoadFile('../pluggins/templates/addHarbourPRGFileAsCodeText.prg') %}
