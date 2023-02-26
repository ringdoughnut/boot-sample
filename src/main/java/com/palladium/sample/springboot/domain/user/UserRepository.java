package com.palladium.sample.springboot.domain.user;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    // already registered?
    Optional<User> findByEmail(String email);
}
