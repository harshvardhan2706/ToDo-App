package com.example.ToDo.App.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ToDo.App.model.ToDo;
import com.example.ToDo.App.service.ToDoService;



@Controller
public class ToDoController {
	
	@Autowired
	private ToDoService service;
	
	@GetMapping({"/","viewToDoList"})
	public String viewAllToDoItems(Model model, @ModelAttribute("message") String message) {
		model.addAttribute("list", service.getAllToDoItems());
		
		model.addAttribute("msg",message);
		
		return "ViewToDoList";
	}
	
	@PostMapping("/updateToDoList/{id}")
	public String updateToDoStatus(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		if(service.updatetoStatus(id)) {
			redirectAttributes.addFlashAttribute("message","Update Success");
			return "redirect:/viewToDoList";
		}
		redirectAttributes.addFlashAttribute("message","Update Failure");
		return "redirect:/viewToDoList";
	}
	
	@GetMapping("/addToDoItem")
	public String addToDoItem(Model model) {
		model.addAttribute("todo", new ToDo());
		return "AddToDoItem";
	}
	
	@PostMapping("/saveToDoItem")
	public String saveToDoItem(ToDo todo,RedirectAttributes redirectAttributes) {
		if(service.saveOrUpdateToDoItem(todo)) {
			redirectAttributes.addFlashAttribute("message","Save Success");
			return "redirect:/viewToDoList";
		}
		redirectAttributes.addFlashAttribute("message","Save Failure");
		return "redirect:/AddToDoItem";
	}
	
	
	@GetMapping("/editToDoItem/{id}")
	public String editToDoItem(@PathVariable Long id, Model model) {
		model.addAttribute("todo",service.getToDoItemById(id));
	
		return "EditToDoItem";
	}
	
	@PostMapping("/editSaveToDoItem")
	public String editSaveToDoItem(ToDo todo, RedirectAttributes redirectAttributes) {
		if(service.saveOrUpdateToDoItem(todo)) {
			redirectAttributes.addFlashAttribute("message","Edit Success");
			return "redirect:/viewToDoList";
		}
		redirectAttributes.addFlashAttribute("message","Edit Failure");
		return "redirect:/editToDoItem" + todo.getId();
	}
	
	@PostMapping("/deleteToDoItem/{id}")
	public String deleteToDoItem(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		if(service.deleteTeDoitem(id)) {
			redirectAttributes.addFlashAttribute("message","Delete Success");
			return "redirect:/viewToDoList";
		}
		
		redirectAttributes.addFlashAttribute("message","Delete Failure");
		return "redirect:/viewToDoList";
	}
}
