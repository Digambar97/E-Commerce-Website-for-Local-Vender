<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vendor Orders</title>

    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container mx-auto px-4 py-20">
    <div class="max-w-xl mx-auto bg-white p-10 rounded-[2.5rem] shadow-2xl text-center">

        <h2 class="text-4xl font-black mb-10 text-gray-900">Vendor Orders</h2>

        <p class="text-gray-700 text-lg">
            Orders page is under construction.
        </p>

        <a href="${pageContext.request.contextPath}/vendorDashboard"
           class="mt-10 inline-block bg-gray-900 text-white px-8 py-3 rounded-xl font-bold hover:bg-indigo-600 transition-all">
            Back to Dashboard
        </a>

    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>