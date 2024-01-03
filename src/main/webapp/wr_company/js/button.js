function handleSelectChange(selectElement) {
  console.log("Select changed");
  var deleteButton = selectElement.parentNode.querySelector('.delete_button');
  deleteButton.style.display = (selectElement.value === 'data3') ? 'block' : 'none';
  console.log("Delete button display:", deleteButton.style.display);
}

function handleDelete() {
  var result = confirm("本当に削除しますか？");
  if (result) {
   
    alert("削除されました.");
    
  } else {
   
    alert("削除せずに帰ります.");
  }
}
