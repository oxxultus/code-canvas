package com.webproject.codecanvas.repository;

import com.webproject.codecanvas.entity.Certificate;
import com.webproject.codecanvas.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CertificateRepository extends JpaRepository<Certificate, Long> {
    // User 객체를 통해 검색 (기존 방식)
    Optional<Certificate> findByUser(User user);

    // User ID를 통해 검색 (효율적인 방식)
    Optional<Certificate> findByUserId(Long userId);
}