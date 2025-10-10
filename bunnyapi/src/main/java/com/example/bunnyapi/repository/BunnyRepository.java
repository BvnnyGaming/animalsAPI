package com.example.bunnyapi.repository;

import com.example.bunnyapi.model.Bunny;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface BunnyRepository extends JpaRepository<Bunny, Long> {

    List<Bunny> findByBreed(String breed);

    List<Bunny> findByNameContaining(String substring);
}
