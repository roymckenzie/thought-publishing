// Though Featured Image Upload Button
$(document).on("click", ".upload-image-button", function () {
  $(".upload-image-field").click();
  event.preventDefault()
});

// Update button text to show file name
$(document).on("change", ".upload-image-field", function () {
  var fileName  = $(this).val();
  var lastIndex = fileName.lastIndexOf("\\")
  if (lastIndex >= 0) {
    fileName = fileName.substring(lastIndex + 1)
  }
  $(".upload-image-button").html(fileName)
});

// Close Foundation alerts after 4 seconds
window.setTimeout(function () {
  $(".alert-box a.close").trigger("click.fndtn.alert")
}, 4000)