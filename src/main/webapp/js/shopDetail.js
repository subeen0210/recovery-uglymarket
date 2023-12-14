function incrementQuantity() {
            var quantityInput = document.getElementById("quantityInput");
            var currentQuantity = parseInt(quantityInput.value, 10);
            
            // 상품 수량 증가
            quantityInput.value = currentQuantity + 1;
        }

        function decrementQuantity() {
            var quantityInput = document.getElementById("quantityInput");
            var currentQuantity = parseInt(quantityInput.value, 10);
            
            // 최소 수량은 1로 설정
            if (currentQuantity > 1) {
                // 상품 수량 감소
                quantityInput.value = currentQuantity - 1;
            }
        }
