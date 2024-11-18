package com.webproject.codecanvas.repository;

import com.webproject.codecanvas.entity.SocialButtonIcon;
import com.webproject.codecanvas.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SocialButtonIconRepository extends JpaRepository<SocialButtonIcon, Long> {
    Optional<SocialButtonIcon> findByUser(User user);
}
