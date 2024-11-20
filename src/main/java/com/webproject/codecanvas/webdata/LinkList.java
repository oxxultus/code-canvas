package com.webproject.codecanvas.webdata;

import lombok.Getter;

@Getter
public class LinkList {

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
            {"../images/examples/project0.gif", "Project 0 description here"},
            {"../images/examples/project1.gif", "Project 1 description here"},
            {"../images/examples/project2.gif", "Project 2 description here"},
            {"../images/examples/project3.gif", "Project 3 description here"},
            {"../images/examples/project4.gif", "Project 4 description here"},
            {"../images/examples/project5.gif", "Project 5 description here"}
    };
}
