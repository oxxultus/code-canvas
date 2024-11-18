package com.webproject.codecanvas.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "tech_stack_icons")
@Data
public class TechStackIcon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column()
    private String firstTechStackButtonIcon;

    @Column()
    private String secondTechStackButtonIcon;

    @Column()
    private String thirdTechStackButtonIcon;

    @Column()
    private String fourthTechStackButtonIcon;

    @Column()
    private String fifthTechStackButtonIcon;

    @Column()
    private String sixthTechStackButtonIcon;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    public TechStackIcon(String techStackButtonIcon1, String techStackButtonIcon2, String techStackButtonIcon3, String techStackButtonIcon4, String techStackButtonIcon5, String techStackButtonIcon6) {
        this.firstTechStackButtonIcon = techStackButtonIcon1;
        this.secondTechStackButtonIcon = techStackButtonIcon2;
        this.thirdTechStackButtonIcon = techStackButtonIcon3;
        this.fourthTechStackButtonIcon = techStackButtonIcon4;
        this.fifthTechStackButtonIcon = techStackButtonIcon5;
        this.sixthTechStackButtonIcon = techStackButtonIcon6;
    }

    public TechStackIcon() {

    }
}
