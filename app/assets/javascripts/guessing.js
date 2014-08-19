function useLetterbank() {
  $(document).ready(function(){
    var $letterbank = $(".letterbank");
    var counter = 0;

    $letterbank.click(function(){
      $(this).hide();
      $("#space-" + counter).text($(this).text());
      $("#answer").val($("#answer").val() + $(this).text());
      counter += 1;
      if ($("space-" + counter).length == 0) {
        console.log("done");
      }
    });
  });
};
