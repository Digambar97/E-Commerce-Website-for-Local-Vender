<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>LeLo | User Management</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Tailwind CSS -->
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

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- HERO SECTION -->
<section class="container mx-auto px-4 mt-6">
  <div class="relative w-full h-[220px] rounded-[2.5rem] overflow-hidden shadow-2xl bg-black">
    <div class="absolute inset-0 hero-gradient flex flex-col justify-center px-12 text-white">
      <h1 class="text-5xl font-black tracking-tight">User Management</h1>
      <p class="mt-4 text-gray-300">View, block or unblock users</p>
    </div>
  </div>
</section>

<!-- USERS TABLE -->
<section class="container mx-auto px-4 py-16">

  <div class="bg-white rounded-[2rem] shadow overflow-hidden">

    <table class="w-full">
      <thead class="bg-gray-100">
      <tr>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">ID</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Name</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Email</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Role</th>
        <th class="px-8 py-5 text-left text-xs font-black uppercase tracking-widest text-gray-500">Status</th>
        <th class="px-8 py-5 text-center text-xs font-black uppercase tracking-widest text-gray-500">Action</th>
      </tr>
      </thead>

      <tbody class="divide-y">

      <c:forEach items="${users}" var="u">
        <tr class="hover:bg-gray-50 transition">

          <td class="px-8 py-5 font-bold">${u.id}</td>
          <td class="px-8 py-5">${u.name}</td>
          <td class="px-8 py-5">${u.email}</td>

          <td class="px-8 py-5 uppercase font-bold text-indigo-600">
              ${u.role}
          </td>

          <!-- STATUS -->
          <td class="px-8 py-5">
            <c:choose>
              <c:when test="${u.active}">
                <span class="text-green-600 font-bold">Active</span>
              </c:when>
              <c:otherwise>
                <span class="text-red-600 font-bold">Blocked</span>
              </c:otherwise>
            </c:choose>
          </td>

          <!-- ACTION -->
          <td class="px-8 py-5 text-center">
            <c:choose>
              <c:when test="${u.active}">
                <form action="${pageContext.request.contextPath}/admin/blockUser" method="post">
                  <input type="hidden" name="userId" value="${u.id}">
                  <button
                          class="bg-red-500 text-white px-6 py-2 rounded-xl font-bold
                                                   hover:bg-red-600 transition">
                    Block
                  </button>
                </form>
              </c:when>
              <c:otherwise>
                <form action="${pageContext.request.contextPath}/admin/unblockUser" method="post">
                  <input type="hidden" name="userId" value="${u.id}">
                  <button
                          class="bg-green-600 text-white px-6 py-2 rounded-xl font-bold
                                                   hover:bg-green-700 transition">
                    Unblock
                  </button>
                </form>
              </c:otherwise>
            </c:choose>
          </td>

        </tr>
      </c:forEach>

      </tbody>
    </table>

    <!-- EMPTY STATE -->
    <c:if test="${empty users}">
      <div class="py-20 text-center text-gray-400 font-bold">
        No users found
      </div>
    </c:if>

  </div>

</section>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
