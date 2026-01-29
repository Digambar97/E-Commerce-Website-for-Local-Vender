<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Cart | QuickBuy Premium</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 font-sans text-gray-900">

<header class="bg-white border-b border-gray-100 py-6">
  <div class="container mx-auto px-4 flex justify-between items-center">
    <a href="/" class="text-2xl font-black text-indigo-600 uppercase">LeLo</a>
    <span class="text-sm font-bold text-gray-400 uppercase tracking-widest">
            Shopping Cart
        </span>
  </div>
</header>

<main class="container mx-auto px-4 py-12">
  <div class="max-w-6xl mx-auto flex flex-col lg:flex-row gap-12">

    <!-- CART ITEMS -->
    <div class="flex-1 space-y-6">

      <c:if test="${empty cartItems}">
        <div class="bg-white p-12 rounded-[2.5rem] shadow text-center">
          <p class="text-gray-400 font-bold text-lg uppercase">
            Your cart is empty
          </p>
        </div>
      </c:if>

      <c:forEach items="${cartItems}" var="item">
        <div class="bg-white p-6 rounded-[2.5rem] shadow-sm border border-gray-100
                            flex flex-col md:flex-row items-center gap-6">

          <img src="${item.product.firstImageUrl}"
               class="w-32 h-32 object-cover rounded-2xl bg-gray-100">

          <div class="flex-1">
            <h3 class="text-xl font-black">${item.product.name}</h3>
            <p class="text-gray-500 text-sm mt-1">
              Price: ₹ ${item.product.price}
            </p>
            <p class="text-gray-500 text-sm">
              Quantity: ${item.quantity}
            </p>
          </div>

          <div class="text-xl font-black">
            ₹ ${item.product.price * item.quantity}
          </div>

          <form action="${pageContext.request.contextPath}/cart/remove"
                method="post">
            <input type="hidden" name="pid"
                   value="${item.product.id}">
            <button type="submit"
                    class="bg-red-500 text-white px-6 py-3
                                       rounded-xl font-bold hover:bg-red-600">
              Remove
            </button>
          </form>

        </div>
      </c:forEach>

    </div>

    <!-- ORDER SUMMARY -->
    <div class="w-full lg:w-[400px]">
      <div class="bg-gray-900 text-white p-8 rounded-[2.5rem]
                        sticky top-28 shadow-2xl">

        <h3 class="text-xl font-bold mb-8 border-b border-gray-800 pb-4
                           uppercase tracking-widest">
          Order Summary
        </h3>

        <div class="space-y-4 mb-8">
          <div class="flex justify-between text-gray-400">
            <span>Total Items</span>
            <span>${totalItems}</span>
          </div>

          <div class="flex justify-between text-xl font-black
                                border-t border-gray-800 pt-4">
            <span>Total</span>
            <span>₹ ${cartTotal}</span>
          </div>
        </div>

        <form action="${pageContext.request.contextPath}/l" method="post">
          <button type="submit"
                  class="w-full bg-white text-black py-5
                                   rounded-2xl font-black uppercase tracking-widest
                                   text-sm hover:bg-indigo-500 hover:text-white
                                   transition-all">
            Place Order
          </button>
        </form>

      </div>
    </div>

  </div>
</main>

</body>
</html>
