// Though Featured Image Upload Button
$(document).on("click", ".upload-image-button", function () {
  $(".upload-image-field").click();
  event.preventDefault()
});

$(document).on("change", ".upload-image-field", function () {
  var fileName  = $(this).val();
  var lastIndex = fileName.lastIndexOf("\\")
  if (lastIndex >= 0) {
    fileName = fileName.substring(lastIndex + 1)
  }
  $(".upload-image-button").html(fileName)
});