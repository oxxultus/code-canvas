package com.webproject.codecanvas.controller;

import com.webproject.codecanvas.entity.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {

    @GetMapping("/")
    public String Main(){
        return "index";
    }

    @GetMapping("/home")
    public String Home(Model model, HttpSession session) {
        // 세션에서 로그인된 유저 정보 가져오기
        User currentUser = (User) session.getAttribute("user");


        if (currentUser == null) {
            model.addAttribute("error", "세션이 만료되었습니다. 다시 로그인해주세요.");

            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/home] : 세선에 저장된  정보가 없습니다. 로그인 페이지로 이동합니다.\n"); // 디버깅을 위한 출력
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/";  // 로그인되지 않은 상태라면 로그인 페이지로 리디렉션
        }

        return "home";
    }
}