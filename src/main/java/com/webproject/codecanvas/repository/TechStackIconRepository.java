package com.webproject.codecanvas.repository;

import com.webproject.codecanvas.entity.TechStackIcon;
import com.webproject.codecanvas.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TechStackIconRepository extends JpaRepository<TechStackIcon, Long> {
    Optional<TechStackIcon> findByUser(User user);
}