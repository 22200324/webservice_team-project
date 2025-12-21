package org.example.teamproject.controller;

import org.example.teamproject.DAO.ClassDAO;
import org.example.teamproject.DAO.NoticeDAO;
import org.example.teamproject.DAO.PostDAO;
import org.example.teamproject.DAO.UserDAO;
import org.example.teamproject.vo.ClassVO;
import org.example.teamproject.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private ClassDAO classDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private NoticeDAO noticeDAO;

    @Autowired
    private PostDAO postDAO;



    // 선생님 메인
    @GetMapping("/home")
    public String home() {
        return "teacher/home";
    }

    // 학급 생성 페이지
    @GetMapping("/class/new")
    public String createClassForm() {
        return "teacher/class_create";
    }

    // 내 학급 조회
    @GetMapping("/class")
    public String myClasses(HttpSession session, Model model) {

        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        model.addAttribute(
                "classList",
                classDAO.findByTeacherId(loginUser.getId())
        );

        return "teacher/class_list";
    }

    @GetMapping("/class/{classId}")
    public String classDetail(
            @PathVariable int classId,
            Model model
    ) {
        ClassVO clazz = classDAO.findById(classId);

        model.addAttribute("clazz", clazz);
        model.addAttribute("students",
                userDAO.findStudentsByClassCode(clazz.getClassCode())
        );
        model.addAttribute("parents",
                userDAO.findParentsByClassCode(clazz.getClassCode())
        );
        model.addAttribute("notices",
                noticeDAO.findByClassCode(clazz.getClassCode())
        );

        return "teacher/class_detail";
    }



    // 공지 작성 페이지
    @GetMapping("/notice/new")
    public String writeNoticeForm() {
        return "teacher/notice_create";
    }

    // 내가 작성한 공지 조회
    @GetMapping("/notice")
    public String myNotice() {
        return "teacher/notice_list";
    }


    @PostMapping("/class/new")
    public String createClass(
            @RequestParam("className") String className,
            HttpSession session
    ) {
        // 로그인한 선생님
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        ClassVO clazz = new ClassVO();
        clazz.setClassName(className);
        clazz.setTeacherId(loginUser.getId());
        clazz.setClassCode(classDAO.generateClassCode());

        classDAO.insertClass(clazz);

        return "redirect:/teacher/class";
    }

    @PostMapping("/class/delete")
    public String deleteClass(
            @RequestParam("classId") int classId,
            HttpSession session
    ) {
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        classDAO.deleteByIdAndTeacherId(classId, loginUser.getId());

        return "redirect:/teacher/class";
    }

    @GetMapping("/class/{classCode}/student/{studentId}/diaries")
    public String studentDiaryList(
            @PathVariable String classCode,
            @PathVariable int studentId,
            Model model
    ) {

        UserVO student = userDAO.findById(studentId);

        if (student == null || !classCode.equals(student.getClassCode())) {
            return "redirect:/error";
        }

        model.addAttribute("student", student);
        model.addAttribute(
                "diaries",
                postDAO.findStudentDiaries(studentId, classCode)
        );

        return "teacher/student_diary_list";
    }




}
