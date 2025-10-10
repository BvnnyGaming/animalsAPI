package com.example.bunnyapi.Controller;

import com.example.bunnyapi.model.Bunny;
import com.example.bunnyapi.service.BunnyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/bunnies") // Base path for all endpoints
public class BunnyController {

    @Autowired
    private BunnyService service;

    // Get all bunnies
    @GetMapping
    public List<Bunny> getAllBunnies() {
        return service.getAllBunnies();
    }

    // Get bunny by ID
    @GetMapping("/{id}")
    public Bunny getBunnyById(@PathVariable Long id) {
        return service.getBunnyById(id);
    }

    // Add a new bunny
    @PostMapping
    public Bunny addBunny(@RequestBody Bunny bunny) {
        return service.addBunny(bunny);
    }

    // Update a bunny
    @PutMapping("/{id}")
    public Bunny updateBunny(@PathVariable Long id, @RequestBody Bunny bunny) {
        return service.updateBunny(id, bunny);
    }

    // Delete a bunny
    @DeleteMapping("/{id}")
    public void deleteBunny(@PathVariable Long id) {
        service.deleteBunny(id);
    }

    // Get bunnies by category (breed)
    @GetMapping("/category/{breed}")
    public List<Bunny> getBunniesByBreed(@PathVariable String breed) {
        return service.getBunniesByBreed(breed);
    }

    // Search bunnies by name substring
    @GetMapping("/search")
    public List<Bunny> searchBunniesByName(@RequestParam String name) {
        return service.searchBunniesByName(name);
    }
}
