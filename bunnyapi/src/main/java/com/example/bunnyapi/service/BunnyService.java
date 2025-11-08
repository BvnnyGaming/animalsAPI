package com.example.bunnyapi.service;

import com.example.bunnyapi.model.Bunny;
import com.example.bunnyapi.repository.BunnyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BunnyService {

    @Autowired
    private BunnyRepository repository;

    public List<Bunny> getAllBunnies() {
        return repository.findAll();
    }

    public Bunny getBunnyById(Long id) {
        return repository.findById(id).orElse(null);
    }

    public Bunny addBunny(Bunny bunny) {
        return repository.save(bunny);
    }

    public void updateBunny(Bunny updatedBunny) {
        Bunny existingBunny = repository.findById(updatedBunny.getBunnyId()).orElseThrow(() -> new RuntimeException("Bunny not found"));
        existingBunny.setName(updatedBunny.getName());
        existingBunny.setBreed(updatedBunny.getBreed());
        existingBunny.setAge(updatedBunny.getAge());
        existingBunny.setDescription(updatedBunny.getDescription());
        if (updatedBunny.getImagePath() != null) {
            existingBunny.setImagePath(updatedBunny.getImagePath());
        }
        repository.save(existingBunny);
    }

    public void deleteBunny(Long id) {
        repository.deleteById(id);
    }

    public List<Bunny> getBunniesByBreed(String breed) {
        return repository.findByBreed(breed);
    }

    public List<Bunny> searchBunniesByName(String name) {
        return repository.findByNameContaining(name);
    }
}
