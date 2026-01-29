<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LeLo | Admin Dashboard</title>
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
            <h1 class="text-5xl font-black tracking-tight">Admin Dashboard - Welcome "${user.name}"</h1>
            <p class="mt-4 text-lg text-gray-300 max-w-xl">
                Manage users, products, vendors, orders and inventory efficiently.
            </p>
        </div>
    </div>
</section>

<!-- DASHBOARD STATS -->
<section class="container mx-auto px-4 py-16">
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">

        <div class="bg-white rounded-[2rem] p-8 shadow hover:shadow-2xl transition">
            <p class="text-gray-400 font-bold uppercase text-xs tracking-widest">Users</p>
            <h2 class="text-4xl font-black mt-2">${totalUsers}</h2>
        </div>

        <div class="bg-white rounded-[2rem] p-8 shadow hover:shadow-2xl transition">
            <p class="text-gray-400 font-bold uppercase text-xs tracking-widest">Products</p>
            <h2 class="text-4xl font-black mt-2">${totalProducts}</h2>
        </div>

        <div class="bg-white rounded-[2rem] p-8 shadow hover:shadow-2xl transition">
            <p class="text-gray-400 font-bold uppercase text-xs tracking-widest">Orders</p>
            <h2 class="text-4xl font-black mt-2">${totalOrders}</h2>
        </div>

        <div class="bg-white rounded-[2rem] p-8 shadow hover:shadow-2xl transition">
            <p class="text-gray-400 font-bold uppercase text-xs tracking-widest">Revenue</p>
            <h2 class="text-4xl font-black mt-2">₹ ${totalRevenue}</h2>
        </div>

    </div>
</section>

<!-- ADMIN SERVICES -->
<section class="container mx-auto px-4 pb-20">
    <h2 class="text-4xl font-black mb-12">Admin Services</h2>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-10">

        <!-- USER MANAGEMENT -->
        <a href="${pageContext.request.contextPath}/admin/users"
           class="bg-white rounded-[2rem] p-10 shadow hover:shadow-2xl transition">
            <h3 class="text-2xl font-black mb-3">User Management</h3>
            <p class="text-gray-500">View, block or unblock users</p>
        </a>

        <!-- VENDOR MANAGEMENT -->
        <a href="${pageContext.request.contextPath}/Adminvendors"
           class="bg-white rounded-[2rem] p-10 shadow hover:shadow-2xl transition">
            <h3 class="text-2xl font-black mb-3">Vendor Management</h3>
            <p class="text-gray-500">Approve and manage vendors</p>
        </a>

        <!-- PRODUCT MANAGEMENT -->
        <a href="${pageContext.request.contextPath}/admin/products"
           class="bg-white rounded-[2rem] p-10 shadow hover:shadow-2xl transition">
            <h3 class="text-2xl font-black mb-3">Product Management</h3>
            <p class="text-gray-500">Add, update or delete products</p>
        </a>

        <!-- ORDER MANAGEMENT -->
        <a href="${pageContext.request.contextPath}/admin/orders"
           class="bg-white rounded-[2rem] p-10 shadow hover:shadow-2xl transition">
            <h3 class="text-2xl font-black mb-3">Order Management</h3>
            <p class="text-gray-500">Track and update orders</p>
        </a>

        <!-- INVENTORY -->
        <a href="${pageContext.request.contextPath}/admin/inventory"
           class="bg-white rounded-[2rem] p-10 shadow hover:shadow-2xl transition">
            <h3 class="text-2xl font-black mb-3">Inventory</h3>
            <p class="text-gray-500">Monitor stock and quantities</p>
        </a>

    </div>
</section>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
