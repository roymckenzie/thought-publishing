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

$(document).on("change", ".kind-field", function () {
  setupThought($(event.target).val());
})

var thought

$(document).ready(function () {

  thought = {
    imageArea:      $('#featured-image-area'), 
    titleField:     $('#thought_title'),
    summaryField:   $('#thought_summary'),
    bodyField:      $('#thought_body'),
    linkField:      $('#thought_link_attributes_url'),
    kindField:      $('#thought_kind')
  }

  if (thought.kindField != null) {
    setupThought(thought.kindField.val())    
  }

})

function setupThought(kind) {
  switch(kind) {
    case "note": 
      setupNoteThought()
      break
    case "photo":
      setupPhotoThought()
      break
    case "link":
      setupLinkThought()
      break
  }
}

function setupNoteThought() {
  thought.titleField.show()
  thought.summaryField.show()
  thought.linkField.hide()
  thought.imageArea.show()
}

function setupPhotoThought() {
  thought.titleField.show()
  thought.summaryField.show()
  thought.linkField.hide()
  thought.imageArea.show()
}

function setupLinkThought() {
  thought.titleField.show()
  thought.summaryField.hide()
  thought.linkField.show()
  thought.imageArea.hide()
}



