// modal 열기
document.getElementById('password-change-button').addEventListener('click', function() {
    document.getElementById('password-modal').showModal();
});

// modal 닫기
document.getElementById('close-button').addEventListener('click', function() {
    document.getElementById('password-modal').close();
});

