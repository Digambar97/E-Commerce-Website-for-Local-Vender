<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Project | E-Commerce Application</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main class="container mx-auto px-4 py-16">

    <!-- Title -->
    <h1 class="text-5xl font-black tracking-tight mb-12 text-center">
        About the Project
    </h1>

    <!-- Introduction -->
    <div class="bg-white rounded-[3rem] p-12 shadow-xl border border-gray-100 mb-12">
        <h2 class="text-3xl font-black mb-6">Introduction</h2>
        <p class="text-gray-600 text-lg leading-relaxed">
            The E-Commerce Web Application is designed to provide an online platform
            for users to browse products, manage carts, and place orders efficiently.
            The system supports three types of users: Customers, Vendor and Administrators.
        </p>
        <p class="text-gray-600 text-lg leading-relaxed mt-4">
            Customers can register, log in, view products, add items to the cart,
            and place orders, while Administrators can manage products, categories,
            and orders.
        </p>
    </div>

    <!-- System Overview -->
    <div class="bg-white rounded-[3rem] p-12 shadow-xl border border-gray-100 mb-12">
        <h2 class="text-3xl font-black mb-6">System Overview</h2>
        <p class="text-gray-600 text-lg leading-relaxed">
            The application follows a layered architecture to improve scalability,
            maintainability, and security.
        </p>

        <ul class="list-disc list-inside mt-4 text-gray-600 text-lg space-y-2">
            <li>Presentation Layer (UI / Dashboard)</li>
            <li>Controller Layer</li>
            <li>Service Layer</li>
            <li>Repository Layer</li>
            <li>Database Layer (MySQL)</li>
        </ul>
    </div>

    <!-- Technology Stack -->
    <div class="bg-white rounded-[3rem] p-12 shadow-xl border border-gray-100 mb-12">
        <h2 class="text-3xl font-black mb-6">Technology Stack</h2>
        <ul class="grid grid-cols-1 md:grid-cols-2 gap-4 text-gray-600 text-lg">
            <li><strong>Backend:</strong> Spring Boot</li>
            <li><strong>ORM:</strong> Hibernate (JPA)</li>
            <li><strong>Database:</strong> MySQL</li>
            <li><strong>Authentication:</strong> Session-Based</li>
            <li><strong>API Style:</strong> RESTful APIs</li>
        </ul>
    </div>

    <!-- Project Guide -->
    <div class="bg-white rounded-[3rem] p-12 shadow-xl border border-gray-100 mb-12">
        <h2 class="text-3xl font-black mb-6">Project Guide</h2>
        <p class="text-lg font-semibold">Shubham Gupta</p>
        <p class="text-gray-600">shubhamgupta@cdac.in</p>
    </div>

    <!-- Project Members -->
    <div class="bg-white rounded-[3rem] p-12 shadow-xl border border-gray-100">
        <h2 class="text-3xl font-black mb-8">Project Members</h2>

        <ul class="space-y-4 text-lg text-gray-700">
            <li class="flex justify-between border-b pb-2">
                <span class="font-semibold">Sarthak Gore</span>
                <span class="text-gray-500">250850120152</span>
            </li>
            <li class="flex justify-between border-b pb-2">
                <span class="font-semibold">Onkar Jogdand</span>
                <span class="text-gray-500">250850120115</span>
            </li>
            <li class="flex justify-between border-b pb-2">
                <span class="font-semibold">Krishna Panale</span>
                <span class="text-gray-500">250850120091</span>
            </li>
            <li class="flex justify-between">
                <span class="font-semibold">Digambar Rathod</span>
                <span class="text-gray-500">250850120066</span>
            </li>
        </ul>
    </div>

    <!-- Back Button -->
    <div class="mt-16 text-center">
        <a href="/"
           class="inline-block bg-gray-900 text-white px-10 py-4 rounded-full
                  font-black uppercase tracking-widest hover:bg-indigo-600 transition">
            ← Go Back Home
        </a>
    </div>

</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
