package com.webproject.codecanvas.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.webproject.codecanvas.entity.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class InformationController {

    @GetMapping("/information")
    public String Information(Model model) {
        String filePath = "src/main/webapp/data/certificates_data.json"; // JSON 파일 경로
        System.out.println(filePath);
        List<Map<String, Object>> certificates = new ArrayList<>();

        try {
            // ObjectMapper를 사용하여 JSON 파일 읽기
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(new File(filePath));

            // JSON 배열 순회하여 certificates 리스트에 Map 형태로 변환
            for (JsonNode certificateNode : rootNode) {
                Map<String, Object> certificateMap = new HashMap<>();
                certificateMap.put("certificate_field", certificateNode.get("certificate_field").asText());
                certificateMap.put("certificate_title", certificateNode.get("certificate_title").asText());
                certificateMap.put("certificate_count", certificateNode.get("certificate_count").asInt());
                certificates.add(certificateMap);
            }

            // certificate_count 기준으로 내림차순 정렬
            certificates.sort((certificate1, certificate2) -> {
                int count1 = (int) certificate1.get("certificate_count");
                int count2 = (int) certificate2.get("certificate_count");
                return Integer.compare(count2, count1); // 내림차순 정렬
            });

        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(certificates);
        // 정렬된 certificate 정보를 모델에 추가
        model.addAttribute("certificates", certificates);


        return "information";  // JSP 페이지 이름
    }

    @GetMapping("/competitions")
    public String Competitions (){
        return "competitions";
    }

    @GetMapping("/certificates")
    public String Certificates(Model model, HttpSession session,
                               @RequestParam(value = "certificate_title", required = false, defaultValue = "") String certificate_title,
                               @RequestParam(value = "certificate_field", required = false, defaultValue = "") String certificate_field) {


        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/certificates] : 세선에 저장된  정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // JSON 파일 경로
        String filePath = "src/main/webapp/data/certificates_data.json"; // 파일명 확인
        File file = new File(filePath);

        try {
            // JSON 데이터 읽기 및 변환
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> certificates = List.of(); // 기본 빈 리스트 설정

            if (file.exists()) {
                certificates = objectMapper.readValue(file, new TypeReference<>() {
                });

                // 검색 조건이 비어있지 않으면 필터링, 그렇지 않으면 전체 게시글을 출력
                if (certificate_title != null && !certificate_title.isEmpty()) {
                    certificates = certificates.stream()
                            .filter(certificate -> certificate.get("certificate_title").toString().contains(certificate_title))
                            .collect(Collectors.toList());
                }
                if (certificate_field != null && !certificate_field.isEmpty()) {
                    certificates = certificates.stream()
                            .filter(certificate -> certificate.get("certificate_field").toString().equals(certificate_field))
                            .collect(Collectors.toList());
                }
            }
            model.addAttribute("certificates", certificates); // 검색된 게시글 전달
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("certificates", List.of()); // 오류 발생 시 빈 리스트 전달
        }

        return "certificates";
    }

    @PostMapping("/increaseCertificateCount")
    public Map<String, Object> increaseCertificateCount(@RequestBody Map<String, String> requestData) {
        String certificateTitle = requestData.get("certificateTitle");

        String filePath = "src/main/webapp/data/certificates_data.json"; // JSON 파일 경로
        ObjectMapper objectMapper = new ObjectMapper();
        List<Map<String, Object>> certificates = new ArrayList<>();

        try {
            // JSON 파일 읽기
            File file = new File(filePath);
            if (file.exists()) {
                certificates = objectMapper.readValue(file, new TypeReference<List<Map<String, Object>>>() {});
            }

            // 해당 certificate_title을 가진 항목을 찾아서 certificate_count 증가
            for (Map<String, Object> certificate : certificates) {
                if (certificate.get("certificate_title").equals(certificateTitle)) {
                    int count = (int) certificate.get("certificate_count");
                    certificate.put("certificate_count", count + 1);
                    break;
                }
            }
            System.out.println(certificateTitle + "값이 정상적으로 증가 되었습니다.");

            // 수정된 certificates 리스트를 파일에 다시 저장
            objectMapper.writeValue(file, certificates);

        } catch (IOException e) {
            e.printStackTrace();
        }

        // 응답으로 변경된 certificate_count를 반환
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Certificate count updated successfully");
        return response;
    }
}
