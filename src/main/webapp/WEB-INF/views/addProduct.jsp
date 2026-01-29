<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LeLo | Add Product</title>

    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Alpine.js -->
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>

    <style>
        [x-cloak] { display: none !important; }
    </style>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<!-- ✅ HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- ✅ ADD PRODUCT FORM -->
<div class="container mx-auto px-4 py-20">
    <div class="max-w-2xl mx-auto bg-white p-10 rounded-[2.5rem] shadow-2xl">

        <h2 class="text-4xl font-black mb-10 text-gray-900 text-center">
            Add New Product
        </h2>

     <form action="${pageContext.request.contextPath}/addNewProduct" method="post"
           class="flex flex-col gap-6">

         <!-- Category ID -->
         <input type="number" name="categoryId" placeholder="Category ID"
                class="bg-gray-100 px-6 py-4 rounded-xl">

         <!-- Product Name -->
         <input type="text" name="name" placeholder="Product Name"
                class="bg-gray-100 px-6 py-4 rounded-xl">

         <!-- Description -->
         <textarea name="description" placeholder="Description"
                   class="bg-gray-100 px-6 py-4 rounded-xl"></textarea>

         <!-- Price -->
         <input type="number" step="0.01" name="price" placeholder="Price"
                class="bg-gray-100 px-6 py-4 rounded-xl">

         <!-- Discount -->
         <input type="number" step="0.01" name="discount" placeholder="Discount"
                class="bg-gray-100 px-6 py-4 rounded-xl">

         <!-- Status -->
         <select name="status" class="bg-gray-100 px-6 py-4 rounded-xl">
             <option value="ACTIVE">Active</option>
             <option value="OUT_OF_STOCK">Out of Stock</option>
             <option value="BLOCKED">Blocked</option>
         </select>

         <!-- Stock -->
         <input type="number" name="stock" placeholder="Stock"
                class="bg-gray-100 px-6 py-4 rounded-xl">

         <!-- Image URL -->
         <input type="text" name="imageUrl" placeholder="Product Image URL"
                class="bg-gray-100 px-6 py-4 rounded-xl">

         <button class="bg-indigo-600 text-white py-4 rounded-2xl font-bold">
             Add Product
         </button>
     </form>


    </div>
</div>

<!-- ✅ FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>