package com.webproject.codecanvas.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "projects")
@Getter
@Setter
@ToString
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "project_img_1", nullable = false)
    private String projectImg1 = "";

    @Column(name = "project_desc_1", nullable = false)
    private String projectDesc1 = "";

    @Column(name = "project_img_2", nullable = false)
    private String projectImg2 = "";

    @Column(name = "project_desc_2", nullable = false)
    private String projectDesc2 = "";

    @Column(name = "project_img_3", nullable = false)
    private String projectImg3 = "";

    @Column(name = "project_desc_3", nullable = false)
    private String projectDesc3 = "";

    @Column(name = "project_img_4", nullable = false)
    private String projectImg4 = "";

    @Column(name = "project_desc_4", nullable = false)
    private String projectDesc4 = "";

    @Column(name = "project_img_5", nullable = false)
    private String projectImg5 = "";

    @Column(name = "project_desc_5", nullable = false)
    private String projectDesc5 = "";

    @Column(name = "project_img_6", nullable = false)
    private String projectImg6 = "";

    @Column(name = "project_desc_6", nullable = false)
    private String projectDesc6 = "";

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    @ToString.Exclude
    @JsonBackReference
    private User user;

    // 기본 생성자
    public Project() {
    }

    // 생성자 (필요한 경우)
    public Project(String projectImg1, String projectDesc1, String projectImg2, String projectDesc2,
                   String projectImg3, String projectDesc3, String projectImg4, String projectDesc4,
                   String projectImg5, String projectDesc5, String projectImg6, String projectDesc6) {
        this.projectImg1 = projectImg1;
        this.projectDesc1 = projectDesc1;
        this.projectImg2 = projectImg2;
        this.projectDesc2 = projectDesc2;
        this.projectImg3 = projectImg3;
        this.projectDesc3 = projectDesc3;
        this.projectImg4 = projectImg4;
        this.projectDesc4 = projectDesc4;
        this.projectImg5 = projectImg5;
        this.projectDesc5 = projectDesc5;
        this.projectImg6 = projectImg6;
        this.projectDesc6 = projectDesc6;
    }
}
