
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LeLo | Vendor Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Alpine JS -->
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>

    <style>
        [x-cloak] { display: none !important; }
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
    <div class="relative w-full h-[280px] rounded-[2.5rem] overflow-hidden shadow-2xl bg-black">
        <div class="absolute inset-0 hero-gradient flex flex-col justify-center px-12 text-white">
            <h1 class="text-5xl font-black tracking-tight">Vendor Dashboard - Welcome "${user.name}"</h1>
            <p class="mt-4 text-lg text-gray-300 max-w-xl">
                Manage your products, orders, and payments from one place.
            </p>
        </div>
    </div>
</section>

<!-- VENDOR SERVICES -->
<section class="container mx-auto px-4 py-20">
    <h2 class="text-4xl font-black mb-12">Vendor Services</h2>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-10">

        <!-- ADD PRODUCT -->
        <a href="${pageContext.request.contextPath}/addProduct"
           class="bg-white rounded-[2rem] p-10 shadow hover:shadow-2xl transition">
            <h3 class="text-2xl font-black mb-3">Add Product</h3>
            <p class="text-gray-500">Add new products to your store</p>
        </a>

        <!-- VIEW PRODUCTS -->
        <a href="${pageContext.request.contextPath}/vendorProducts"
           class="bg-white rounded-[2rem] p-10 shadow hover:shadow-2xl transition">
            <h3 class="text-2xl font-black mb-3">Your Products</h3>
            <p class="text-gray-500">View and manage listed products</p>
        </a>

        <!-- TOTAL ORDERS -->
        <a href="${pageContext.request.contextPath}/vendorOrders"
           class="bg-white rounded-[2rem] p-10 shadow hover:shadow-2xl transition">
            <h3 class="text-2xl font-black mb-3">Orders</h3>
            <p class="text-gray-500">Track customer orders</p>
        </a>

        <!-- PAYMENTS -->
        <a href="${pageContext.request.contextPath}/vendorPayments"
           class="bg-white rounded-[2rem] p-10 shadow hover:shadow-2xl transition">
            <h3 class="text-2xl font-black mb-3">Payments</h3>
            <p class="text-gray-500">View your earnings and payouts</p>
        </a>

    </div>
</section>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>