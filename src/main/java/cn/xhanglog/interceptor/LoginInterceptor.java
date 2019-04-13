package cn.xhanglog.interceptor;

import cn.xhanglog.entity.SysUser;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author: Xhang
 *
 * 登录拦截器
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        SysUser user =  (SysUser) request.getSession().getAttribute("user");
        if(user == null){
            response.sendRedirect("/login.html");
            return false;
        }else{
            return true;
        }
    }
}