package fr.afpa.tp_java_spring_jwt2.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.afpa.tp_java_spring_jwt2.models.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
}