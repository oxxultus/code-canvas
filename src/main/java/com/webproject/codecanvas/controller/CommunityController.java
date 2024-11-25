package com.webproject.codecanvas.controller;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.webproject.codecanvas.entity.User;
import org.springframework.stereotype.Controller;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

import java.io.File;
import java.io.InputStream;
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
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 외부 파일 경로에서 읽기
        File file = new File("/codecanvas/data/community_data.json"); // 외부 저장 경로 지정

        try {
            // JSON 데이터 읽기 및 변환
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> posts = List.of(); // 기본 빈 리스트 설정

            if (file.exists()) {
                // 파일이 존재하면 파일을 읽어들임
                posts = objectMapper.readValue(file, new TypeReference<>() {});

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
            System.out.println("[/writecommunity] : 세션에 저장된 정보가 없습니다. 로그인 페이지로 이동합니다.\n");
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
            System.out.println("[/api/community/save] : 세션에 저장된 정보가 없습니다. 로그인 페이지로 이동합니다.\n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 제목 공백 여부 확인
        if (write_title.isBlank()) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/api/community/save] : 제목이 비어 있습니다. 저장이 취소됩니다.\n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/community"; // 제목이 비어있으면 커뮤니티 페이지로 리디렉션
        }

        // 세션 정보 확인
        String email = currentUser.getEmail();
        String name = currentUser.getName();

        // 데이터 JSON에 저장
        Map<String, Object> data = new HashMap<>();
        data.put("noticeboard", noticeboard);
        data.put("email", email);
        data.put("name", name);
        data.put("write_title", write_title);
        data.put("write_detail", write_detail);
        data.put("language", language);

        try {
            // 디렉토리 경로 확인 후 생성
            File directory = new File("/codecanvas/data"); // 경로를 확인해보세요.
            if (!directory.exists()) {
                directory.mkdirs(); // 디렉토리 생성
            }

            // 파일 객체 생성
            File file = new File(directory, "community_data.json");

            // 파일이 없다면 새로 생성
            if (!file.exists()) {
                file.createNewFile();
            }

            // JSON 파일 읽기 및 데이터 추가
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> dataList;

            if (file.length() > 0) {
                dataList = objectMapper.readValue(file, new TypeReference<List<Map<String, Object>>>() {});
            } else {
                dataList = new ArrayList<>();
            }

            // UUID로 고유 ID 생성
            String id = UUID.randomUUID().toString();  // UUID로 ID 생성
            data.put("id", id); // ID 추가

            // 게시글 추가
            dataList.add(data);

            // 파일에 데이터 저장
            objectMapper.writerWithDefaultPrettyPrinter().writeValue(file, dataList);

        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/community"; // 오류 발생 시 리디렉션
        }

        // 성공적으로 처리된 경우
        System.out.println("------------------------------------------------------------------------\n");
        System.out.println("[/api/community/save] : 게시글 저장이 정상적으로 완료되었습니다.\n");
        System.out.println("------------------------------------------------------------------------\n");
        return "redirect:/community";
    }


}
