package com.Sarth.QuikBuy.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class SessionInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession(false);

        // Check if session exists and if "USER" attribute is present
        // We check for null here because getAttribute returns an Object
        if (session == null || session.getAttribute("USER") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return false; // Stops the request and returns 401
        }

        // DO NOT try to cast session.getAttribute("USER") to a String.
        // If you need the object, cast it to com.Sarth.LeLo.model.User

        return true;
    }
}