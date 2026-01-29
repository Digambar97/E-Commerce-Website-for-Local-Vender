<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>LeLo | Order Management</title>
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
      <h1 class="text-5xl font-black tracking-tight">Order Management</h1>
      <p class="mt-4 text-gray-300">Track marketplace transactions and manage fulfillment status</p>
    </div>
  </div>
</section>

<section class="container mx-auto px-4 py-16">

  <div class="bg-white rounded-[2rem] shadow overflow-hidden">
    <table class="w-full">
      <thead class="bg-gray-100">
      <tr>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">ID</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Customer</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Total Amount</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Payment</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Order Status</th>
        <th class="px-8 py-5 text-center text-xs font-black uppercase tracking-widest text-gray-500">Date</th>
      </tr>
      </thead>

      <tbody class="divide-y">
      <c:forEach items="${orders}" var="o">
        <tr class="hover:bg-gray-50 transition">
          <td class="px-8 py-5 font-bold text-gray-400">#ORD-${o.id}</td>
          <td class="px-8 py-5 font-bold">${o.user.name}</td>
          <td class="px-8 py-5 font-black text-indigo-600">₹ ${o.totalAmount}</td>

          <td class="px-8 py-5">
            <c:choose>
              <c:when test="${o.paymentStatus == 'PAID'}">
                <span class="text-green-600 font-bold uppercase text-xs">Paid</span>
              </c:when>
              <c:when test="${o.paymentStatus == 'FAILED'}">
                <span class="text-red-600 font-bold uppercase text-xs">Failed</span>
              </c:when>
              <c:otherwise>
                <span class="text-amber-600 font-bold uppercase text-xs">Pending</span>
              </c:otherwise>
            </c:choose>
          </td>

          <td class="px-8 py-5 uppercase font-bold text-xs tracking-wider text-indigo-500">
              ${o.orderStatus}
          </td>

          <td class="px-8 py-5 text-center text-gray-500 text-sm">
              ${o.createdAt}
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

    <c:if test="${empty orders}">
      <div class="py-20 text-center text-gray-400 font-bold">
        No orders found in the system
      </div>
    </c:if>
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