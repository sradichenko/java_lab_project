package db.service;

import db.DataSource;
import db.dao.FlightDAO;
import lombok.SneakyThrows;
import pojo.Airplane;
import pojo.Airport;
import pojo.Flight;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class FlightService implements FlightDAO {
    private static final String SELECT_ALL = "SELECT airplaneId, name, capacity_econom, capacity_business FROM Airplane";   //TODO needs to be changed later

    @Override
    public long create(Flight flight) {
        return 0;
    }

    @Override
    @SneakyThrows
    public Optional<Flight> get(int id) {
        //String query = "SELECT id, aplane.name, aplane.capacity_econom, aplane.capacity_business, flight_number, aport1.airport_id, aport1.name, aport1.city, aport2.airport_id, aport2.name, aport2.city, base_cost, available_places_econom, available_places_business, date FROM Flight, Airplane aplane, Airport aport1, Airport aport2 WHERE id = ?";
        String query = "SELECT * FROM Flight WHERE id = ?";

        try (Connection conn = DataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            Flight flight = null;
            if (rs != null) {
                flight = new Flight(
                        rs.getLong("id"),
                        new Airplane(
                                rs.getLong("airplane_id"),
                                rs.getString("name"),
                                rs.getInt("capacity_econom"),
                                rs.getInt("capacity_business")
                        ),
                        rs.getString("flight_nunmber"),
                        new Airport(
                                rs.getLong("airport_id"),
                                rs.getString("name"),
                                rs.getString("city")
                        ),
                        new Airport(
                                rs.getLong("airport_id"),
                                rs.getString("name"),
                                rs.getString("city")
                        ),
                        rs.getDouble("base_cost"),
                        rs.getInt("available_places_econom"),
                        rs.getInt(" available_places_business"),
                        LocalDateTime.of(
                                rs.getDate("date").toLocalDate(), rs.getTime("date").toLocalTime()
                        )
                );
            }

            return Optional.ofNullable(flight);
        }
    }

    @Override
    public void update(Flight flight) {

    }

    @Override
    public void remove(Flight flight) {

    }

    @Override
    @SneakyThrows
    public List<Flight> getAll() {
        List<Flight> flights = new ArrayList<>();

        /*try (Connection conn = DataSource.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(SELECT_ALL)) {
            while (rs.next()) {
                flights.add(new Flight(
                        rs.getLong("id"),
                        new Airplane(
                            rs.getLong("id"),
                            rs.getString("name"),
                            rs.getInt("capacity_econom"),
                            rs.getInt("capacity_business")
                        ),
                        rs.getString("flight_number"),
                        new Airport(
                            rs.getLong("id"),
                            rs.getString("name"),
                            rs.getString("city")
                        ),
                        new Airport(
                            rs.getLong("id"),
                            rs.getString("name"),
                            rs.getString("city")
                        ),
                        rs.getDouble("baseCost"),
                        rs.getInt("availablePlacesEconom"),
                        rs.getInt("availablePlacesBusiness"),
                        rs.getDate("dateTime").toLocalDate()    //TODO convert to LocalDateTime
                ));
            }
        }*/

        return flights;
    }
}