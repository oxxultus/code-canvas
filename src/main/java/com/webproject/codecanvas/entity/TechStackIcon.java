package com.webproject.codecanvas.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "tech_stack_icons")
@Getter
@Setter
@ToString
public class TechStackIcon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_tech_stack_button_icon", nullable = false)
    private String firstTechStackButtonIcon = "";

    @Column(name = "second_tech_stack_button_icon", nullable = false)
    private String secondTechStackButtonIcon = "";

    @Column(name = "third_tech_stack_button_icon", nullable = false)
    private String thirdTechStackButtonIcon = "";

    @Column(name = "fourth_tech_stack_button_icon", nullable = false)
    private String fourthTechStackButtonIcon = "";

    @Column(name = "fifth_tech_stack_button_icon", nullable = false)
    private String fifthTechStackButtonIcon = "";

    @Column(name = "sixth_tech_stack_button_icon", nullable = false)
    private String sixthTechStackButtonIcon = "";

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    @ToString.Exclude
    @JsonBackReference
    private User user;

    // 생성자
    public TechStackIcon(String techStackButtonIcon1, String techStackButtonIcon2, String techStackButtonIcon3, String techStackButtonIcon4, String techStackButtonIcon5, String techStackButtonIcon6) {
        this.firstTechStackButtonIcon = techStackButtonIcon1;
        this.secondTechStackButtonIcon = techStackButtonIcon2;
        this.thirdTechStackButtonIcon = techStackButtonIcon3;
        this.fourthTechStackButtonIcon = techStackButtonIcon4;
        this.fifthTechStackButtonIcon = techStackButtonIcon5;
        this.sixthTechStackButtonIcon = techStackButtonIcon6;
    }

    // 기본 생성자
    public TechStackIcon() {
    }
}
