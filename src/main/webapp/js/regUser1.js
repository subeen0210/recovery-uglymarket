function displayFileName(input) {
  const fileName = input.files[0].name;
  document.getElementById('fileNameDisplay').textContent = fileName;
}