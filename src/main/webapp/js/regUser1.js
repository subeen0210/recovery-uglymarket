function displayFileName(input) {
  const fileName = input.files[0].name;
  $(".upload-img").val(fileName);
}
