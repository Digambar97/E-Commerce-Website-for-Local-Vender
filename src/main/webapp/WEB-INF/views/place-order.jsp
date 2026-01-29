<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LeLo | Complete Payment</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 font-sans text-gray-900">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="container mx-auto px-4 py-12">
    <!-- Stepper -->
    <div class="max-w-4xl mx-auto mb-12 flex justify-between items-center px-6">
        <div class="flex flex-col items-center gap-2">
            <div class="w-10 h-10 bg-indigo-600 text-white rounded-full flex items-center justify-center font-bold">✓</div>
            <span class="text-[10px] font-black uppercase text-gray-400 tracking-widest">Cart</span>
        </div>
        <div class="flex-1 h-px bg-indigo-600 mx-4 mb-6"></div>
        <div class="flex flex-col items-center gap-2">
            <div class="w-10 h-10 bg-indigo-600 text-white rounded-full flex items-center justify-center font-bold ring-4 ring-indigo-100">2</div>
            <span class="text-[10px] font-black uppercase text-indigo-600 tracking-widest">Payment</span>
        </div>
        <div class="flex-1 h-px bg-gray-200 mx-4 mb-6"></div>
        <div class="flex flex-col items-center gap-2">
            <div class="w-10 h-10 bg-gray-200 text-gray-500 rounded-full flex items-center justify-center font-bold">3</div>
            <span class="text-[10px] font-black uppercase text-gray-400 tracking-widest">Success</span>
        </div>
    </div>

    <!-- Main grid -->
    <div class="max-w-5xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-10">

        <!-- Left: QR code + form -->
        <div class="bg-white p-10 rounded-[2.5rem] shadow-2xl border-2 border-indigo-600 relative overflow-hidden">
            <div class="absolute top-0 right-0 bg-indigo-600 text-white px-6 py-2 rounded-bl-3xl text-[10px] font-black uppercase tracking-widest">
                Secure Checkout
            </div>

            <h2 class="text-2xl font-black text-indigo-900 mb-2 uppercase tracking-tight">Complete Payment</h2>
            <p class="text-gray-400 text-xs font-bold uppercase tracking-widest mb-8">Scan the QR code to finish your order</p>

            <div class="flex flex-col items-center justify-center p-6 bg-gray-50 rounded-[2rem] border-2 border-dashed border-gray-200 mb-8">
                <div class="bg-white p-4 rounded-3xl shadow-md mb-4">
                    <img src="${pageContext.request.contextPath}/assets/images/qr.png"
                         alt="Payment QR Code"
                         class="w-48 h-48 object-contain">
                </div>
                <div class="text-center">
                    <p class="font-black text-indigo-900 text-sm">Scan with any UPI App</p>
                    <div class="flex gap-3 mt-3 justify-center grayscale opacity-50">
                        <span class="text-xs font-bold uppercase">GPay</span>
                        <span class="text-xs font-bold uppercase">PhonePe</span>
                        <span class="text-xs font-bold uppercase">Paytm</span>
                    </div>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/confirmOrder1" method="POST" class="space-y-4">
                <div>
                    <label class="text-[10px] font-black uppercase text-gray-400 ml-4 tracking-widest">Transaction ID (Optional)</label>
                    <input type="text" name="transactionId" placeholder="Enter Ref No. if paid"
                           class="w-full mt-1 bg-gray-50 border-none rounded-2xl py-4 px-6 focus:ring-2 focus:ring-indigo-600 outline-none">
                </div>

                <button type="submit"
                        class="w-full bg-indigo-600 text-white py-5 rounded-2xl font-black uppercase tracking-widest hover:bg-indigo-700 transition-all shadow-xl hover:shadow-indigo-200 flex items-center justify-center gap-3">
                    Confirm Order
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M14 5l7 7m0 0l-7 7m7-7H3"/>
                    </svg>
                </button>
            </form>

            <p class="text-center mt-6 text-[10px] text-gray-400 font-bold uppercase tracking-tighter">
                🔒 Your payment is encrypted & secure
            </p>
        </div>

        <!-- Right: Fun & engaging text block -->
        <div class="bg-indigo-50 rounded-2xl p-8 flex flex-col justify-center shadow-inner">
            <h3 class="text-xl font-black text-indigo-800 mb-4">Why Complete Your Payment?</h3>
            <p class="text-gray-700 mb-4">
                ✅ Fast and secure checkout with UPI apps. <br>
                ✅ Get your favorite products delivered straight to your door. <br>
                ✅ Track your order easily and stay updated. <br>
                ✅ Exclusive discounts & offers await after payment!
            </p>
            <p class="text-gray-500 italic text-sm">
                Remember, a quick payment today = happiness at your doorstep tomorrow! 💳📦
            </p>
        </div>

    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
