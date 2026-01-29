<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickBuy | Premium Marketplace</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <style>
        [x-cloak] { display: none !important; }
        .hero-gradient { background: linear-gradient(to right, rgba(0,0,0,0.8) 0%, rgba(0,0,0,0.2) 100%); }
    </style>
</head>
<body class="bg-gray-50 font-sans text-gray-900"
      x-data="{ openModal:false, activeProduct:{}, qty:1 }">


      <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <section class="container mx-auto px-4 mt-6">
        <div class="relative w-full aspect-video md:aspect-[24/9] overflow-hidden rounded-[2.5rem] shadow-2xl bg-black">
            <video class="w-full h-full object-cover opacity-90" autoplay muted loop playsinline>
                <source src="${pageContext.request.contextPath}/assets/videos/hero.mp4" type="video/mp4">
            </video>
            <div class="absolute inset-0 hero-gradient flex flex-col justify-center px-8 md:px-20 text-white">
                <h2 class="text-4xl md:text-7xl font-black mb-4 italic tracking-tighter"> QuickBuy </h2>
                <p class="text-lg md:text-2xl text-gray-300 mb-8 max-w-md font-light"> Everything you need, delivered fast — groceries, stationery, and daily essentials at your fingertips.</p>
                <button class="w-max bg-white text-black px-10 py-4 rounded-full font-black uppercase text-sm tracking-widest hover:bg-indigo-600 hover:text-white transition-all shadow-xl">Get Now</button>
            </div>
        </div>
    </section>

    <main class="container mx-auto px-4 py-16">
        <div class="flex flex-col md:flex-row md:items-end justify-between mb-12 gap-4">
            <div>
                <h2 class="text-4xl font-black text-gray-900 tracking-tight">New Arrivals</h2>
                <p class="text-gray-500 mt-2">Finest picks from our verified vendors.</p>
            </div>

            <button class="flex items-center gap-2 bg-white border-2 border-gray-100 px-6 py-3 rounded-2xl hover:border-indigo-500 hover:text-indigo-600 transition-all font-bold text-gray-700 shadow-sm">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.293A1 1 0 013 6.586V4z"></path></svg>
                Sort & Filter
            </button>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-10">
            <c:if test="${empty products}">
                <div class="col-span-full py-24 text-center bg-gray-100 rounded-[3rem]">
                    <p class="text-gray-400 font-bold text-xl uppercase tracking-widest">No products available.</p>
                </div>
            </c:if>

            <c:forEach items="${products}" var="p">
                <div class="group bg-white rounded-[2rem] overflow-hidden border border-gray-50 shadow-sm hover:shadow-2xl transition-all duration-500 hover:-translate-y-2">
                    <div class="h-80 bg-gray-100 relative overflow-hidden">
                        <img src="${p.firstImageUrl}"
                             class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
                        <div class="absolute top-5 left-5 bg-white/90 backdrop-blur-md px-4 py-1.5 rounded-full text-[10px] font-black tracking-widest text-indigo-600 uppercase">Featured</div>
                    </div>

                    <div class="p-6">
                        <div class="flex justify-between items-start mb-2">
                            <h3 class="text-xl font-bold text-gray-900 truncate">${p.name}</h3>
                            <span class="text-[10px] font-black text-indigo-500 uppercase">${p.category.name}</span>
                        </div>
                        <div class="flex items-center justify-between mt-4">
                            <p class="text-2xl font-black text-gray-900">₹ ${p.price}</p>
                            <button
                                @click="openModal = true; activeProduct = {
                                    id: '${p.id}',
                                    name: '${p.name}',
                                    price: '${p.price}',
                                    desc: '${p.description}',
                                    stock: '${p.stock}',
                                    image: '${p.firstImageUrl}',
                                    category: '${p.category.name}'
                                }"
                                class="bg-gray-900 text-white p-3 rounded-xl hover:bg-indigo-600 transition-colors">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg>
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>

    <div x-show="openModal"
         x-transition:enter="transition ease-out duration-300"
         x-transition:enter-start="opacity-0 scale-95"
         x-transition:enter-end="opacity-100 scale-100"
         x-transition:leave="transition ease-in duration-200"
         x-transition:leave-start="opacity-100 scale-100"
         x-transition:leave-end="opacity-0 scale-95"
         class="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-black/80 backdrop-blur-sm"
         x-cloak>

        <div @click.away="openModal = false"
             class="bg-white rounded-[3rem] max-w-5xl w-full overflow-hidden shadow-2xl flex flex-col md:flex-row relative">

            <button @click="openModal = false" class="absolute top-6 right-6 z-20 bg-gray-100 p-2 rounded-full hover:bg-red-500 hover:text-white transition-all">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
            </button>

            <div class="md:w-1/2 bg-gray-50 flex items-center justify-center p-8">
                <img :src="activeProduct.image" class="max-w-full h-auto rounded-[2rem] shadow-xl">
            </div>

            <div class="md:w-1/2 p-10 md:p-16 flex flex-col justify-center">
                <span class="text-indigo-600 font-black uppercase tracking-[0.3em] text-xs mb-4" x-text="activeProduct.category"></span>
                <h2 class="text-5xl font-black mb-6 text-gray-900" x-text="activeProduct.name"></h2>

                <div class="flex items-baseline gap-4 mb-6">
                    <p class="text-4xl font-black text-gray-900" x-text="'₹ ' + activeProduct.price"></p>
                    <p class="text-green-600 font-bold text-sm">Stock: <span x-text="activeProduct.stock"></span></p>
                </div>

                <p class="text-gray-500 leading-relaxed text-lg mb-8" x-text="activeProduct.desc"></p>


                    <div class="flex flex-col gap-6">
                        <div class="flex items-center gap-6">
                            <span class="font-bold text-gray-700">Quantity</span>
                            <select x-model="qty" class="bg-gray-100 border-none rounded-xl px-6 py-3 font-black outline-none focus:ring-2 focus:ring-indigo-500">
                                <option value="1">1</option><option value="2">2</option>
                                <option value="3">3</option><option value="4">4</option>
                            </select>
                        </div>




                        <div class="grid grid-cols-2 gap-4">



                            <form action="${pageContext.request.contextPath}/buynow" method="post">

                                <input type="hidden" name="pid" :value="activeProduct.id"/>
                                <input type="hidden" name="quantity" :value="qty"/>

                                <button type="submit"
                                      class="w-40 bg-indigo-600 text-white py-5 rounded-[1.5rem] font-black uppercase tracking-widest text-sm hover:bg-indigo-700 transition shadow-xl shadow-indigo-100">
                                  Buy Now
                              </button>
                          </form>



                            <form action="${pageContext.request.contextPath}/addcart" method="post">

                                <input type="hidden" name="pid" :value="activeProduct.id"/>
                                <input type="hidden" name="quantity" :value="qty"/>

                                <button type="submit"
                                        class="w-40 bg-gray-900 text-white py-5 rounded-[1.5rem]
                   font-black uppercase tracking-widest text-sm
                   hover:bg-black transition shadow-xl shadow-gray-200">
                                    Add to Cart
                                </button>
                            </form>

                        </div>
                    </div>

            </div>
        </div>
    </div>

 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>