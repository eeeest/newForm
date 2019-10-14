package com.spurs.interceptor;


import com.spurs.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url=request.getRequestURI();
        if (url.indexOf("/login.action")>=0||url.indexOf("/toRegistered.action")>=0||url.indexOf("registered.action")>=0){
            return true;
        }
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("USER");
        if (user!=null){
            return true;
        }

        request.setAttribute("msg","你还没有登陆，请先登陆！");
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
