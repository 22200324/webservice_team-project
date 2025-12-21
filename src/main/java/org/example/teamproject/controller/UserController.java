package org.example.teamproject.controller;

import org.example.teamproject.DAO.UserDAO;
import org.example.teamproject.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserDAO userDAO;

    /* ======================
       로그인
     ====================== */

    // 로그인 페이지
    @GetMapping("/login")
    public String loginForm() {
        return "login/login";
    }

    // 로그인 처리
    @PostMapping("/login")
    public String login(UserVO user,
                        HttpSession session,
                        Model model) {

        // DB에서 사용자 조회
        UserVO loginUser = userDAO.findByUsernameAndPassword(
                user.getUsername(),
                user.getPassword()
        );

        // 로그인 실패
        if (loginUser == null) {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "login/login";
        }

        // 로그인 성공 → 세션 저장
        session.setAttribute("loginUser", loginUser);


        // 역할별 기본 홈
        switch (loginUser.getRole()) {
            case "STUDENT":
                return "redirect:/student/home";
            case "PARENT":
                return "redirect:/parent/home";
            case "TEACHER":
                return "redirect:/teacher/home";
            default:
                return "redirect:/";
        }
    }

    /* ======================
       로그아웃
     ====================== */

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    /* ======================
       회원가입
     ====================== */

    // 회원가입 페이지
    @GetMapping("/signup")
    public String signupForm() {
        return "login/signup";
    }

    // 회원가입 처리
    @PostMapping("/signup")
    public String signup(UserVO user,
                         Model model) {

        // 학생 / 학부모는 학급 코드 필수
        if (!"TEACHER".equals(user.getRole())
                && (user.getClassCode() == null || user.getClassCode().isEmpty())) {

            model.addAttribute("error", "학급 코드는 필수 입력 항목입니다.");
            return "login/signup";
        }

        userDAO.insertUser(user);
        return "redirect:/login";
    }
}
