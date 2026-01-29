<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>LeLo | Inventory Management</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    .hero-gradient {
      background: linear-gradient(to right, rgba(0,0,0,0.85), rgba(0,0,0,0.25));
    }
  </style>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="container mx-auto px-4 mt-6">
  <div class="relative w-full h-[220px] rounded-[2.5rem] overflow-hidden shadow-2xl bg-black">
    <div class="absolute inset-0 hero-gradient flex flex-col justify-center px-12 text-white">
      <h1 class="text-5xl font-black tracking-tight">Inventory Tracking</h1>
      <p class="mt-4 text-gray-300">Monitor stock levels and manage product quantities across all vendors</p>
    </div>
  </div>
</section>

<section class="container mx-auto px-4 py-16">
  <div class="bg-white rounded-[2rem] shadow overflow-hidden">
    <table class="w-full">
      <thead class="bg-gray-100">
      <tr>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">SKU/ID</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Product Name</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Current Stock</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Alert Status</th>
        <th class="px-8 py-5 text-center text-xs font-black uppercase tracking-widest text-gray-500">Action</th>
      </tr>
      </thead>

      <tbody class="divide-y">
      <c:forEach items="${inventoryItems}" var="item">
        <tr class="hover:bg-gray-50 transition">
          <td class="px-8 py-5 font-bold text-gray-400">#PROD-${item.id}</td>
          <td class="px-8 py-5 font-bold">${item.name}</td>
          <td class="px-8 py-5 font-black text-indigo-600">${item.quantity} Units</td>

          <td class="px-8 py-5">
            <c:choose>
              <c:when test="${item.quantity <= 5}">
                <span class="bg-red-100 text-red-700 px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-widest border border-red-200">Low Stock</span>
              </c:when>
              <c:otherwise>
                <span class="bg-green-100 text-green-700 px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-widest border border-green-200">Healthy</span>
              </c:otherwise>
            </c:choose>
          </td>

          <td class="px-8 py-5 text-center">
            <a href="${pageContext.request.contextPath}/admin/editProduct/${item.id}"
               class="bg-gray-900 text-white px-6 py-2 rounded-xl font-bold hover:bg-black transition text-xs">
              Update Stock
            </a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>

  <div class="mt-8">
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="text-indigo-600 font-bold hover:underline">
      &larr; Return to Dashboard
    </a>
  </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>