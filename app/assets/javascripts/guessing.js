function useLetterbank() {
  $(document).ready(function(){
    var $letterbank = $(".letterbank");
    var counter = 0;

    $letterbank.click(function(){
      var $blankSpace = $("#space-" + counter);
      if ($blankSpace.length != 0) {
        $(this).hide();
        $blankSpace.text($(this).text());
        $("#answer").val($("#answer").val() + $(this).text());
        counter += 1;
      };
    });
  });
};
