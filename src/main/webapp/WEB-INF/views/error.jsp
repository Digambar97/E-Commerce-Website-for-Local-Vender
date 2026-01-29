<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LeLo | Something Went Wrong</title>

    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50 font-sans text-gray-900">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="container mx-auto px-4 py-24 flex items-center justify-center min-h-[70vh]">
    <div class="max-w-2xl w-full bg-white rounded-[2.5rem] shadow-2xl p-12 text-center border border-gray-100">

        <div class="inline-flex items-center justify-center w-24 h-24 bg-red-50 text-red-500 rounded-full mb-8">
            <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
            </svg>
        </div>

        <h1 class="text-6xl font-black text-indigo-900 mb-4 tracking-tighter">Oops!</h1>
        <h2 class="text-2xl font-bold text-gray-800 mb-6 uppercase tracking-tight">
            Something went wrong
        </h2>

        <p class="text-gray-500 mb-10 max-w-md mx-auto leading-relaxed">
            The page you are looking for might have been removed, had its name changed,
            or is temporarily unavailable.
        </p>

        <div class="flex flex-col sm:flex-row gap-4 justify-center items-center">
            <a href="${pageContext.request.contextPath}/"
               class="w-64 bg-indigo-600 text-white py-4 rounded-2xl font-black uppercase tracking-widest hover:bg-indigo-700 transition-all shadow-lg hover:shadow-indigo-200">
                Back to Home
            </a>

            <a href="${pageContext.request.contextPath}/contact"
               class="w-64 bg-gray-100 text-gray-700 py-4 rounded-2xl font-bold hover:bg-gray-200 transition-all">
                Contact Support
            </a>
        </div>

        <c:if test="${not empty pageContext.exception}">
            <div class="mt-12 text-left p-6 bg-gray-50 rounded-2xl border border-gray-100">
                <p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-2">Technical Details</p>
                <p class="text-xs text-red-400 font-mono overflow-auto max-h-32">
                    ${pageContext.exception.message}
                </p>
            </div>
        </c:if>

    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>