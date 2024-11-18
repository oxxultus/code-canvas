package com.webproject.codecanvas.repository;

import com.webproject.codecanvas.entity.Certificate;
import com.webproject.codecanvas.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CertificateRepository extends JpaRepository<Certificate, Long> {
    Optional<Certificate> findByUser(User user);
}