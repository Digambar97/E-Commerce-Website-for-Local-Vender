<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="sticky top-0 z-50 bg-white/80 backdrop-blur-md border-b border-gray-100">
    <div class="container mx-auto px-4 h-20 flex items-center justify-between gap-6">

        <!-- LOGO -->
        <a href="/" class="flex items-center gap-2">
            <div class="bg-indigo-600 p-2 rounded-xl text-white font-black text-2xl">Q.</div>
            <span class="text-2xl font-bold tracking-tighter text-indigo-900 hidden md:block uppercase">
                QuickBuy
            </span>
        </a>

        <!-- SEARCH -->
        <div class="flex-1 max-w-2xl relative hidden sm:block">
            <input type="text" placeholder="Search for premium products..."
                   class="w-full bg-gray-100 rounded-2xl py-3 px-6 pl-12 focus:ring-2 focus:ring-indigo-500 outline-none">
            <svg class="w-5 h-5 absolute left-4 top-3.5 text-gray-400"
                 fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-width="2"
                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
            </svg>
        </div>

        <!-- RIGHT SECTION -->
        <div class="flex items-center gap-4">

            <!-- LOGIN / USER MENU -->
            <!-- If user is NOT logged in, show login button. Otherwise, show user menu. -->
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <form action="/loginpage" method="post">
                        <button type="submit"
                                class="font-bold text-gray-600 hover:text-indigo-600">
                            Login
                        </button>
                    </form>

                     <!-- CART -->
                                        <a href="/cart"
                                           class="relative p-3 bg-gray-100 rounded-full hover:bg-indigo-600 hover:text-white">
                                            🛒
                                        </a>

                                        <!-- USER PROFILE DROPDOWN -->
                                        <div class="relative group">

                                            <!-- PROFILE ICON -->
                                            <button type="button"
                                                    class="relative p-3 bg-gray-100 rounded-full hover:bg-indigo-600 hover:text-white">
                                                👤
                                            </button>

                                            <!-- DROPDOWN -->
                                            <div class="absolute right-0 mt-3 w-56 bg-white rounded-2xl shadow-xl
                                                        border border-gray-100 opacity-0 invisible
                                                        group-hover:opacity-100 group-hover:visible
                                                        transition-all duration-200">

                                                <ul class="py-2">

                                                    <li>
                                                        <form action="/orders" method="get">
                                                            <button type="submit"
                                                                    class="w-full text-left px-6 py-3 text-gray-700 hover:bg-gray-100">
                                                                Your Orders
                                                            </button>
                                                        </form>
                                                    </li>

                                                    <li>
                                                        <form action="/cart" method="get">
                                                            <button type="submit"
                                                                    class="w-full text-left px-6 py-3 text-gray-700 hover:bg-gray-100">
                                                                Cart
                                                            </button>
                                                        </form>
                                                    </li>

                                                    <li>
                                                        <form action="/contact" method="get">
                                                            <button type="submit"
                                                                    class="w-full text-left px-6 py-3 text-gray-700 hover:bg-gray-100">
                                                                Contact Us
                                                            </button>
                                                        </form>
                                                    </li>

                                                    <li>
                                                        <form action="/about" method="get">
                                                            <button type="submit"
                                                                    class="w-full text-left px-6 py-3 text-gray-700 hover:bg-gray-100">
                                                                About Us
                                                            </button>
                                                        </form>
                                                    </li>

                                                    <li class="border-t border-gray-100 mt-2">
                                                       <form action="/loginpage" method="post">
                                                                 <button type="submit"
                                                                                       class="w-full text-left px-6 py-3 text-blue-600 hover:bg-blue-50">
                                                                                   Login
                                                                 </button>
                                                       </form>
                                                    </li>
                                                </ul>
                                            </div>
                </c:when>

                <c:otherwise>
                    <div class="flex items-center bg-gray-100 border border-gray-200 rounded-2xl px-4 py-1.5 gap-3 shadow-sm">
                        <span class="text-sm font-bold text-indigo-900 tracking-tight">
                            ${user.name}
                        </span>

                        <div class="h-4 w-px bg-gray-300"></div>

                        <form action="/logout12" method="GET" class="flex items-center">
                            <button type="submit"
                                    class="text-[10px] font-black text-red-500 hover:text-red-700 uppercase tracking-widest transition-colors">
                                Logout
                            </button>
                        </form>
                    </div>

                    <a href="/cart"
                       class="relative p-3 bg-gray-100 rounded-full hover:bg-indigo-600 hover:text-white transition-all">
                        🛒
                    </a>

                    <div class="relative group">
                        <button type="button"
                                class="relative p-3 bg-gray-100 rounded-full hover:bg-indigo-600 hover:text-white transition-all">
                            👤
                        </button>

                        <div class="absolute right-0 mt-3 w-56 bg-white rounded-2xl shadow-xl
                                    border border-gray-100 opacity-0 invisible
                                    group-hover:opacity-100 group-hover:visible
                                    transition-all duration-200">
                            <ul class="py-2">
                                <li class="px-6 py-3 font-bold text-gray-900 border-b border-gray-50">
                                    Hello, ${user.name}
                                </li>
                                <li><form action="/userprofile" method="post"><button type="submit" class="w-full text-left px-6 py-3 text-gray-700 hover:bg-gray-100">User Profile</button></form></li>
                                <li><form action="${pageContext.request.contextPath}/" method="get"><button type="submit" class="w-full text-left px-6 py-3 text-gray-700 hover:bg-gray-100">Home</button></form></li>
                                <li><form action="/orders" method="get"><button type="submit" class="w-full text-left px-6 py-3 text-gray-700 hover:bg-gray-100">Your Orders</button></form></li>
                                <li><form action="/cart" method="get"><button type="submit" class="w-full text-left px-6 py-3 text-gray-700 hover:bg-gray-100">Cart</button></form></li>
                                <li><form action="/contact" method="get"><button type="submit" class="w-full text-left px-6 py-3 text-gray-700 hover:bg-gray-100">Contact Us</button></form></li>
                                <li><form action="/about" method="get"><button type="submit" class="w-full text-left px-6 py-3 text-gray-700 hover:bg-gray-100">About Us</button></form></li>
                                <li class="border-t border-gray-100 mt-2">
                                   <form action="/logout12" method="GET">
                                        <button type="submit" class="w-full text-left px-6 py-3 text-red-600 hover:bg-red-50 font-bold">
                                            Logout
                                        </button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>

    </div>
</header>
