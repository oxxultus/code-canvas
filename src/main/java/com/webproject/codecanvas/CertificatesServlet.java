package com.webproject.codecanvas;

import jakarta.servlet.http.HttpServlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class CertificatesServlet extends HttpServlet {

    // 자격증 데이터를 서버 측에서 처리하도록 수정
    private static final Map<String, List<String>> certificateData = new HashMap<>();

    static {
        // 자격증 데이터 초기화
        certificateData.put("웹", Arrays.asList(
                "웹 개발 전문가",
                "HTML5 프로그래밍 자격증",
                "CSS 디자이너",
                "JavaScript 개발자 인증",
                "React 개발자 자격증",
                "웹 보안 전문가"
        ));
        certificateData.put("모바일", Arrays.asList(
                "모바일 앱 개발 전문가",
                "Android 개발 자격증",
                "iOS 전문가",
                "Flutter 앱 개발 인증",
                "모바일 UI/UX 디자이너"
        ));
        certificateData.put("데스크톱 애플리케이션", Arrays.asList(
                "C++ 개발자 인증",
                "Visual Studio 전문가",
                "Windows 애플리케이션 개발 자격증",
                "JavaFX 프로그래머",
                ".NET 개발자 인증"
        ));
        certificateData.put("데이터", Arrays.asList(
                "데이터 분석 전문가",
                "SQL 마스터",
                "데이터 과학 인증",
                "빅데이터 전문가",
                "데이터 시각화 인증"
        ));
        certificateData.put("임베디드 소프트웨어", Arrays.asList(
                "임베디드 소프트웨어 전문가",
                "마이크로컨트롤러 프로그래머",
                "ARM 프로세서 인증",
                "RTOS 전문가",
                "FPGA 개발 인증"
        ));
        certificateData.put("게임", Arrays.asList(
                "게임 개발 전문가",
                "Unity 인증 전문가",
                "Unreal Engine 개발자",
                "게임 그래픽 디자이너 인증",
                "VR/AR 게임 개발 전문가"
        ));
        certificateData.put("인공지능", Arrays.asList(
                "AI 전문가",
                "머신러닝 자격증",
                "딥러닝 마스터",
                "TensorFlow 개발자 인증",
                "AI 모델 최적화 전문가"
        ));
        certificateData.put("보안", Arrays.asList(
                "정보 보안 전문가",
                "네트워크 보안 인증",
                "침투 테스트 전문가",
                "클라우드 보안 전문가",
                "사이버 보안 관리사"
        ));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchInput = request.getParameter("searchInput");
        String field = request.getParameter("field");

        // 필터링된 자격증 목록을 저장할 리스트
        List<String> filteredCertificates = new ArrayList<>();

        if ("모든 자격증".equals(field) || field == null) {
            // 모든 자격증을 필터링
            for (Map.Entry<String, List<String>> entry : certificateData.entrySet()) {
                for (String cert : entry.getValue()) {
                    if (searchInput == null || cert.toLowerCase().contains(searchInput.toLowerCase())) {
                        filteredCertificates.add(cert);
                    }
                }
            }
        } else {
            // 특정 분야에서 자격증을 필터링
            List<String> certificates = certificateData.get(field);
            if (certificates != null) {
                for (String cert : certificates) {
                    if (searchInput == null || cert.toLowerCase().contains(searchInput.toLowerCase())) {
                        filteredCertificates.add(cert);
                    }
                }
            }
        }

        // 필터링된 자격증 데이터를 request 에 저장
        request.setAttribute("filteredCertificates", filteredCertificates);
        request.setAttribute("searchInput", searchInput);
        request.setAttribute("field", field);

        // JSP 로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/certificates");
        dispatcher.forward(request, response);
    }
}

