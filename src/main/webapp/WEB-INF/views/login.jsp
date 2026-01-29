<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickBuy | Login</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<!-- ✅ HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- ✅ LOGIN SECTION -->
<section class="container mx-auto px-4 py-20">
    <div class="max-w-xl mx-auto bg-white rounded-[2.5rem] shadow-2xl p-12">

        <!-- TITLE -->
        <h2 class="text-4xl font-black mb-10 tracking-tight text-center text-gray-900">
            User Login
        </h2>

        <!-- ✅ USER LOGIN FORM (DEFAULT) -->

        <c:if test="${not empty error}">
                    <div class="mb-6 flex items-center p-4 bg-red-50 border-l-4 border-red-500 rounded-r-2xl">
                        <div class="flex-shrink-0 bg-red-500 p-1.5 rounded-full text-white">
                            <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M6 18L18 6M6 6l12 12"/>
                            </svg>
                        </div>
                        <div class="ml-4">
                            <p class="text-[10px] font-black text-red-700 uppercase tracking-tighter leading-none">Error</p>
                            <p class="text-xs font-bold text-red-500 mt-1">${error}</p>
                        </div>
                    </div>
                </c:if>
  <!-- ✅ USER LOGIN FORM (DEFAULT) -->
  <form action="/auth/login" method="POST" class="space-y-6">

      <input
              type="text"
              name="username"
              placeholder="Username"
              required
              class="w-full px-5 py-4 border rounded-2xl
                     focus:outline-none focus:ring-2 focus:ring-indigo-600"
      />

      <input
              type="password"
              name="password"
              placeholder="Password"
              required
              class="w-full px-5 py-4 border rounded-2xl
                     focus:outline-none focus:ring-2 focus:ring-indigo-600"
      />

      <!-- DEFAULT ROLE -->
      <input type="hidden" name="role" value="USER"/>

      <button
              type="submit"
              class="block mx-auto w-64 bg-indigo-600 text-white py-4 rounded-2xl
                     font-bold hover:bg-indigo-700 transition-all shadow-md">
          Login
      </button>
  </form>


        <!-- ✅ REGISTER -->
        <p class="text-center mt-6 text-gray-600">
            New user?
            <a href="/register" class="text-indigo-600 font-bold hover:underline">
                Register here
            </a>
        </p>

        <!-- DIVIDER -->
        <div class="flex items-center my-10">
            <hr class="flex-grow border-gray-300">
            <span class="mx-4 text-gray-400 font-semibold">OR</span>
            <hr class="flex-grow border-gray-300">
        </div>


        <!-- ✅ ADMIN & VENDOR LOGIN BUTTONS -->
         <div class="flex flex-row gap-5 items-center">

             <a href="/adminLogin"
                class="w-64 bg-gray-900 text-white py-4 rounded-2xl font-bold
                       hover:bg-indigo-600 transition-all shadow-md text-center">
                 Admin Login
             </a>

             <a href="/vendorLogin"
                class="w-64 bg-gray-900 text-white py-4 rounded-2xl font-bold
                       hover:bg-indigo-600 transition-all shadow-md text-center">
                 Vendor Login
             </a>

         </div>


    </div>
</section>

<!-- ✅ FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>