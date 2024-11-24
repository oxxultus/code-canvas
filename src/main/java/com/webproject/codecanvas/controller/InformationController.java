package com.webproject.codecanvas.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.webproject.codecanvas.entity.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class InformationController {

    @GetMapping("/information")
    public String Information(Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/information] : 세션에 저장된 정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 클래스패스에서 리소스 로드
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream("data/certificates_data.json");
        if (inputStream == null) {
            System.out.println("파일을 찾을 수 없습니다.");
            return "error";  // 파일을 찾을 수 없을 경우 처리
        }

        List<Map<String, Object>> certificates = new ArrayList<>();
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(inputStream);

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

        model.addAttribute("certificates", certificates);

        // competitions.json 파일 경로
        InputStream inputStream1 = getClass().getClassLoader().getResourceAsStream("data/competitions.json");
        if (inputStream1 == null) {
            System.out.println("파일을 찾을 수 없습니다.");
            return "error";  // 파일을 찾을 수 없을 경우 처리
        }

        List<Map<String, Object>> competitions = new ArrayList<>();
        try {
            ObjectMapper objectMapper1 = new ObjectMapper();
            JsonNode rootNode1 = objectMapper1.readTree(inputStream1);

            // JSON 배열 순회하여 competitions 리스트에 Map 형태로 변환
            for (JsonNode competitionsNode : rootNode1) {
                Map<String, Object> competitionsMap = new HashMap<>();
                competitionsMap.put("competitions_field", competitionsNode.get("competitions_field").asText());
                competitionsMap.put("competitions_title", competitionsNode.get("competitions_title").asText());
                competitionsMap.put("competitions_count", competitionsNode.get("competitions_count").asInt());
                competitions.add(competitionsMap);
            }

            // competitions_count 기준으로 내림차순 정렬
            competitions.sort((competitions1, competitions2) -> {
                int count1 = (int) competitions1.get("competitions_count");
                int count2 = (int) competitions2.get("competitions_count");
                return Integer.compare(count2, count1); // 내림차순 정렬
            });

        } catch (IOException e) {
            e.printStackTrace();
        }

        model.addAttribute("competitions", competitions);

        return "information";  // JSP 페이지 이름
    }

    @GetMapping("/competitions")
    public String Competitions(Model model, HttpSession session,
                               @RequestParam(value = "competitions_title", required = false, defaultValue = "") String competitions_title,
                               @RequestParam(value = "competitions_field", required = false, defaultValue = "") String competitions_field) {

        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/competitions] : 세션에 저장된  정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 클래스패스에서 리소스 로드
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream("data/competitions.json");
        if (inputStream == null) {
            System.out.println("파일을 찾을 수 없습니다.");
            return "error";  // 파일을 찾을 수 없을 경우 처리
        }

        try {
            // JSON 데이터 읽기 및 변환
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> competitions = objectMapper.readValue(inputStream, new TypeReference<List<Map<String, Object>>>() {});

            // 검색 조건이 비어있지 않으면 필터링, 그렇지 않으면 전체 게시글을 출력
            if (competitions_title != null && !competitions_title.isEmpty()) {
                competitions = competitions.stream()
                        .filter(competition -> competition.get("competitions_title").toString().contains(competitions_title))
                        .collect(Collectors.toList());
            }
            if (competitions_field != null && !competitions_field.isEmpty()) {
                competitions = competitions.stream()
                        .filter(competition -> competition.get("competitions_field").toString().equals(competitions_field))
                        .collect(Collectors.toList());
            }

            model.addAttribute("competitions", competitions); // 검색된 게시글 전달
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("competitions", List.of()); // 오류 발생 시 빈 리스트 전달
        }

        return "competitions";
    }

    @GetMapping("/certificates")
    public String Certificates(Model model, HttpSession session,
                               @RequestParam(value = "certificate_title", required = false, defaultValue = "") String certificate_title,
                               @RequestParam(value = "certificate_field", required = false, defaultValue = "") String certificate_field) {

        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/certificates] : 세션에 저장된  정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 클래스패스에서 리소스 로드
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream("data/certificates_data.json");
        if (inputStream == null) {
            System.out.println("파일을 찾을 수 없습니다.");
            return "error";  // 파일을 찾을 수 없을 경우 처리
        }

        try {
            // JSON 데이터 읽기 및 변환
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> certificates = objectMapper.readValue(inputStream, new TypeReference<List<Map<String, Object>>>() {});

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

        // 클래스패스에서 리소스 로드
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream("data/certificates_data.json");
        ObjectMapper objectMapper = new ObjectMapper();
        List<Map<String, Object>> certificates = new ArrayList<>();

        try {
            // JSON 파일 읽기
            if (inputStream != null) {
                certificates = objectMapper.readValue(inputStream, new TypeReference<List<Map<String, Object>>>() {});
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

            // 수정된 certificates 리스트를 클래스패스에 다시 저장 (권장되지 않음, 대신 데이터베이스 사용)
            // objectMapper.writeValue(new File("path/to/certificates_data.json"), certificates);

        } catch (IOException e) {
            e.printStackTrace();
        }

        // 응답으로 변경된 certificate_count를 반환
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Certificate count updated successfully");
        return response;
    }

    @PostMapping("/increaseCompetitionsCount")
    public Map<String, Object> increaseCompetitionsCount(@RequestBody Map<String, String> requestData) {
        String competitionsTitle = requestData.get("competitionsTitle");

        // 클래스패스에서 리소스 로드
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream("data/competitions.json");
        ObjectMapper objectMapper = new ObjectMapper();
        List<Map<String, Object>> competition = new ArrayList<>();

        try {
            // JSON 파일 읽기
            if (inputStream != null) {
                competition = objectMapper.readValue(inputStream, new TypeReference<List<Map<String, Object>>>() {});
            }

            // 해당 competitions_title을 가진 항목을 찾아서 competitions_count 증가
            for (Map<String, Object> comp : competition) {
                if (comp.get("competitions_title").equals(competitionsTitle)) {
                    int count = (int) comp.get("competitions_count");
                    comp.put("competitions_count", count + 1);
                    break;
                }
            }
            System.out.println(competitionsTitle + "값이 정상적으로 증가 되었습니다.");

            // 수정된 competitions 리스트를 클래스패스에 다시 저장 (권장되지 않음, 대신 데이터베이스 사용)
            // objectMapper.writeValue(new File("path/to/competitions.json"), competition);

        } catch (IOException e) {
            e.printStackTrace();
        }

        // 응답으로 변경된 competitions_count를 반환
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Competitions count updated successfully");
        return response;
    }

}
