<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LeLo | Admin Login</title>

    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Alpine.js -->
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>

    <style>
        [x-cloak] { display: none !important; }
        .hero-gradient { background: linear-gradient(to right, rgba(0,0,0,0.8), rgba(0,0,0,0.2)); }
    </style>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<!-- ✅ HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- ✅ ADMIN LOGIN FORM -->
<div class="container mx-auto px-4 py-20">
    <div class="max-w-lg mx-auto bg-white p-10 rounded-[2.5rem] shadow-2xl">

        <h2 class="text-3xl font-black mb-8 text-gray-900 text-center">Admin Login</h2>



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


        <form action="${pageContext.request.contextPath}/adminAuth" method="post" class="flex flex-col gap-6">

            <input type="text" name="username" placeholder="Admin Username or Email"
                   class="bg-gray-100 px-6 py-4 rounded-xl outline-none">

            <input type="password" name="password" placeholder="Password"
                   class="bg-gray-100 px-6 py-4 rounded-xl outline-none">

            <button type="submit"
                    class="w-full bg-gray-900 text-white py-4 rounded-2xl font-bold
                           hover:bg-indigo-600 transition-all shadow-md">
                Admin Login
            </button>

        </form>

    </div>
</div>

<!-- ✅ FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>