package com.webproject.codecanvas.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "portfolios")
@Data
public class Portfolio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column()
    private String portfolioImg1;

    @Column()
    private String portfolioImg2;

    @Column()
    private String portfolioImg3;

    @Column()
    private String portfolioImg4;

    @Column()
    private String portfolioImg5;

    @Column()
    private String portfolioImg6;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Portfolio(String portfolioImg1, String portfolioImg2, String portfolioImg3, String portfolioImg4, String portfolioImg5, String portfolioImg6) {
        this.portfolioImg1 = portfolioImg1;
        this.portfolioImg2 = portfolioImg2;
        this.portfolioImg3 = portfolioImg3;
        this.portfolioImg4 = portfolioImg4;
        this.portfolioImg5 = portfolioImg5;
        this.portfolioImg6 = portfolioImg6;
    }

    public Portfolio() {

    }
}