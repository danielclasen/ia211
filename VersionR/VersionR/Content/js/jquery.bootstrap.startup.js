$(document).ready(function () {
    $(function () {
        $("input, select, textarea").not("[type=submit]").jqBootstrapValidation();
        $("input[required], select[required]").each(function () {
            var $wrapper = $("<div></div>").addClass("input-append");

            if ($(this).attr('type') == "file") {
                $wrapper.addClass("input-prepend");
            }

            $(this).wrap($wrapper);
            $(this).after($('<span>*</span>').addClass("add-on").css('line-height', '25px'));
            $(this).width(function (i, w) { return w - 28; });
        });
        $(".input-currency").each(function () {
            var $input = $(this);

            $input.maskMoney({ symbol: '€ ', thousands: '.', precision: 0, symbolStay: true });

            if ($input.val() == 0 || $input.val() == '0') {
                $input.val('');
            } else {
                $input.trigger('mask');
            }

            $(this).closest("form").on("submit", function () {
                var value = $input.val();
                value = value.replace('€', '');
                value = value.replace('.', '');
                value = $.trim(value);
                $input.val(value);
            });
        });

        $(".datepicker").datepicker({
            format: "dd.mm.yyyy",
            todayBtn: "linked",
            language: "de",
            todayHighlight: true
        });

        $('input[type=file]').bootstrapFileInput();

        $('.texteditor').each(function () {
            $(this).wysiwyg();
        });
    });
})