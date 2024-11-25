package com.webproject.codecanvas.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.webproject.codecanvas.entity.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.bind.annotation.GetMapping;

import java.io.*;

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
        // 세션에서 현재 유저 정보 가져오기
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/information] : 세션에 저장된 정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // certificates_data.json 파일 처리
        List<Map<String, Object>> certificates = new ArrayList<>();
        String targetPath = "/codecanvas/data/certificates_data.json"; // 복사 대상 경로

        try {
            // 외부 파일이 존재하지 않는 경우 클래스패스에서 복사
            File targetFile = new File(targetPath);
            if (!targetFile.exists()) {
                System.out.println("certificates_data.json 파일이 외부 경로에 없습니다. 클래스패스에서 복사합니다.");
                InputStream inputStream = getClass().getClassLoader().getResourceAsStream("data/certificates_data.json");
                if (inputStream == null) {
                    System.out.println("클래스패스에서 certificates_data.json 파일을 찾을 수 없습니다.");
                    return "error"; // 파일이 없으면 에러 반환
                }

                // 파일 복사
                File targetDir = new File("/codecanvas/data/");
                if (!targetDir.exists() && !targetDir.mkdirs()) {
                    System.out.println("디렉토리 생성에 실패했습니다.");
                    return "error";
                }
                try (OutputStream outputStream = new FileOutputStream(targetFile)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }
            }

            // 외부 파일에서 JSON 읽기
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(new File(targetPath));

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

        // competitions.json 파일 처리
        List<Map<String, Object>> competitions = new ArrayList<>();
        String competitionsPath = "/codecanvas/data/competitions.json"; // 복사 대상 경로

        try {
            // 외부 파일이 존재하지 않는 경우 클래스패스에서 복사
            File targetFile = new File(competitionsPath);
            if (!targetFile.exists()) {
                System.out.println("competitions.json 파일이 외부 경로에 없습니다. 클래스패스에서 복사합니다.");
                InputStream inputStream = getClass().getClassLoader().getResourceAsStream("data/competitions.json");
                if (inputStream == null) {
                    System.out.println("클래스패스에서 competitions.json 파일을 찾을 수 없습니다.");
                    return "error"; // 파일이 없으면 에러 반환
                }

                // 파일 복사
                File targetDir = new File("/codecanvas/data/");
                if (!targetDir.exists() && !targetDir.mkdirs()) {
                    System.out.println("디렉토리 생성에 실패했습니다.");
                    return "error";
                }
                try (OutputStream outputStream = new FileOutputStream(targetFile)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }
            }

            // 외부 파일에서 JSON 읽기
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(new File(competitionsPath));

            // JSON 배열 순회하여 competitions 리스트에 Map 형태로 변환
            for (JsonNode competitionsNode : rootNode) {
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

        return "information"; // JSP 페이지 이름
    }


    @GetMapping("/competitions")
    public String Competitions(Model model, HttpSession session,
                               @RequestParam(value = "competitions_title", required = false, defaultValue = "") String competitions_title,
                               @RequestParam(value = "competitions_field", required = false, defaultValue = "") String competitions_field) {

        // 세션에서 현재 유저 정보 가져오기
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/competitions] : 세션에 저장된 정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 외부 파일 경로
        String targetPath = "/codecanvas/data/competitions.json";

        try {
            // 외부 파일이 존재하지 않으면 클래스패스에서 복사
            File targetFile = new File(targetPath);
            if (!targetFile.exists()) {
                System.out.println("competitions.json 파일이 외부 경로에 없습니다. 클래스패스에서 복사합니다.");
                InputStream inputStream = getClass().getClassLoader().getResourceAsStream("data/competitions.json");
                if (inputStream == null) {
                    System.out.println("클래스패스에서 competitions.json 파일을 찾을 수 없습니다.");
                    return "error"; // 파일이 없으면 에러 반환
                }

                // 파일 복사
                File targetDir = new File("/codecanvas/data/");
                if (!targetDir.exists() && !targetDir.mkdirs()) {
                    System.out.println("디렉토리 생성에 실패했습니다.");
                    return "error";
                }
                try (OutputStream outputStream = new FileOutputStream(targetFile)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }
            }

            // 외부 파일에서 JSON 읽기
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> competitions = objectMapper.readValue(new File(targetPath), new TypeReference<List<Map<String, Object>>>() {});

            // 검색 조건 처리
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

            // 결과를 모델에 추가
            model.addAttribute("competitions", competitions);
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("competitions", List.of()); // 오류 발생 시 빈 리스트 전달
        }

        return "competitions"; // JSP 페이지 이름
    }


    @GetMapping("/certificates")
    public String Certificates(Model model, HttpSession session,
                               @RequestParam(value = "certificate_title", required = false, defaultValue = "") String certificate_title,
                               @RequestParam(value = "certificate_field", required = false, defaultValue = "") String certificate_field) {

        // 세션에서 현재 유저 정보 가져오기
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/certificates] : 세션에 저장된 정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 외부 파일 경로
        String targetPath = "/codecanvas/data/certificates_data.json";

        try {
            // 외부 파일이 존재하지 않으면 클래스패스에서 복사
            File targetFile = new File(targetPath);
            if (!targetFile.exists()) {
                System.out.println("certificates_data.json 파일이 외부 경로에 없습니다. 클래스패스에서 복사합니다.");
                InputStream inputStream = getClass().getClassLoader().getResourceAsStream("data/certificates_data.json");
                if (inputStream == null) {
                    System.out.println("클래스패스에서 certificates_data.json 파일을 찾을 수 없습니다.");
                    return "error"; // 파일이 없으면 에러 반환
                }

                // 파일 복사
                File targetDir = new File("/codecanvas/data/");
                if (!targetDir.exists() && !targetDir.mkdirs()) {
                    System.out.println("디렉토리 생성에 실패했습니다.");
                    return "error";
                }
                try (OutputStream outputStream = new FileOutputStream(targetFile)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }
            }

            // 외부 파일에서 JSON 데이터 읽기
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> certificates = objectMapper.readValue(new File(targetPath), new TypeReference<List<Map<String, Object>>>() {});

            // 검색 조건 처리
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

            // 결과를 모델에 추가
            model.addAttribute("certificates", certificates);
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("certificates", List.of()); // 오류 발생 시 빈 리스트 전달
        }

        return "certificates"; // JSP 페이지 이름
    }


    @PostMapping("/increaseCertificateCount")
    public Map<String, Object> increaseCertificateCount(@RequestBody Map<String, String> requestData) {
        String certificateTitle = requestData.get("certificateTitle");

        // 외부 파일 경로
        String targetPath = "/codecanvas/data/certificates_data.json";
        ObjectMapper objectMapper = new ObjectMapper();
        List<Map<String, Object>> certificates = new ArrayList<>();

        try {
            // 외부 파일이 존재하지 않으면 클래스패스에서 복사
            File targetFile = new File(targetPath);
            if (!targetFile.exists()) {
                System.out.println("certificates_data.json 파일이 외부 경로에 없습니다. 클래스패스에서 복사합니다.");
                InputStream inputStream = getClass().getClassLoader().getResourceAsStream("data/certificates_data.json");
                if (inputStream == null) {
                    System.out.println("클래스패스에서 certificates_data.json 파일을 찾을 수 없습니다.");
                    throw new IOException("파일을 찾을 수 없습니다.");
                }

                // 파일 복사
                File targetDir = new File("/codecanvas/data/");
                if (!targetDir.exists() && !targetDir.mkdirs()) {
                    System.out.println("디렉토리 생성에 실패했습니다.");
                    throw new IOException("디렉토리 생성 실패");
                }
                try (OutputStream outputStream = new FileOutputStream(targetFile)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }
            }

            // 외부 파일에서 JSON 데이터 읽기
            certificates = objectMapper.readValue(new File(targetPath), new TypeReference<List<Map<String, Object>>>() {});

            // 해당 certificate_title을 가진 항목을 찾아서 certificate_count 증가
            boolean updated = false;
            for (Map<String, Object> certificate : certificates) {
                if (certificate.get("certificate_title").equals(certificateTitle)) {
                    int count = (int) certificate.get("certificate_count");
                    certificate.put("certificate_count", count + 1);
                    updated = true;
                    break;
                }
            }

            if (!updated) {
                System.out.println("해당 certificateTitle을 찾을 수 없습니다: " + certificateTitle);
                throw new IllegalArgumentException("Certificate title not found");
            }

            // 수정된 데이터를 외부 파일에 다시 저장
            objectMapper.writerWithDefaultPrettyPrinter().writeValue(new File(targetPath), certificates);
            System.out.println(certificateTitle + " 값이 정상적으로 증가되었습니다.");

        } catch (IOException e) {
            e.printStackTrace();
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("message", "Error updating certificate count");
            errorResponse.put("error", e.getMessage());
            return errorResponse;
        }

        // 성공 응답 반환
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Certificate count updated successfully");
        return response;
    }


    @PostMapping("/increaseCompetitionsCount")
    public Map<String, Object> increaseCompetitionsCount(@RequestBody Map<String, String> requestData) {
        String competitionsTitle = requestData.get("competitionsTitle");

        // 외부 파일 경로
        String targetPath = "/codecanvas/data/competitions.json";
        ObjectMapper objectMapper = new ObjectMapper();
        List<Map<String, Object>> competitions = new ArrayList<>();

        try {
            // 외부 파일이 존재하지 않으면 클래스패스에서 복사
            File targetFile = new File(targetPath);
            if (!targetFile.exists()) {
                System.out.println("competitions.json 파일이 외부 경로에 없습니다. 클래스패스에서 복사합니다.");
                InputStream inputStream = getClass().getClassLoader().getResourceAsStream("data/competitions.json");
                if (inputStream == null) {
                    System.out.println("클래스패스에서 competitions.json 파일을 찾을 수 없습니다.");
                    throw new IOException("파일을 찾을 수 없습니다.");
                }

                // 파일 복사
                File targetDir = new File("/codecanvas/data/");
                if (!targetDir.exists() && !targetDir.mkdirs()) {
                    System.out.println("디렉토리 생성에 실패했습니다.");
                    throw new IOException("디렉토리 생성 실패");
                }
                try (OutputStream outputStream = new FileOutputStream(targetFile)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }
            }

            // 외부 파일에서 JSON 데이터 읽기
            competitions = objectMapper.readValue(new File(targetPath), new TypeReference<List<Map<String, Object>>>() {});

            // 해당 competitions_title을 가진 항목을 찾아서 competitions_count 증가
            boolean updated = false;
            for (Map<String, Object> comp : competitions) {
                if (comp.get("competitions_title").equals(competitionsTitle)) {
                    int count = (int) comp.get("competitions_count");
                    comp.put("competitions_count", count + 1);
                    updated = true;
                    break;
                }
            }

            if (!updated) {
                System.out.println("해당 competitionsTitle을 찾을 수 없습니다: " + competitionsTitle);
                throw new IllegalArgumentException("Competitions title not found");
            }

            // 수정된 데이터를 외부 파일에 다시 저장
            objectMapper.writerWithDefaultPrettyPrinter().writeValue(new File(targetPath), competitions);
            System.out.println(competitionsTitle + " 값이 정상적으로 증가되었습니다.");

        } catch (IOException e) {
            e.printStackTrace();
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("message", "Error updating competitions count");
            errorResponse.put("error", e.getMessage());
            return errorResponse;
        }

        // 성공 응답 반환
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Competitions count updated successfully");
        return response;
    }


}
