$(document).ready(function() {
    $("#table-categories").dataTable();
    $(".book_audio").bind('contextmenu', function() {
        return false;
    });
    $(".about_video").bind('contextmenu', function() {
        return false;
    });
    $(".modal-body").bind('contextmenu', function() {
        return false;
    });
    $(".project_video").bind('contextmenu', function() {
        return false;
    });
    $(".project_audio").bind('contextmenu', function() {
        return false;
    });
    $(document).on('change', '#address_country', function(e) {
        country = $("#address_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#country_code").val("+" + result["country_code_mob"]);
            }
        });
    });

    $(document).on('change', '#sub_cnrty_code_country', function(e) {
        country = $("#sub_cnrty_code_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#sub_country_code").val("+" + result["country_code_mob"]);
            }
        });
    });

    $(document).on('change', '#request_country_code1_country', function(e) {
        country = $("#request_country_code1_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#code_id1").val("+" + result["country_code_mob"]);
            }
        });
    });

    $(document).on('change', '#request_country_code2_country', function(e) {
        country = $("#request_country_code2_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#code_id2").val("+" + result["country_code_mob"]);
            }
        });
    });

    $(document).on('change', '#request_country_code3_country', function(e) {
        country = $("#request_country_code3_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#code_id3").val("+" + result["country_code_mob"]);
            }
        });
    });

    $(document).on('change', '#request_country_code4_country', function(e) {
        country = $("#request_country_code4_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#code_id4").val("+" + result["country_code_mob"]);
            }
        });
    });

    $(document).on('change', '#request_country_code5_country', function(e) {
        country = $("#request_country_code5_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#code_id5").val("+" + result["country_code_mob"]);
            }
        });
    });

    $(document).on('change', '#request_country_code6_country', function(e) {
        country = $("#request_country_code6_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#code_id6").val("+" + result["country_code_mob"]);
            }
        });
    });

    $(document).on('change', '#request_country_code7_country', function(e) {
        country = $("#request_country_code7_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#code_id7").val("+" + result["country_code_mob"]);
            }
        });
    });

    $(document).on('change', '#request_country_code8_country', function(e) {
        country = $("#request_country_code8_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#code_id8").val("+" + result["country_code_mob"]);
            }
        });
    });


    $(document).on('change', '#sub_cnrty_code_pa_country', function(e) {
        country = $("#sub_cnrty_code_pa_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#sub_country_code_pa").val("+" + result["country_code_mob"]);
            }
        });
    });


    $(document).on('change', '#reg_cnrty_code_country', function(e) {
        country = $("#reg_cnrty_code_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#reg_contr_code_id").val("+" + result["country_code_mob"]);
            }
        });
    });
    $(document).on('change', '#mobile_code_country', function(e) {
        country = $("#mobile_code_country").val();
        $.ajax({
            type: "GET",
            url: "/change_country_code/" + country,
            dataType: "json",
            data: {},
            success: function(result) {
                $("#admin_mob_email_code").val("+" + result["country_code_mob"]);
            }
        });
    });


    $('#txt_book_ebook').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 2) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
        if ((text.indexOf('.') != -1) &&
            (text.substring(text.indexOf('.')).length > 2) &&
            (event.which != 0 && event.which != 8) &&
            ($(this)[0].selectionStart >= text.length - 2)) {
            event.preventDefault();
        }
    });


    $('#address_mobile').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });


    $('#sub_mob_no_id').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });

    $('#mobile_id1').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });

    $('#mobile_id2').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });

    $('#mobile_id3').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });


    $('#admin_mob_email_admin_mobile_no').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });


    $('#mobile_id4').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });

    $('#mobile_id5').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });


    $('#mobile_id6').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });

    $('#mobile_id7').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });

    $('#mobile_id8').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });

    $('#txt_col_book_hardcover').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 2) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
        if ((text.indexOf('.') != -1) &&
            (text.substring(text.indexOf('.')).length > 2) &&
            (event.which != 0 && event.which != 8) &&
            ($(this)[0].selectionStart >= text.length - 2)) {
            event.preventDefault();
        }
    });


    $('#sponsor_phone').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });



    $('#order_otp').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });

    $('#sub_mob_no_id_pa').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 0));
                }
            }, 1);
        }
    });


    $('#txt_col_paperback').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 2) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
        if ((text.indexOf('.') != -1) &&
            (text.substring(text.indexOf('.')).length > 2) &&
            (event.which != 0 && event.which != 8) &&
            ($(this)[0].selectionStart >= text.length - 2)) {
            event.preventDefault();
        }
    });

    $('#txt_bnw_book_hardcover').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 2) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
        if ((text.indexOf('.') != -1) &&
            (text.substring(text.indexOf('.')).length > 2) &&
            (event.which != 0 && event.which != 8) &&
            ($(this)[0].selectionStart >= text.length - 2)) {
            event.preventDefault();
        }
    });

    $('#txt_bnw_book_paperback').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 2) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
        if ((text.indexOf('.') != -1) &&
            (text.substring(text.indexOf('.')).length > 2) &&
            (event.which != 0 && event.which != 8) &&
            ($(this)[0].selectionStart >= text.length - 2)) {
            event.preventDefault();
        }
    });

    $('#txt_book_audio').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 2) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
        if ((text.indexOf('.') != -1) &&
            (text.substring(text.indexOf('.')).length > 2) &&
            (event.which != 0 && event.which != 8) &&
            ($(this)[0].selectionStart >= text.length - 2)) {
            event.preventDefault();
        }
    });



    $('#contact_phone').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
    });


    $('#card_no_id').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
    });

    $('#card_cvv_id').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
    });

    $('#card_expiration_date_id').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
    });

    $('#card_expiration_date').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
    });

    $('#card_exp_date_id').keypress(function(event) {
        var $this = $(this);
        if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }
        var text = $(this).val();
        if ((event.which == 46) && (text.indexOf('.') == -1)) {
            setTimeout(function() {
                if ($this.val().substring($this.val().indexOf('.')).length > 0) {
                    $this.val($this.val().substring(0, $this.val().indexOf('.') + 2));
                }
            }, 1);
        }
    });


    $("#btn_sub_submit").click(function(evt) {

        var $phon_no = $("#sub_country_code").val() + $("#sub_mob_no_id").val();
        var $email = $("#sub_email_id").val();
        var phoneReg = /^\+(?:[0-9] ?){7,15}[0-9]$/;
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

        if ($("#card_no_id").val() == "") {
            $("#card_blank_error").removeClass("card_blank_error");
            $("#card_blank_error").text("Card detail can't be blank.");
            evt.preventDefault();
        } else {
            $("#card_blank_error").addClass("card_blank_error");
        }

        if ($("#card_cvv_id").val() == "") {
            $("#cvv_blank_error").removeClass("cvv_blank_error");
            $("#cvv_blank_error").text("CVV can't be blank.");
            evt.preventDefault();
        } else {
            $("#cvv_blank_error").addClass("cvv_blank_error");
        }

        if ($("#card_expiration_date_id").val() == "") {
            $("#exp_blank_error").removeClass("exp_blank_error");
            $("#exp_blank_error").text("Expiration Date can't be blank.");
            evt.preventDefault();
        } else {
            $("#exp_blank_error").addClass("exp_blank_error");
        }

        if ($("#sub_cnrty_code_country").val() == "") {
            $("#sub_country_error").removeClass("sub_country_error");
            $("#sub_country_error").text("Please select Country.");
            evt.preventDefault();
        } else {
            $("#sub_country_error").addClass("sub_country_error");
        }

        if ($email == "") {
            $("#email_blank_error").removeClass("email_blank_error");
            $("#email_blank_error").text("Field can't be blank.");
            evt.preventDefault();
        } else {
            $("#email_blank_error").addClass("email_blank_error");
        }

        if (!emailReg.test($email) && $email != "") {
            $("#sub_email_error").removeClass("sub_email_error");
            $("#sub_email_error").text("Invalid email Id.");
            evt.preventDefault();
        } else {
            $("#sub_email_error").addClass("sub_email_error");
        }

        if ($("#sub_mob_no_id").val() == "") {
            $("#mobile_blnk_error").removeClass("mobile_blnk_error");
            $("#mobile_blnk_error").text("Field can't be blank");
            evt.preventDefault();
        } else {
            $("#mobile_blnk_error").addClass("mobile_blnk_error");
        }

        if (!phoneReg.test($phon_no) && $("#sub_mob_no_id").val() != "") {
            $("#mobile_no_error").removeClass("mobile_no_error");
            $("#mobile_no_error").text("Invalid mobile number.");
            evt.preventDefault();
        } else {
            $("#mobile_no_error").addClass("mobile_no_error");
        }

    });


    $("#btn_sub_submit_pa").click(function(evt) {

        var $phon_no = $("#sub_country_code_pa").val() + $("#sub_mob_no_id_pa").val();
        var $email = $("#sub_email_id_pa").val();
        var phoneReg = /^\+(?:[0-9] ?){7,15}[0-9]$/;
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

        if ($("#sub_cnrty_code_pa_country").val() == "") {
            $("#sub_country_error_pa").removeClass("sub_country_error_pa");
            $("#sub_country_error_pa").text("Please select Country.");
            evt.preventDefault();
        } else {
            $("#sub_country_error_pa").addClass("sub_country_error_pa");
        }

        if ($email == "") {
            $("#email_blank_error_pa").removeClass("email_blank_error_pa");
            $("#email_blank_error_pa").text("Email field can't be blank.");
            evt.preventDefault();
        } else {
            $("#email_blank_error_pa").addClass("email_blank_error_pa");
        }

        if (!emailReg.test($email) && $email != "") {
            $("#sub_email_error_pa").removeClass("sub_email_error_pa");
            $("#sub_email_error_pa").text("Invalid email Id.");
            evt.preventDefault();
        } else {
            $("#sub_email_error_pa").addClass("sub_email_error_pa");
        }

        if ($("#sub_mob_no_id_pa").val() == "") {
            $("#mobile_blnk_error_pa").removeClass("mobile_blnk_error_pa");
            $("#mobile_blnk_error_pa").text("Mobile No. field can't be blank");
            evt.preventDefault();
        } else {
            $("#mobile_blnk_error_pa").addClass("mobile_blnk_error_pa");
        }

        if (!phoneReg.test($phon_no) && $("#sub_mob_no_id_pa").val() != "") {
            $("#mobile_no_error_pa").removeClass("mobile_no_error_pa");
            $("#mobile_no_error_pa").text("Invalid mobile number.");
            evt.preventDefault();
        } else {
            $("#mobile_no_error_pa").addClass("mobile_no_error_pa");
        }

    });


    $("#contact_content").attr("placeholder", "*Type your comment...");
    $("#btn_contact_submit").click(function(evt) {
        if ($("#contact_name").val() == "") {
            $("#cont_name_error").removeClass("cont_name_error");
            evt.preventDefault();
        } else {
            $("#cont_name_error").addClass("cont_name_error");
        }
        if ($("#contact_email").val() == "") {
            $("#cont_email_error").removeClass("cont_email_error");
            evt.preventDefault();
        } else {
            $("#cont_email_error").addClass("cont_email_error");
        }
        if ($("#contact_phone").val() == "") {
            $("#cont_phone_error").removeClass("cont_phone_error");
            evt.preventDefault();
        } else {
            $("#cont_phone_error").addClass("cont_phone_error");
        }
        if ($("#contact_content").val() == "") {
            $("#cont_content_error").removeClass("cont_content_error");
            evt.preventDefault();
        } else {
            $("#cont_content_error").addClass("cont_content_error");
        }

    });

});