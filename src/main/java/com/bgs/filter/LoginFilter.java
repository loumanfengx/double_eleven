/*
package com.bgs.filter;

*/
/**
 * @ClassName: LoginFilter
 * @Description: TODO
 * @Author: Kang Jianhang
 * @Date: 2020/11/8 18:55
 * @Version: v1.0
 *//*



import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebFilter(urlPatterns = {"/product/*","/bill/*","/jsps/product/*","/jsps/shops/shopsinfo.jsp",
"/jsps/shops/shopspasswordedit.jsp","/jsps/bill/*"})
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse rep = (HttpServletResponse) servletResponse;
        //String uri = req.getRequestURI();
       */
/* if (uri.endsWith("login.jsp")) {
            filterChain.doFilter(servletRequest,servletResponse);
        }*//*

        Object session = req.getSession().getAttribute("session");

        if (session != null) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            rep.sendRedirect(req.getContextPath()+"/jsps/error.jsp");
        }
    }

    @Override
    public void destroy() {

    }
}
*/
