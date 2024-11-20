package com.webproject.codecanvas.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "social_button_icons")
@Getter
@Setter
@ToString
public class SocialButtonIcon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_social_button_icon", nullable = false)
    private String firstSocialButtonIcon = "";

    @Column(name = "first_social_button_link", nullable = false)
    private String firstSocialButtonLink = "";

    @Column(name = "second_social_button_icon", nullable = false)
    private String secondSocialButtonIcon = "";

    @Column(name = "second_social_button_link", nullable = false)
    private String secondSocialButtonLink = "";

    @Column(name = "third_social_button_icon", nullable = false)
    private String thirdSocialButtonIcon = "";

    @Column(name = "third_social_button_link", nullable = false)
    private String thirdSocialButtonLink = "";

    @Column(name = "fourth_social_button_icon", nullable = false)
    private String fourthSocialButtonIcon = "";

    @Column(name = "fourth_social_button_link", nullable = false)
    private String fourthSocialButtonLink = "";

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    @ToString.Exclude // 순환 참조 방지
    @JsonBackReference
    private User user;

    // 생성자
    public SocialButtonIcon(String firstSocialButtonIcon, String firstSocialButtonLink, String secondSocialButtonIcon, String secondSocialButtonLink, String thirdSocialButtonIcon,String thirdSocialButtonLink, String fourthSocialButtonIcon, String fourthSocialButtonLink) {
        this.firstSocialButtonIcon = firstSocialButtonIcon;
        this.firstSocialButtonLink = firstSocialButtonLink;

        this.secondSocialButtonIcon = secondSocialButtonIcon;
        this.secondSocialButtonLink = secondSocialButtonLink;

        this.thirdSocialButtonIcon = thirdSocialButtonIcon;
        this.thirdSocialButtonLink = thirdSocialButtonLink;

        this.fourthSocialButtonIcon = fourthSocialButtonIcon;
        this.fourthSocialButtonLink = fourthSocialButtonLink;
    }

    public SocialButtonIcon() {
        // 기본 생성자
    }
}
