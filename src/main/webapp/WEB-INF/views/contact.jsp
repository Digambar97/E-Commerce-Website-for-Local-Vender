<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Contact Us | E-Commerce Project</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main class="container mx-auto px-4 py-16">

  <!-- Page Title -->
  <h1 class="text-5xl font-black tracking-tight mb-12 text-center">
    Contact Us
  </h1>

  <!-- Contact Information -->
  <div class="bg-white rounded-[3rem] p-12 shadow-xl border border-gray-100 space-y-8 mb-12">
    <div>
      <p class="text-lg font-semibold">📧 Project Email</p>
      <p class="text-gray-600">admin.support@lelo.com</p>
    </div>
    <div>
      <p class="text-lg font-semibold">📞 Contact Number</p>
      <p class="text-gray-600">+91 99999 99999</p>
    </div>
    <div>
      <p class="text-lg font-semibold">🕒 Working Hours</p>
      <p class="text-gray-600">Monday – Friday, 9:00 AM – 6:00 PM</p>
    </div>
  </div>

  <!-- Project Guide -->
  <div class="bg-white rounded-[3rem] p-12 shadow-xl border border-gray-100 mb-16">
    <h2 class="text-3xl font-black mb-6">Project Guide</h2>
    <p class="text-xl font-semibold">Shubham Gupta</p>
    <p class="text-gray-600">shubhamgupta@cdac.in</p>
  </div>

  <!-- Project Members -->
  <div class="mb-16">
    <h2 class="text-3xl font-black mb-12 text-center">Project Members</h2>

    <!-- 2 x 2 Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-12">

      <!-- Member Card -->
      <div class="bg-white rounded-[3rem] p-10 shadow-xl border hover:shadow-2xl transition">
        <h3 class="text-2xl font-black mb-3">Sarthak Gore</h3>
        <p class="text-gray-500 mb-4 text-lg">PRN No: 250850120152</p>
        <p class="text-lg text-gray-700">📧 sarthakgore1008@gmail.com</p>
        <p class="text-lg text-gray-700 mt-2">📞 +91 93070 90318</p>
      </div>

      <div class="bg-white rounded-[3rem] p-10 shadow-xl border hover:shadow-2xl transition">
        <h3 class="text-2xl font-black mb-3">Onkar Jogdand</h3>
        <p class="text-gray-500 mb-4 text-lg">PRN No: 250850120115</p>
        <p class="text-lg text-gray-700">📧 onkarjogdand1126@gmail.com</p>
        <p class="text-lg text-gray-700 mt-2">📞 +91 93076 05766</p>
      </div>

      <div class="bg-white rounded-[3rem] p-10 shadow-xl border hover:shadow-2xl transition">
        <h3 class="text-2xl font-black mb-3">Krishna Panale</h3>
        <p class="text-gray-500 mb-4 text-lg">PRN No: 250850120091</p>
        <p class="text-lg text-gray-700">📧 panalekrishna111@gmail.com</p>
        <p class="text-lg text-gray-700 mt-2">📞 +91 87668 08657</p>
      </div>

      <div class="bg-white rounded-[3rem] p-10 shadow-xl border hover:shadow-2xl transition">
        <h3 class="text-2xl font-black mb-3">Digambar Rathod</h3>
        <p class="text-gray-500 mb-4 text-lg">PRN No: 250850120066</p>
        <p class="text-lg text-gray-700">📧 digambarrathod2002@gmail.com</p>
        <p class="text-lg text-gray-700 mt-2">📞 +91 74993 38013</p>
      </div>

    </div>
  </div>

  <!-- Back Button -->
  <div class="mt-20 text-center">
    <a href="/"
       class="inline-block bg-gray-900 text-white px-12 py-4 rounded-full
              font-black uppercase tracking-widest hover:bg-indigo-600 transition">
      ← Go Back Home
    </a>
  </div>

</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
