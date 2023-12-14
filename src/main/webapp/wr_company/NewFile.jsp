<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Reviews</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Product Reviews</h1>
    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Review Text</th>
            </tr>
        </thead>
        <tbody id="reviewTableBody">
            <!-- Product reviews will be added here dynamically -->
        </tbody>
    </table>

    <script>
        // Mock data for demonstration purposes
        const productReviews = [
            { productName: 'Product A', reviewText: 'Great product!' },
            { productName: 'Product B', reviewText: 'Not bad, but could be better.' },
            { productName: 'Product C', reviewText: 'Excellent quality.' },
            // Add more mock reviews as needed
        ];

        // Function to dynamically add product reviews to the table
        function renderProductReviews() {
            const tableBody = document.getElementById('reviewTableBody');

            // Clear existing rows
            tableBody.innerHTML = '';

            // Add new rows based on the productReviews array
            productReviews.forEach(review => {
                const row = `<tr>
                                <td>${review.productName}</td>
                                <td>${review.reviewText}</td>
                             </tr>`;
                tableBody.innerHTML += row;
            });
        }

        // Call the function to render product reviews on page load
        renderProductReviews();
    </script>
</body>
</html>