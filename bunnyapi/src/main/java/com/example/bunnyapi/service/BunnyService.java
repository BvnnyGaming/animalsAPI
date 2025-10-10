package com.example.bunnyapi.service;

import com.example.bunnyapi.model.Bunny;
import com.example.bunnyapi.repository.BunnyRepository;
import org.springframework.beans.factory.annotation.Autowired;
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

    public Bunny updateBunny(Long id, Bunny bunny) {
        bunny.setBunnyId(id);
        return repository.save(bunny);
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
