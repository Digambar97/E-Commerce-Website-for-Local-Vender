<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LeLo | Vendor Payments</title>

    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<!-- ✅ HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- ✅ PAYMENT SUMMARY -->
<div class="container mx-auto px-4 py-20">
    <div class="max-w-2xl mx-auto bg-white p-10 rounded-[2.5rem] shadow-2xl">

        <h2 class="text-4xl font-black mb-10 text-gray-900 text-center">
            Vendor Payments
        </h2>

        <!-- ✅ Summary Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

            <div class="bg-gray-100 p-6 rounded-2xl shadow-inner text-center">
                <p class="text-3xl font-black text-indigo-600">₹${totalEarnings}</p>
                <p class="text-gray-700 mt-2">Total Earnings</p>
            </div>

            <div class="bg-gray-100 p-6 rounded-2xl shadow-inner text-center">
                <p class="text-3xl font-black text-yellow-600">${pendingPayments}</p>
                <p class="text-gray-700 mt-2">Pending Payments</p>
            </div>

            <div class="bg-gray-100 p-6 rounded-2xl shadow-inner text-center">
                <p class="text-3xl font-black text-green-600">${completedPayments}</p>
                <p class="text-gray-700 mt-2">Completed Payments</p>
            </div>

        </div>

        <!-- ✅ Back Button -->
        <div class="text-center mt-10">
            <a href="${pageContext.request.contextPath}/vendorDashboard"
               class="bg-gray-900 text-white px-8 py-3 rounded-xl font-bold hover:bg-indigo-600 transition-all">
                Back to Dashboard
            </a>
        </div>

    </div>
</div>

<!-- ✅ FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>