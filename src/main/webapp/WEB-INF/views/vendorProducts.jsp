<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LeLo | Vendor Products</title>

    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        [x-cloak] { display: none !important; }
    </style>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<!-- ✅ HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- ✅ PRODUCT LIST -->
<div class="container mx-auto px-4 py-20">
    <div class="bg-white p-10 rounded-[2.5rem] shadow-2xl">

        <h2 class="text-4xl font-black mb-10 text-gray-900 text-center">
            Your Products
        </h2>

        <!-- ✅ TABLE -->
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white border border-gray-200 rounded-xl overflow-hidden">
                <thead class="bg-gray-900 text-white">
                <tr>
                    <th class="py-4 px-6 text-left">ID</th>
                    <th class="py-4 px-6 text-left">Name</th>
                    <th class="py-4 px-6 text-left">Price</th>
                    <th class="py-4 px-6 text-left">Discount</th>
                    <th class="py-4 px-6 text-left">Status</th>
                    <th class="py-4 px-6 text-left">Stock</th>
                    <th class="py-4 px-6 text-left">Actions</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="p" items="${products}">
                    <tr class="border-b hover:bg-gray-100 transition">
                        <td class="py-4 px-6">${p.id}</td>
                        <td class="py-4 px-6">${p.name}</td>
                        <td class="py-4 px-6">₹${p.price}</td>
                        <td class="py-4 px-6">${p.discount}%</td>
                        <td class="py-4 px-6">${p.status}</td>
                        <td class="py-4 px-6">${p.stock}</td>

                        <td class="py-4 px-6 flex gap-3">
                            <a href="${pageContext.request.contextPath}/editProduct/${p.id}"
                               class="bg-indigo-600 text-white px-4 py-2 rounded-lg hover:bg-indigo-700">
                                Edit
                            </a>

                            <a href="${pageContext.request.contextPath}/deleteProduct/${p.id}"
                               class="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700">
                                Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>

    </div>
</div>

<!-- ✅ FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>