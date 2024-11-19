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

    @Column(name = "first_social_button_icon")
    private String firstSocialButtonIcon;

    @Column(name = "second_social_button_icon")
    private String secondSocialButtonIcon;

    @Column(name = "third_social_button_icon")
    private String thirdSocialButtonIcon;

    @Column(name = "fourth_social_button_icon")
    private String fourthSocialButtonIcon;

    @OneToOne
    @JoinColumn(name = "user_id")
    @ToString.Exclude // 순환 참조 방지
    @JsonBackReference
    private User user;

    // 생성자
    public SocialButtonIcon(String socialButtonIcon1, String socialButtonIcon2, String socialButtonIcon3, String socialButtonIcon4) {
        this.firstSocialButtonIcon = socialButtonIcon1;
        this.secondSocialButtonIcon = socialButtonIcon2;
        this.thirdSocialButtonIcon = socialButtonIcon3;
        this.fourthSocialButtonIcon = socialButtonIcon4;
    }

    public SocialButtonIcon() {
        // 기본 생성자
    }
}
