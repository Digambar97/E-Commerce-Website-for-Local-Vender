<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>LeLo | Vendor Management</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <script src="https://cdn.tailwindcss.com"></script>

  <style>
    .hero-gradient {
      background: linear-gradient(to right,
      rgba(0,0,0,0.85),
      rgba(0,0,0,0.25));
    }
  </style>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="container mx-auto px-4 mt-6">
  <div class="relative w-full h-[220px] rounded-[2.5rem] overflow-hidden shadow-2xl bg-black">
    <div class="absolute inset-0 hero-gradient flex flex-col justify-center px-12 text-white">
      <h1 class="text-5xl font-black tracking-tight">Vendor Management</h1>
      <p class="mt-4 text-gray-300">Approve new sellers or manage existing vendor permissions</p>
    </div>
  </div>
</section>

<section class="container mx-auto px-4 py-16">

  <div class="bg-white rounded-[2rem] shadow overflow-hidden">

    <table class="w-full">
      <thead class="bg-gray-100">
      <tr>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">ID</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Username</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Email</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Business Status</th>
        <th class="px-8 py-5 text-center text-xs font-black uppercase tracking-widest text-gray-500">Administrative Action</th>
      </tr>
      </thead>

      <tbody class="divide-y">

      <c:forEach items="${vendors}" var="v">
        <tr class="hover:bg-gray-50 transition">

          <td class="px-8 py-5 font-bold">${v.id}</td>
          <td class="px-8 py-5 font-medium text-slate-700">${v.username}</td>
          <td class="px-8 py-5">${v.email}</td>

          <td class="px-8 py-5">
            <c:choose>
              <c:when test="${v.active}">
                <span class="text-green-600 font-bold uppercase text-xs tracking-wider">Active / Approved</span>
              </c:when>
              <c:otherwise>
                <span class="text-amber-600 font-bold uppercase text-xs tracking-wider">Blocked / Pending</span>
              </c:otherwise>
            </c:choose>
          </td>

          <td class="px-8 py-5 text-center">
            <c:choose>
              <c:when test="${v.active}">
                <form action="${pageContext.request.contextPath}/admin/vendors/toggle-status/${v.id}" method="post">
                  <button
                          class="bg-rose-500 text-white px-6 py-2 rounded-xl font-bold
                                 hover:bg-rose-600 transition shadow-sm">
                    Block Vendor
                  </button>
                </form>
              </c:when>
              <c:otherwise>
                <form action="${pageContext.request.contextPath}/admin/vendors/toggle-status/${v.id}" method="post">
                  <button
                          class="bg-indigo-600 text-white px-6 py-2 rounded-xl font-bold
                                 hover:bg-indigo-700 transition shadow-sm">
                    Approve Vendor
                  </button>
                </form>
              </c:otherwise>
            </c:choose>
          </td>

        </tr>
      </c:forEach>

      </tbody>
    </table>

    <c:if test="${empty vendors}">
      <div class="py-20 text-center text-gray-400 font-bold">
        No vendors found in the system
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