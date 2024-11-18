package com.webproject.codecanvas.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "social_button_icons")
@Data
public class SocialButtonIcon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column()
    private String firstSocialButtonIcon;

    @Column()
    private String secondSocialButtonIcon;

    @Column()
    private String thirdSocialButtonIcon;

    @Column()
    private String fourthSocialButtonIcon;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    public SocialButtonIcon(String socialButtonIcon1, String socialButtonIcon2, String socialButtonIcon3, String socialButtonIcon4) {
        this.firstSocialButtonIcon = socialButtonIcon1;
        this.secondSocialButtonIcon = socialButtonIcon2;
        this.thirdSocialButtonIcon = socialButtonIcon3;
        this.fourthSocialButtonIcon = socialButtonIcon4;
    }

    public SocialButtonIcon() {

    }
}
