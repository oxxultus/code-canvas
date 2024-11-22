package com.webproject.codecanvas.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.webproject.codecanvas.entity.User;
import org.springframework.stereotype.Controller;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.UUID;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class CommunityController {

    @GetMapping("/community")
    public String community(Model model, HttpSession session,
                            @RequestParam(value = "search_data", required = false) String title,
                            @RequestParam(value = "noticeboard", required = false) String noticeboard,
                            @RequestParam(value = "language", required = false) String language) {

        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/community] : 세선에 저장된  정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // JSON 파일 경로
        String filePath = "src/main/webapp/data/community_data.json"; // 파일명 확인
        File file = new File(filePath);

        try {
            // JSON 데이터 읽기 및 변환
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> posts = List.of(); // 기본 빈 리스트 설정

            if (file.exists()) {
                posts = objectMapper.readValue(file, new TypeReference<List<Map<String, Object>>>() {});

                // 검색 조건이 비어있지 않으면 필터링, 그렇지 않으면 전체 게시글을 출력
                if (title != null && !title.isEmpty()) {
                    posts = posts.stream()
                            .filter(post -> post.get("write_title").toString().contains(title))
                            .collect(Collectors.toList());
                }
                if (noticeboard != null && !noticeboard.isEmpty()) {
                    posts = posts.stream()
                            .filter(post -> post.get("noticeboard").toString().equals(noticeboard))
                            .collect(Collectors.toList());
                }
                if (language != null && !language.isEmpty()) {
                    posts = posts.stream()
                            .filter(post -> post.get("language").toString().equals(language))
                            .collect(Collectors.toList());
                }
            }

            model.addAttribute("posts", posts); // 검색된 게시글 전달
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("posts", List.of()); // 오류 발생 시 빈 리스트 전달
        }

        return "community";
    }


    @GetMapping("/writecommunity")
    public String writeCommunity(HttpSession session) {

        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/writecommunity] : 세선에 저장된  정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        return "writecommunity";
    }

    @PostMapping("/api/community/save")
    public String saveCommunity(
            @RequestParam(value = "write_title", defaultValue = "") String write_title,
            @RequestParam(value = "write_detail", defaultValue = "") String write_detail,
            @RequestParam(value = "noticeboard", defaultValue = "") String noticeboard,
            @RequestParam(value = "language", defaultValue = "") String language,
            HttpSession session) {

        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/api/community/save] : 세선에 저장된  정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 1. 세션 확인
        String email = currentUser.getEmail();
        String name = currentUser.getName();

        // 2. 전달받은 데이터 JSON 파일로 저장
        Map<String, Object> data = new HashMap<>();
        data.put("noticeboard", noticeboard);
        data.put("email", email);
        data.put("name", name);
        data.put("write_title", write_title);
        data.put("write_detail", write_detail);
        data.put("language", language);

        try {
            // JSON 파일로 데이터 저장
            ObjectMapper objectMapper = new ObjectMapper();
            String fileName = "src/main/webapp/data/community_data.json"; // 상대 경로
            File file = new File(fileName);

            // 파일이 이미 존재하면 기존 데이터 유지하면서 새 데이터 추가
            List<Map<String, Object>> dataList;
            if (file.exists()) {
                dataList = objectMapper.readValue(file, new TypeReference<>() {
                });
            } else {
                dataList = new ArrayList<>();
            }

            // UUID로 고유한 id 생성
            String id = UUID.randomUUID().toString();  // UUID 를 id로 사용
            data.put("id", id); // id 추가

            // 게시글 추가
            dataList.add(data);

            // 업데이트된 리스트를 다시 파일에 쓰기
            objectMapper.writerWithDefaultPrettyPrinter().writeValue(file, dataList);
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/community"; // 오류 발생 시 반환
        }

        // 성공적으로 처리된 경우
        System.out.println("------------------------------------------------------------------------\n");
        System.out.println("[/api/community/save] : 게시글 저장이 정상적으로 완료 되었습니다. \n");
        System.out.println("------------------------------------------------------------------------\n");
        return "redirect:/community";
    }


}
