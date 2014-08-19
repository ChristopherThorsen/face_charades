function useLetterbank() {
  $(document).ready(function(){
    var $letterbank = $(".letterbank");
    var counter = 0;

    $letterbank.click(function(){
      if ($("#space-" + counter).length != 0) {
        $(this).hide();
        $("#space-" + counter).text($(this).text());
        $("#answer").val($("#answer").val() + $(this).text());
        counter += 1;
      };
    });
  });
};
