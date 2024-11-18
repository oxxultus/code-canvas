package com.webproject.codecanvas.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "projects")
@Data
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column()
    private String projectImg1;

    @Column()
    private String projectDesc1;

    @Column()
    private String projectImg2;

    @Column()
    private String projectDesc2;

    @Column()
    private String projectImg3;

    @Column()
    private String projectDesc3;

    @Column()
    private String projectImg4;

    @Column()
    private String projectDesc4;

    @Column()
    private String projectImg5;

    @Column()
    private String projectDesc5;

    @Column()
    private String projectImg6;

    @Column()
    private String projectDesc6;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Project(String projectImg1, String projectDesc1, String projectImg2, String projectDesc2, String projectImg3, String projectDesc3, String projectImg4, String projectDesc4, String projectImg5, String projectDesc5, String projectImg6, String projectDesc6) {
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

    public Project() {

    }
}