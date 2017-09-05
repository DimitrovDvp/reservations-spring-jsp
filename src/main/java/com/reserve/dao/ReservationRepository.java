package com.reserve.dao;

import org.springframework.data.repository.CrudRepository;

import com.reserve.model.Reservation;

public interface ReservationRepository extends CrudRepository<Reservation, Integer> {

}
