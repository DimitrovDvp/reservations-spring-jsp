package com.reserve.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.reserve.dao.ReservationRepository;
import com.reserve.model.Reservation;

@Service
@Transactional
public class ReservationService {
	private final ReservationRepository reservationRepository;

	public ReservationService(ReservationRepository taskRepository) {
		this.reservationRepository = taskRepository;
	}
	
	public List<Reservation> findAll(){
		List<Reservation> tasks = new ArrayList<>();
		for(Reservation task : reservationRepository.findAll()){
			tasks.add(task);
		}
		return tasks;
	}
	
	public Reservation findTask(int id){
		return reservationRepository.findOne(id);
	}
	
	public void save(Reservation reservation){
		reservationRepository.save(reservation);
	}
	
	public void delete(int id){
		reservationRepository.delete(id);
	}
}
