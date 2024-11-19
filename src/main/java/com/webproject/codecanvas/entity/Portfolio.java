package com.webproject.codecanvas.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "portfolios")
@Getter
@Setter
@ToString
public class Portfolio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "portfolio_img_1")
    private String portfolioImg1;

    @Column(name = "portfolio_img_2")
    private String portfolioImg2;

    @Column(name = "portfolio_img_3")
    private String portfolioImg3;

    @Column(name = "portfolio_img_4")
    private String portfolioImg4;

    @Column(name = "portfolio_img_5")
    private String portfolioImg5;

    @Column(name = "portfolio_img_6")
    private String portfolioImg6;

    @OneToOne
    @JoinColumn(name = "user_id")
    @ToString.Exclude
    @JsonBackReference
    private User user;

    // 생성자
    public Portfolio(String portfolioImg1, String portfolioImg2, String portfolioImg3, String portfolioImg4, String portfolioImg5, String portfolioImg6) {
        this.portfolioImg1 = portfolioImg1;
        this.portfolioImg2 = portfolioImg2;
        this.portfolioImg3 = portfolioImg3;
        this.portfolioImg4 = portfolioImg4;
        this.portfolioImg5 = portfolioImg5;
        this.portfolioImg6 = portfolioImg6;
    }

    // 기본 생성자
    public Portfolio() {

    }
}
