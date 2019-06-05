package smonody.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import smonody.pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*用户登录拦截器*/
public class userLogin implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("用户登录");
        //获取session
        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("USER_SESSION");
        //判断session中是否有用户数据，如果有，则返回true，继续向下执行。
        if(user != null){
            return true;
        }
        String url = httpServletRequest.getRequestURI();
        //URL：除了login.jsp可以公开访问，其他的URL都进行拦截
        if(url.indexOf("/login") >= 0){
            return true;
        }
        //不符合条件的给出提示信息，并转发到登录页面
        httpServletRequest.setAttribute("msg","你还没有登录，请先登录！");
        httpServletRequest.getRequestDispatcher("static/login.jsp").forward(httpServletRequest,httpServletResponse);

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("test1: postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        System.out.println("test1: afterComletion");
    }
}
