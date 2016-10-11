// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
(function() {
  var createStorageKey, host, uploadAttachment;

  document.addEventListener("trix-attachment-add", function(event) {
    var attachment;
    attachment = event.attachment;
    if (attachment.file) {
      return uploadAttachment(attachment);
    }
  });

  host = "/images";

  uploadAttachment = function(attachment) {
    var file, form, xhr;
    file = attachment.file;
    key = createStorageKey(file);
    form = new FormData;
    form.append("Content-Type", file.type);
    form.append("image[picture]", file);
    xhr = new XMLHttpRequest;
    xhr.open("POST", host, true);
    xhr.upload.onprogress = function(event) {
      var progress;
      progress = event.loaded / event.total * 100;
      return attachment.setUploadProgress(progress);
    };
    xhr.onload = function() {
      var href, url;
      url = href = JSON.parse(this.responseText).url;
      return attachment.setAttributes({
        url: url,
        href: href
      });
    };
    return xhr.send(form);


  };

  createStorageKey = function(file) {
    var date, day, time;
    date = new Date();
    day = date.toISOString().slice(0, 10);
    time = date.getTime();
    return "tmp/" + day + "/" + time + "-" + file.name;
  };

}).call(this);
