<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout |QuickBuy Premium</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>
<body class="bg-gray-50 font-sans text-gray-900">

    <header class="bg-white border-b border-gray-100 py-6">
        <div class="container mx-auto px-4 flex justify-between items-center">
            <a href="/" class="text-2xl font-black text-indigo-600 tracking-tighter uppercase">LeLo</a>
            <span class="text-sm font-bold text-gray-400 uppercase tracking-widest">Secure Checkout</span>
        </div>
    </header>

    <main class="container mx-auto px-4 py-12">
        <div class="max-w-6xl mx-auto flex flex-col lg:flex-row gap-12">

            <div class="flex-1 space-y-8">
                <section class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100">
                    <h2 class="text-2xl font-black mb-6 flex items-center gap-3">
                        <span class="bg-indigo-600 text-white w-8 h-8 rounded-full flex items-center justify-center text-sm">1</span>
                        Shipping Address
                    </h2>
                    <form id="checkoutForm" action="/payment" method="POST" class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <input type="hidden" name="productId" value="${product.id}">
                        <input type="hidden" name="quantity" value="${quantity}">

                        <div class="col-span-2">
                            <input type="text" name="address" placeholder="Full Address" required
                                   class="w-full bg-gray-50 border-none rounded-xl py-4 px-6 focus:ring-2 focus:ring-indigo-500 outline-none">
                        </div>
                        <input type="text" name="city" placeholder="City" required
                               class="bg-gray-50 border-none rounded-xl py-4 px-6 focus:ring-2 focus:ring-indigo-500 outline-none">
                        <input type="text" name="pincode" placeholder="Pincode" required
                               class="bg-gray-50 border-none rounded-xl py-4 px-6 focus:ring-2 focus:ring-indigo-500 outline-none">
                    </form>
                </section>

                <section class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100" x-data="{ method: 'UPI' }">
                    <h2 class="text-2xl font-black mb-6 flex items-center gap-3">
                        <span class="bg-indigo-600 text-white w-8 h-8 rounded-full flex items-center justify-center text-sm">2</span>
                        Payment Method
                    </h2>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <button @click="method = 'UPI'" :class="method === 'UPI' ? 'border-indigo-600 bg-indigo-50' : 'border-gray-100'"
                                class="border-2 p-4 rounded-2xl flex flex-col items-center gap-2 transition-all">
                            <span class="font-bold">UPI</span>
                        </button>
                        <button @click="method = 'CARD'" :class="method === 'CARD' ? 'border-indigo-600 bg-indigo-50' : 'border-gray-100'"
                                class="border-2 p-4 rounded-2xl flex flex-col items-center gap-2 transition-all">
                            <span class="font-bold">Card</span>
                        </button>
                        <button @click="method = 'COD'" :class="method === 'COD' ? 'border-indigo-600 bg-indigo-50' : 'border-gray-100'"
                                class="border-2 p-4 rounded-2xl flex flex-col items-center gap-2 transition-all">
                            <span class="font-bold">Cash on Delivery</span>
                        </button>
                    </div>
                    <input type="hidden" name="paymentMethod" :value="method" form="checkoutForm">
                </section>
            </div>

            <div class="w-full lg:w-[400px]">
                <div class="bg-gray-900 text-white p-8 rounded-[2.5rem] sticky top-28 shadow-2xl">
                    <h3 class="text-xl font-bold mb-8 border-b border-gray-800 pb-4 uppercase tracking-widest">Order Summary</h3>

                    <div class="flex items-center gap-4 mb-8">
                        <img src="${product.firstImageUrl}" class="w-20 h-20 object-cover rounded-2xl bg-white/10">
                        <div>
                            <p class="font-bold text-lg">${product.name}</p>
                            <p class="text-gray-400 text-sm">Qty: ${quantity}</p>
                        </div>
                    </div>

                    <div class="space-y-4 mb-8">
                        <div class="flex justify-between text-gray-400">
                            <span>Subtotal</span>
                            <span>₹ ${product.price * quantity}</span>
                        </div>
                        <div class="flex justify-between text-gray-400">
                            <span>Shipping</span>
                            <span class="text-green-400">FREE</span>
                        </div>
                        <div class="flex justify-between text-xl font-black border-t border-gray-800 pt-4">
                            <span>Total</span>
                            <span>₹ ${product.price * quantity}</span>
                        </div>
                    </div>

                    <button type="submit" form="checkoutForm"
                            class="w-full bg-white text-black py-5 rounded-2xl font-black uppercase tracking-widest text-sm hover:bg-indigo-500 hover:text-white transition-all">
                        Complete Payment
                    </button>

                    <p class="text-[10px] text-center text-gray-500 mt-6 uppercase tracking-tighter">
                        By clicking, you agree to LeLo's Terms of Service.
                    </p>
                </div>
            </div>
        </div>
    </main>

</body>
</html>