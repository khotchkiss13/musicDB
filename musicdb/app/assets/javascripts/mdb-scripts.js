$(function() {
    $(document).on("click",function (e) {
      console.log(e.target.id);
      if ($("#member-form").is(":visible") && e.target.id=="member-checkbox") {
        $("#member-form").hide();
      }
      else if (e.target.id=="member-checkbox") {
        $("#member-form").show();
      }
      else if (e.target.id=="submit-button") {
        $("#submit-note").show();
      }
      else if (e.target.id=="submit-ok") {
        $("#submit-note").hide();
      }
    });
  });