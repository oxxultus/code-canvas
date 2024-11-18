package com.webproject.codecanvas.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "certificates")
@Data
public class Certificate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column()
    private String firstCertificateButtonIcon;

    @Column()
    private String secondCertificateButtonIcon;

    @Column()
    private String thirdCertificateButtonIcon;

    @Column()
    private String fourthCertificateButtonIcon;

    @Column()
    private String firstCertificateTitle;

    @Column()
    private String secondCertificateTitle;

    @Column()
    private String thirdCertificateTitle;

    @Column()
    private String fourthCertificateTitle;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Certificate(String firstCertificateTitle, String firstCertificateButtonIcon, String secondCertificateTitle, String secondCertificateButtonIcon, String thirdCertificateTitle, String thirdCertificateButtonIcon, String fourthCertificateTitle, String fourthCertificateButtonIcon) {
        this.firstCertificateTitle = firstCertificateTitle;
        this.firstCertificateButtonIcon = firstCertificateButtonIcon;
        this.secondCertificateTitle = secondCertificateTitle;
        this.secondCertificateButtonIcon = secondCertificateButtonIcon;
        this.thirdCertificateTitle = thirdCertificateTitle;
        this.thirdCertificateButtonIcon = thirdCertificateButtonIcon;
        this.fourthCertificateTitle = fourthCertificateTitle;
        this.fourthCertificateButtonIcon = fourthCertificateButtonIcon;
    }

    public Certificate() {

    }
}