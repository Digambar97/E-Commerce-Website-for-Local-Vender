<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>LeLo | Order Successful</title>
<script src="https://cdn.tailwindcss.com"></script>

<style>
.success-ring {
    box-shadow: 0 0 0 15px rgba(34,197,94,0.15);
    animation: pulse 1.8s infinite;
}
@keyframes pulse {
    0% { box-shadow: 0 0 0 0 rgba(34,197,94,0.4); }
    70% { box-shadow: 0 0 0 25px rgba(34,197,94,0); }
    100% { box-shadow: 0 0 0 0 rgba(34,197,94,0); }
}
</style>

</head>
<body class="bg-gradient-to-br from-green-50 to-indigo-100 min-h-screen">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="flex items-center justify-center py-20 px-4">

<div class="max-w-3xl w-full bg-white rounded-[2.5rem] shadow-2xl p-12 relative overflow-hidden">

    <!-- Decorative glow -->
    <div class="absolute -top-20 -right-20 w-72 h-72 bg-green-300 opacity-20 rounded-full blur-3xl"></div>
    <div class="absolute -bottom-20 -left-20 w-72 h-72 bg-indigo-300 opacity-20 rounded-full blur-3xl"></div>

    <!-- Check Icon -->
    <div class="flex justify-center">
        <div class="success-ring w-24 h-24 bg-green-500 rounded-full flex items-center justify-center">
            <svg class="w-12 h-12 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"/>
            </svg>
        </div>
    </div>

    <!-- Text -->
    <h1 class="mt-6 text-center text-4xl font-black text-green-700 tracking-wide">
        Payment Successful
    </h1>
    <p class="text-center text-gray-600 mt-2">
        Your order has been placed and is now being prepared for shipment.
    </p>

    <!-- Divider -->
    <div class="my-8 border-t border-gray-200"></div>

    <!-- What next -->
    <div class="bg-green-50 rounded-3xl p-8 text-center">
        <h3 class="text-xl font-bold text-green-800 mb-4">What happens next?</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-gray-700 text-sm">

            <div class="flex items-start gap-3">
                <span class="text-green-600 text-xl">📦</span>
                <p>Your items are being packed by the seller.</p>
            </div>

            <div class="flex items-start gap-3">
                <span class="text-green-600 text-xl">🚚</span>
                <p>You will get shipping updates via SMS & email.</p>
            </div>

            <div class="flex items-start gap-3">
                <span class="text-green-600 text-xl">📍</span>
                <p>You can track your order in your account.</p>
            </div>

            <div class="flex items-start gap-3">
                <span class="text-green-600 text-xl">🔒</span>
                <p>Your payment was processed securely.</p>
            </div>

        </div>
    </div>

    <!-- Buttons -->
    <div class="mt-10 flex flex-col md:flex-row gap-4">


        <a href="${pageContext.request.contextPath}/"
           class="flex-1 bg-indigo-600 text-white py-4 rounded-xl font-black text-center tracking-widest hover:bg-indigo-700 transition shadow-xl">
            Continue Shopping
        </a>
    </div>

</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
