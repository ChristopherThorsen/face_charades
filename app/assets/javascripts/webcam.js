function useWebcam() {
  $(document).ready(function() {
      var video = $("#videoElement");
      var takePhotoButton = $("#take-photo");
      var canvas = document.getElementById("canvas");
      var width = 640;
      var height = 480;
      navigator.getUserMedia = compatibleGetUserMedia();

      if (navigator.getUserMedia) {
        navigator.getUserMedia({video: true}, handleVideo, videoError);
      }

      function handleVideo(stream) {
        video.prop("src", window.URL.createObjectURL(stream));
        console.log(video);
      }

      function videoError(e) {
      }

      function takePicture() {
        canvas.width = width;
        canvas.height = height;
        canvas.getContext('2d').drawImage(video[0], 0, 0);
        var data = canvas.toDataURL('image/png');
        var photoURL = $("#photo_url");
        photoURL.val(data);
      }

      $(takePhotoButton).click(function(event){
        takePicture();
        event.preventDefault();
      });
  });
}

function compatibleGetUserMedia(){
  return navigator.getUserMedia ||
    navigator.webkitGetUserMedia || 
    navigator.mozgetUserMedia || 
    navigator.msGetUserMedia || 
    navigator.oGetUserMedia;
}
