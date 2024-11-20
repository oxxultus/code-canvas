package com.webproject.codecanvas.webdata;

import lombok.Getter;

@Getter
public class LinkList {

    private final String defaultSocialLink = "https://docs.oracle.com/en/";

    // 포트폴리오 영역에 대한 변수 선언 및 초기화 (최대 6개만 입력 가능)
    private final String[] portfolio_img = {
            "../images/examples/portfolio0.gif",  // 기본 이미지 설정
            "../images/examples/portfolio1.gif",  // 기본 이미지 설정
            "../images/examples/portfolio2.gif",  // 기본 이미지 설정
            "../images/examples/portfolio3.gif",  // 기본 이미지 설정
            "../images/examples/portfolio4.gif",  // 기본 이미지 설정
            "../images/examples/portfolio5.gif"   // 기본 이미지 설정
    };

    // 프로젝트 영역에 대한 변수 선언 및 초기화 (최대 6개만 입력 가능)
    private final String[][] project_img_and_desc = {
            {"../images/examples/project0.gif", "저희 웹 개발 프로젝트 팀장은 유다은 팀원은 정찬, 김영진 입니다."},
            {"../images/examples/project1.gif", "본 프로젝트에서 사용된 프레임워크는 SpringBoot 입니다."},
            {"../images/examples/project2.gif", "본 프로젝트에서 사용된 언어는 Java, Javascript, Html, Css 입니다. 주로 백엔드 부분은 Java 로 작성되었으며 프론트엔드 부분은 Javascript, Html, Css 로 구성되어 있습니다."},
            {"../images/examples/project3.gif", "본 프로젝트에서 사용된 SQL 은 MYSQL 입니다."},
            {"../images/examples/project4.gif", "긴 글 읽어주셔서 감사합니다. 이상입니다."},
            {"../images/examples/project5.gif", "오늘도 좋은하루 보내시길 바라겠습니다."}
    };

    public String getPortfolio_img(int number) {
        return portfolio_img[number];
    }

    public String getProject_img_and_desc(int x, int y) {
        return project_img_and_desc[x][y];
    }
}
