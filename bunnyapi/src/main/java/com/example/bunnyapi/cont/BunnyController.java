package com.example.bunnyapi.cont;

import com.example.bunnyapi.model.Bunny;
import com.example.bunnyapi.service.BunnyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/bunnies")
public class BunnyController {

    @Autowired
    private BunnyService service;

    // Show all bunnies
    @GetMapping
    public String showAllBunnies(Model model) {
        List<Bunny> bunnies = service.getAllBunnies();
        model.addAttribute("bunnyList", bunnies);
        return "bunny-list";
    }

    // Show bunny details
    @GetMapping("/{id}")
    public String showBunnyDetails(@PathVariable Long id, Model model) {
        Bunny bunny = service.getBunnyById(id);
        model.addAttribute("bunny", bunny);
        return "bunny-details";
    }

    // Show create form
    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("bunny", new Bunny());
        return "bunny-create";
    }

    // Handle create submission
    @PostMapping("/new")
    public String createBunny(@ModelAttribute Bunny bunny,
                              @RequestParam("photo") MultipartFile file) {
        try {
            if (!file.isEmpty()) {
                String uploadDir = System.getProperty("user.dir") + "/uploads/";
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path filePath = Paths.get(uploadDir, fileName);
                Files.createDirectories(filePath.getParent());
                file.transferTo(filePath.toFile());
                bunny.setImagePath("/uploads/" + fileName);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        Bunny saved = service.addBunny(bunny);
        return "redirect:/bunnies/" + saved.getBunnyId();
    }

    // Show edit form
    @GetMapping("/edit/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Bunny bunny = service.getBunnyById(id);
        model.addAttribute("bunny", bunny);
        return "bunny-update"; // your FTL file for editing
    }

    // Handle update submission
    @PostMapping("/update")
    public String updateBunny(@ModelAttribute Bunny bunny,
                              @RequestParam("photo") MultipartFile photo) {
        try {
            if (!photo.isEmpty()) {
                String filename = System.currentTimeMillis() + "_" + photo.getOriginalFilename();
                Path filePath = Paths.get("uploads/" + filename);
                Files.createDirectories(filePath.getParent());
                Files.write(filePath, photo.getBytes());
                bunny.setImagePath("/uploads/" + filename);
            }

            service.updateBunny(bunny);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/bunnies";
    }

    // Delete bunny
    @GetMapping("/delete/{id}")
    public String deleteBunny(@PathVariable Long id) {
        service.deleteBunny(id);
        return "redirect:/bunnies";
    }

    // About page
    @GetMapping("/about")
    public String showAboutPage(Model model) {
        model.addAttribute("pageTitle", "About Bunny API");
        model.addAttribute("pageDescription", "Learn more about the Bunny API project.");
        return "bunny-about";
    }

    // Filter by breed
    @GetMapping("/category/{breed}")
    public String showByBreed(@PathVariable String breed, Model model) {
        model.addAttribute("bunnyList", service.getBunniesByBreed(breed));
        model.addAttribute("filter", "Breed: " + breed);
        return "bunny-list";
    }

    // Search by name
    @GetMapping("/search")
    public String searchByName(@RequestParam(name = "name", required = false) String name, Model model) {
        if (name == null || name.isEmpty()) {
            return "redirect:/bunnies";
        }
        model.addAttribute("bunnyList", service.searchBunniesByName(name));
        model.addAttribute("filter", "Search: " + name);
        return "bunny-list";
    }
}
