function handleSelectChange(selectElement) {
  console.log("Select changed");
  var deleteButton = selectElement.parentNode.querySelector('.delete_button');
  deleteButton.style.display = (selectElement.value === 'data3') ? 'block' : 'none';
  console.log("Delete button display:", deleteButton.style.display);
}

function handleDelete() {
  var result = confirm("정말 삭제하시겠습니까?");
  if (result) {
   
    alert("삭제되었습니다.");
    
  } else {
   
    alert("삭제가 취소되었습니다.");
  }
}
