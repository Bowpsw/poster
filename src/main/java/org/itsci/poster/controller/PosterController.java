package org.itsci.poster.controller;

import org.itsci.poster.model.Poster;
import org.itsci.poster.model.Owner;
import org.itsci.poster.service.CategoryService;
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
@RequestMapping("/poster")
public class PosterController {
    private String title = "สินค้า";

    @Autowired
    private CategoryService categoryService;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @Autowired
    private PosterService posterService;
    @Autowired
    private OwnerService ownerService;

    @GetMapping("/list")
    public String listPoster(Model model) {
        model.addAttribute("title", "รายการ" + title);
        model.addAttribute("posters", posterService.getPosters());
        return "poster/list";
    }

    @GetMapping("/create")
    public String showFormForAdd(Model model) {
        model.addAttribute("title", "เพิ่ม" + title);
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("poster", new Poster());
        return "poster/poster-form";
    }

    @RequestMapping(path = "/save", method = RequestMethod.POST)
    public String savePoster(@Valid @ModelAttribute("poster") Poster poster,
                              BindingResult bindingResult,
                              Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("title", "มีข้อผิดพลาดในการบนัทึก" + title);
            model.addAttribute("categories", categoryService.getCategories());
            return "poster/poster-form";
        } else {
            Poster dbPoster = posterService.getPoster(poster.getId());
            if (dbPoster != null) {
                posterService.updatePoster(dbPoster, poster);
            } else {
                posterService.savePoster(poster);
            }
            return "redirect:/poster/list";
        }
    }

    @GetMapping("/{id}/update")
    public String showFormForUpdate(@PathVariable("id") int id, Model model) {
        Poster poster = posterService.getPoster(Integer.valueOf(id));
        model.addAttribute("title", "แก้ไข" + title);
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("poster", poster);
        return "poster/poster-form";
    }

    @GetMapping("/{id}/delete")
    public String deletePoster(@PathVariable("id") int id) {
        posterService.deletePoster(id);
        return "redirect:/poster/list";
    }

    @GetMapping("/{id}/view-owners")
    public String posterViewOwner(@PathVariable("id") int id, Model model) {
        Poster poster = posterService.getPoster(id);
        model.addAttribute("title", title + " - รายการร้านค้า");
        model.addAttribute("poster", poster);
        model.addAttribute("owners", poster.getOwners());
        return "poster/poster-view-owners";
    }

    @GetMapping("/{id}/owner/add")
    public String showOwnerForAdd(@PathVariable("id") int id, Model model) {
        Poster poster = posterService.getPoster(id);
        List<Owner> owners = ownerService.getOwnerDoesNotHavePoster(id);
        model.addAttribute("title", "เพิ่มร้านค้า");
        model.addAttribute("poster", poster);
        model.addAttribute("owners", owners);
        return "poster/poster-list";
    }

    @PostMapping("/{id}/owner/add")
    public String addOwner(@PathVariable("id") int posterId,
                          @RequestParam("owner") int ownerId) {
        posterService.addOwnerToPoster(posterId, ownerId);
        return "redirect:/poster/" + posterId + "/owner/add";
    }

    @GetMapping("/{id}/owner/{owner}/remove")
    public String posterRemoveOwner(@PathVariable("id") int posterId,
                                    @PathVariable("owner") int ownerId) {
        posterService.removeOwnerFromPoster(posterId, ownerId);
        return "redirect:/poster/" + posterId + "/view-owners";
    }
}