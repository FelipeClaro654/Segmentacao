$(function () {

    Contatos ={
        checar_ultimo_preenchido: function () {
            var inputs = [];

            $.each($("p input"), function(){
                if(this.value != ""){
                    inputs.push(this);
                }
            });
            debugger;
            if(inputs.length > 0){
                var input_id = $(inputs[inputs.length-1])[0].id;
                if($("#f_estado").val() != ""){
                    return true;
                }
                $("[data-input='"+input_id+"']").val("");
                return true;
            }
            return false;
        },
        render_lista: function () {
                /*setInterval(function () {

                if(!Contatos.checar_ultimo_preenchido()){
                    return false;
                }

                $.ajax({
                    url: '/contatos/render_lista',
                    data: {
                        f_tipo_nome: $("#f_tipo_nome").val(),
                        f_nome: $("#f_nome").val(),
                        f_clause_nome: $("#f_clause_nome").val(),
                        f_tipo_email: $("#f_tipo_email").val(),
                        f_email: $("#f_email").val(),
                        f_clause_email: $("#f_clause_email").val(),
                        f_tipo_idade: $("#f_tipo_idade").val(),
                        f_idade: $("#f_idade").val(),
                        f_clause_idade: $("#f_clause_idade").val(),
                        f_tipo_cargo: $("#f_tipo_cargo").val(),
                        f_cargo: $("#f_cargo").val(),
                        f_clause_cargo: $("#f_clause_cargo").val(),
                        f_estado: $("#f_estado").val(),
                        no_saving: true
                    }
                })
                .done(function(result) {
                    $("#lista_contatos").html(result);
                })
            }, 1000);*/
        }
    }

    $(document).on("click", ".item-segmentacao", function() {
        $(".item-segmentacao.bg-info").removeClass('bg-info');
        var item = $(this);
        $("#f_tipo_nome").val(item.find("[data-tipo-nome]").data("tipo-nome"));
        $("#f_nome").val(item.find("[data-nome]").data("nome"));
        $("#f_clause_nome").val(item.find("[data-clause-nome]").data("clause-nome"));
        $("#f_tipo_email").val(item.find("[data-tipo-email]").data("tipo-email"));
        $("#f_email").val(item.find("[data-email]").data("email"));
        $("#f_clause_email").val(item.find("[data-clause-email]").data("clause-email"));
        $("#f_tipo_idade").val(item.find("[data-tipo-idade]").data("tipo-idade"));
        $("#f_idade").val(item.find("[data-idade]").data("idade"));
        $("#f_clause_idade").val(item.find("[data-clause-idade]").data("clause-idade"));
        $("#f_tipo_cargo").val(item.find("[data-tipo-cargo]").data("tipo-cargo"));
        $("#f_cargo").val(item.find("[data-cargo]").data("cargo"));
        $("#f_clause_cargo").val(item.find("[data-clause-cargo]").data("clause-cargo"));
        $("#f_estado").val(item.find("[data-estado]").data("estado"));
        item.addClass('bg-info');
        $("#historico_id").val(item.data("id"));

        $("#editar_segmentacao").removeClass('hidden')
    });

    $(document).on("click", "#remove_id_segmentacao", function () {
        $(".item-segmentacao.bg-info").removeClass('bg-info');
        $("#historico_id").val("");

        $.each($("#segmentacao_form select"), function () {
            $(this).find("option:first").prop("selected", true)
        })

        $("#editar_segmentacao").addClass('hidden');
        $("#segmentacao_form input").val("");
    });

    $(document).on("click","#nova_segmentacao", function (e) {
        e.preventDefault();
        $("#historico_id").val("");
        if(Contatos.checar_ultimo_preenchido()){
            $("#segmentacao_form").submit();
        }
    });

    $(document).on("click", "#editar_segmentacao", function (e) {
        e.preventDefault();
        if(Contatos.checar_ultimo_preenchido()){
            $("#segmentacao_form").submit();
        }
    });
});

$(document).on('ready page:load', function() {
    $(".item-segmentacao.bg-info").trigger('click');
    Contatos.render_lista();
});
