<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile | LeLo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main class="container mx-auto px-4 py-20">

    <div class="max-w-4xl mx-auto bg-white rounded-[3rem] shadow-2xl border border-gray-100 overflow-hidden">

        <!-- PROFILE HEADER -->
        <div class="bg-gray-900 text-white px-10 py-12">
            <h1 class="text-4xl font-black tracking-tight">My Profile</h1>
            <p class="text-gray-400 mt-2">Manage your personal information</p>
        </div>

        <!-- PROFILE BODY -->
        <div class="p-10 grid grid-cols-1 md:grid-cols-2 gap-8">

            <!-- LEFT COLUMN -->
            <div class="space-y-6">
                <div>
                    <p class="text-xs font-black uppercase tracking-widest text-gray-400">Full Name</p>
                    <p class="text-xl font-bold text-gray-900">${user.name}</p>
                </div>

                <div>
                    <p class="text-xs font-black uppercase tracking-widest text-gray-400">Username</p>
                    <p class="text-xl font-bold text-gray-900">${user.username}</p>
                </div>

                <div>
                    <p class="text-xs font-black uppercase tracking-widest text-gray-400">Email</p>
                    <p class="text-xl font-bold text-gray-900">${user.email}</p>
                </div>
            </div>

            <!-- RIGHT COLUMN -->
            <div class="space-y-6">
                <div>
                    <p class="text-xs font-black uppercase tracking-widest text-gray-400">Phone</p>
                    <p class="text-xl font-bold text-gray-900">${user.phone}</p>
                </div>

                <div>
                    <p class="text-xs font-black uppercase tracking-widest text-gray-400">Role</p>
                    <span class="inline-block bg-indigo-100 text-indigo-700 px-4 py-1.5 rounded-full font-black text-sm">
                        ${user.role}
                    </span>
                </div>

                <div>
                    <p class="text-xs font-black uppercase tracking-widest text-gray-400">Account Status</p>
                    <span class="inline-block bg-green-100 text-green-700 px-4 py-1.5 rounded-full font-black text-sm">
                        ${user.status}
                    </span>
                </div>
            </div>
        </div>

        <!-- FOOTER ACTIONS -->
        <div class="border-t border-gray-100 px-10 py-8 flex flex-col md:flex-row gap-4 justify-between items-center bg-gray-50">

            <p class="text-sm text-gray-500">
                Member since:
                <span class="font-bold text-gray-700">${user.createdAt}</span>
            </p>

            <!-- LOGOUT BUTTON -->
            <form action="/logout12" method="GET">
                <button type="submit"
                        class="bg-red-600 text-white px-8 py-4 rounded-2xl font-black uppercase tracking-widest text-sm
                               hover:bg-red-700 transition-all shadow-lg shadow-red-100">
                    Logout
                </button>
            </form>
        </div>

    </div>

</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
