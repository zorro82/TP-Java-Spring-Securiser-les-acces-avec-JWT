package fr.afpa.tp_java_spring_jwt2.repository;

import fr.afpa.tp_java_spring_jwt2.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
}