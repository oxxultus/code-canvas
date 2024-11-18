package com.webproject.codecanvas.repository;

import com.webproject.codecanvas.entity.Project;
import com.webproject.codecanvas.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {
    Optional<Project> findByUser(User user);
}