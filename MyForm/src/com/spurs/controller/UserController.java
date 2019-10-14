package com.spurs.controller;

import com.spurs.entity.User;
import com.spurs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String userLogin(String username, String password, HttpSession session,Model model){
        User user=userService.userLogin(username,password);
        if (user!=null){
            session.setAttribute("USER",user);
            return "redirect:toIndex.action";
        }
        model.addAttribute("msg","你输入的账号或密码错误，请重新登陆！");
        return "login";
    }

    @RequestMapping(value = "/toRegistered",method = RequestMethod.GET)
    public String userToRegistered(){
        return "registered";
    }

    @RequestMapping(value = "/registered",method = RequestMethod.POST)
    public String userRegistered(User user,Model model,HttpSession session){
        Integer rows=userService.userRegistered(user);
        if (rows==1){
            User checkuser=(User)session.getAttribute("USER");
            if (checkuser==null){
                return "login";
            }else {
                return "redirect:toIndex.action";
            }
        }
        model.addAttribute("msg","注册出现异常！请重试");
        return "registered";
    }

    @RequestMapping("/toIndex")
    public String toIndex(Model model){
        List<User> userList=userService.selectUserList();
        model.addAttribute("userList",userList);
        return "index";
    }

    @RequestMapping(value = "/userdelete",method = RequestMethod.GET)
    public String userdelete(Integer id,Model model){
        Integer rows=userService.userDelete(id);
        if (rows>=1){
            return "redirect:toIndex.action";
        }
        model.addAttribute("msg","删除时出现异常！");
        return "index";
    }

    @RequestMapping(value = "/toUserUpdate",method = RequestMethod.GET)
    public String toUserUpdate(Integer id,Model model){
        User user=userService.userSelectById(id);
        model.addAttribute("user",user);
        return "userUpdate";
    }

    @RequestMapping(value = "/userUpdate",method = RequestMethod.POST)
    public String userUpdate(User user,Model model){
        Integer rows=userService.userUpdate(user);
        if (rows>=1){
            return "redirect:toIndex.action";
        }
        model.addAttribute("msg","修改时出现异常");
        return "userUpdate";
    }

    @RequestMapping(value = "/selectUserByParam",method = RequestMethod.GET)
    public String selectUserByParam(String username,Model model){
        List<User> userList=userService.userSelectByUsername(username);
        model.addAttribute("userList",userList);
        return "index";
    }
}
