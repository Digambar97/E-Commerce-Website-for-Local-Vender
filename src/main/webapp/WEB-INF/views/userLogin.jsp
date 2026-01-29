<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LeLo | User Login</title>

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

<!-- ✅ USER LOGIN FORM -->
<div class="container mx-auto px-4 py-20">
    <div class="max-w-lg mx-auto bg-white p-10 rounded-[2.5rem] shadow-2xl">

        <h2 class="text-3xl font-black mb-8 text-gray-900 text-center">User Login</h2>

        <form action="${pageContext.request.contextPath}/userAuth" method="post" class="flex flex-col gap-6">

            <input type="text" name="username" placeholder="Email or Username"
                   class="bg-gray-100 px-6 py-4 rounded-xl outline-none">

            <input type="password" name="password" placeholder="Password"
                   class="bg-gray-100 px-6 py-4 rounded-xl outline-none">

            <button type="submit"
                    class="w-full bg-gray-900 text-white py-4 rounded-2xl font-bold
                           hover:bg-indigo-600 transition-all shadow-md">
                User Login
            </button>

        </form>

    </div>
</div>

<!-- ✅ FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>