$(function () {

    Contatos ={
        checar_ultimo_preenchido: function () {
            var inputs = [];

            $.each($("input[type='text']"), function(){
                if(this.value != ""){
                    inputs.push(this);
                }
            });
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
            if($("#historico_id").val() === ""){
                return false;
            }

            $.ajax({
                url: '/contatos/render_lista',
                data: {
                    historico_id: $("#historico_id").val()
                }
            })
            .done(function(result) {
                $("#lista_contatos").html(result);
            });
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

        $("#editar_segmentacao").removeClass('hidden');
        Contatos.render_lista();
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

$(document).on('turbolinks:load', function() {
    $(".item-segmentacao.bg-info").trigger('click');

    if($("#historico_id").length === 0 ){
        return false;
    }
    setInterval(function () {
        Contatos.render_lista();
    }, 5000);
});
