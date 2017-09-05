package com.reserve.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reserve.model.Reservation;
import com.reserve.service.ReservationService;


@Controller
public class HomeController {
	@Autowired
	private ReservationService reservationService;

	@GetMapping("/")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "index";
	}
	
	@GetMapping("/all-reservations")
	public String allReservations(HttpServletRequest request){
		request.setAttribute("reservations", reservationService.findAll());
		request.setAttribute("mode", "MODE_RESERVATIONS");
		return "index";
	}
	
	@GetMapping("/new-reservation")
	public String newTask(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "index";
	}
	
	@PostMapping("/save-reservation")
	public String saveTask(@ModelAttribute Reservation reservation, BindingResult bindingResult, HttpServletRequest request){
		reservation.setReservationDate(new Date());
		reservationService.save(reservation);
		request.setAttribute("reservations", reservationService.findAll());
		request.setAttribute("mode", "MODE_RESERVATIONS");
		return "index";
	}
	
	@GetMapping("/update-reservation")
	public String updateTask(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("reservation", reservationService.findTask(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
	}
	
	@GetMapping("/delete-reservation")
	public String deleteTask(@RequestParam int id, HttpServletRequest request){
		reservationService.delete(id);
		request.setAttribute("reservations", reservationService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
}
