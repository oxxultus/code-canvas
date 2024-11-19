package com.webproject.codecanvas.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "certificates")
@Getter
@Setter
@ToString
public class Certificate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_certificate_button_icon", nullable = false)
    private String firstCertificateButtonIcon = "";

    @Column(name = "second_certificate_button_icon", nullable = false)
    private String secondCertificateButtonIcon = "";

    @Column(name = "third_certificate_button_icon", nullable = false)
    private String thirdCertificateButtonIcon = "";

    @Column(name = "fourth_certificate_button_icon", nullable = false)
    private String fourthCertificateButtonIcon = "";

    @Column(name = "first_certificate_title", nullable = false)
    private String firstCertificateTitle = "";

    @Column(name = "second_certificate_title", nullable = false)
    private String secondCertificateTitle = "";

    @Column(name = "third_certificate_title", nullable = false)
    private String thirdCertificateTitle = "";

    @Column(name = "fourth_certificate_title", nullable = false)
    private String fourthCertificateTitle = "";

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    @ToString.Exclude
    @JsonBackReference
    private User user;

    // 기본 생성자
    public Certificate() {
    }

    // 모든 필드를 초기화하는 생성자
    public Certificate(String firstCertificateTitle, String firstCertificateButtonIcon,
                       String secondCertificateTitle, String secondCertificateButtonIcon,
                       String thirdCertificateTitle, String thirdCertificateButtonIcon,
                       String fourthCertificateTitle, String fourthCertificateButtonIcon) {
        this.firstCertificateTitle = firstCertificateTitle;
        this.firstCertificateButtonIcon = firstCertificateButtonIcon;
        this.secondCertificateTitle = secondCertificateTitle;
        this.secondCertificateButtonIcon = secondCertificateButtonIcon;
        this.thirdCertificateTitle = thirdCertificateTitle;
        this.thirdCertificateButtonIcon = thirdCertificateButtonIcon;
        this.fourthCertificateTitle = fourthCertificateTitle;
        this.fourthCertificateButtonIcon = fourthCertificateButtonIcon;
    }
}
