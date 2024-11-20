package com.webproject.codecanvas.repository;

import com.webproject.codecanvas.entity.Portfolio;
import com.webproject.codecanvas.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PortfolioRepository extends JpaRepository<Portfolio, Long> {
    // User 객체를 통해 검색 (기존 방식)
    Optional<Portfolio> findByUser(User user);

    // User ID를 통해 검색 (효율적인 방식)
    Optional<Portfolio> findByUserId(Long userId);
}
