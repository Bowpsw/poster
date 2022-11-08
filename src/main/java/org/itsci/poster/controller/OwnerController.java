package org.itsci.poster.controller;

import org.itsci.poster.model.Owner;
import org.itsci.poster.model.Poster;
import org.itsci.poster.service.OwnerService;
import org.itsci.poster.service.PosterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/owner")
public class OwnerController {
    private String title = "เจ้าของรูปภาพ";

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }
    @Autowired
    private OwnerService ownerService;

    @Autowired
    private PosterService posterService;

    @GetMapping("/list")
    public String listPoster(Model model) {
        model.addAttribute("title", "รายการ" + title);
        model.addAttribute("owners", ownerService.getOwners());
        model.addAttribute("poster", posterService.getPosters());
        return "owner/list";
    }

    @GetMapping("/create")
    public String showFormForAdd(Model model) {
        model.addAttribute("title", "เพิ่ม" + title);
        model.addAttribute("owner", new Owner());
        return "owner/owner-form";
    }

    @RequestMapping(path="/save", method = RequestMethod.POST)
    public String saveOwner(@Valid @ModelAttribute("owner") Owner owner,
                              BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("title", "มีข้อผิดพลาดในการบันทึก" + title);
            return "owner/owner-form";
        } else {
            ownerService.saveOwner(owner);
            return "redirect:/owner/list";
        }
    }

    @GetMapping("/{id}/update")
    public String showFormForUpdate(@PathVariable ("id") int id, Model model) {
        Owner owner = ownerService.getOwner(Integer.valueOf(id));
        model.addAttribute("title", "แก้ไข" + title);
        model.addAttribute("owner", owner);
        return "owner/owner-form";

    }

    @GetMapping("/{id}/delete")
    public String deletePoster(@PathVariable("id") int id) {
        ownerService.deleteOwner(id);
        return "redirect:/owner/list";
    }

    @GetMapping("/{id}/view-posters")
    public String posterViewOwner(@PathVariable("id") int id, Model model) {
        Owner owner = ownerService.getOwner(id);
        model.addAttribute("title", title + " - รายการร้านค้า");
        model.addAttribute("owner", owner);
        return "owner/owner-view-posters";
    }

    @GetMapping("/{id}/poster/add")
    public String showPosterForAdd(@PathVariable("id") int id, Model model) {
        Owner owners = ownerService.getOwner(id);
        List<Poster> posters = posterService.getPosterDoesNotHaveOwner(id);
        model.addAttribute("title", "เพิ่มสินค้า");
        model.addAttribute("poster",posters);
        model.addAttribute("owner", owners);
        return "owner/poster-list";
    }

    @PostMapping("/{id}/poster/add")
    public String addPoster(@PathVariable("id") int ownerId, @RequestParam("poster") int posterId) {
        ownerService.addPosterToOwner(ownerId, posterId);
        return "redirect:/owner/" + ownerId + "/poster/add";
    }

    @GetMapping("/{id}/poster/{poster}/remove")
    public String ownerRemovePoster(@PathVariable("id") int ownerId, @PathVariable("poster") int posterId) {
        ownerService.removePosterFromOwner(ownerId, posterId);
        return "redirect:/owner/" + ownerId + "/view-posters";
    }
}
