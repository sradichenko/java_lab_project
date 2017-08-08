package db.dao.daoimpl;

import db.dao.DataSource;
import db.dao.interfaces.FlightPlaceDAO;
import lombok.SneakyThrows;
import pojo.Airplane;
import pojo.Airport;
import pojo.Flight;
import pojo.FlightPlace;
import utils.ServletUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class FlightPlaceDAOImpl implements FlightPlaceDAO {
    private static final String SELECT_ALL =
            "SELECT\n" +
            "  fp.id, fp.flight_id, f.airplane_id, p.name, p.capacity_econom, p.capacity_business, f.flight_number,\n" +
            "  f.departure_airport_id, d.code, d.city, d.airport_name,d.latitude,d.longitude, " +
            "  f.arrival_airport_id, a.code, a.city, a.airport_name, a.latitude, a.longitude, \n" +
            "  f.base_cost, f.available_places_econom, f.available_places_business, f.flight_datetime,\n" +
            "  places_econom, places_business\n " +
            " FROM FlightPlace fp\n" +
            "  JOIN Flight   f ON f.id = fp.flight_id\n" +
            "  JOIN Airplane p ON p.id = f.airplane_id\n" +
            "  JOIN Airport  d ON d.id = f.departure_airport_id\n" +
            "  JOIN Airport  a ON a.id = f.arrival_airport_id\n";
    private static final String ORDER_BY_DATETIME = " ORDER BY f.flight_datetime ";

    @Override
    @SneakyThrows
    public void add(FlightPlace flightPlaces) {
        String sql = "INSERT INTO FlightPlace (flight_id, places_econom, places_business) " +
                "VALUES (?, ?, ?)";

        try(Connection connection = DataSource.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setLong  (1, flightPlaces.getFlight().getFlightId());
            ps.setString(2, String.valueOf(flightPlaces.getBitPlacesEconom()));
            ps.setString(3, String.valueOf(flightPlaces.getBitPlacesBusiness()));

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    @SneakyThrows
    public Optional<FlightPlace> get(long id) {
        String sql = SELECT_ALL + "WHERE fp.id = ?\n" + ORDER_BY_DATETIME;

        try(Connection connection = DataSource.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setLong(1, id);

            ResultSet rs = ps.executeQuery();

            FlightPlace flightPlaces = null;
            while (rs.next()) {
                flightPlaces = createNewFlightPlace(rs);
            }

            return Optional.ofNullable(flightPlaces);
        }
    }

    @Override
    @SneakyThrows
    public Optional<FlightPlace> getByFlightId(long flightId) {
        String sql = SELECT_ALL + " WHERE fp.flight_id = ? " + ORDER_BY_DATETIME;

        try(Connection connection = DataSource.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setLong(1, flightId);
            ResultSet rs = ps.executeQuery();

            FlightPlace flightPlaces = null;
            while (rs.next()) {
                flightPlaces = createNewFlightPlace(rs);
            }

            return Optional.ofNullable(flightPlaces);
        }
    }

    @Override
    @SneakyThrows
    public void update(FlightPlace flightPlaces) {
        String sql = "UPDATE FlightPlace SET flight_id = ?, places_econom = ?, places_business = ? WHERE id = ?";

        try(Connection connection = DataSource.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setLong(1, flightPlaces.getFlight().getFlightId());
            ps.setString(2, ServletUtils.stringConversionFromBitSet(flightPlaces.getBitPlacesEconom()));
            ps.setString(3, ServletUtils.stringConversionFromBitSet(flightPlaces.getBitPlacesBusiness()));
            ps.setLong(4, flightPlaces.getFlightPlacesId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    @SneakyThrows
    public void delete(FlightPlace flightPlaces) {
        String sql = "DELETE FROM FlightPlace WHERE id = ?";

        try(Connection connection = DataSource.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setLong(1, flightPlaces.getFlightPlacesId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    @SneakyThrows
    public List<FlightPlace> getAll() {
        List<FlightPlace> flights = new ArrayList<>();
        try(Connection connection = DataSource.getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL + ORDER_BY_DATETIME)) {
            while (rs.next()) {
                flights.add(createNewFlightPlace(rs));
            }

            return flights;
        }
    }

    @SneakyThrows
    private FlightPlace createNewFlightPlace(ResultSet rs) {
        return new FlightPlace(
                rs.getLong("id"),
                new Flight(
                        rs.getLong("flight_id"),
                        new Airplane(
                                rs.getLong  ("airplane_id"),
                                rs.getString("p.name"),
                                rs.getInt   ("p.capacity_econom"),
                                rs.getInt   ("p.capacity_business")
                        ),
                        rs.getString("flight_number"),
                        new Airport(
                                rs.getLong  ("departure_airport_id"),
                                rs.getString("d.code"),
                                rs.getString("d.city"),
                                rs.getString("d.airport_name"),
                                rs.getDouble("d.latitude"),
                                rs.getDouble("d.longitude")
                        ),
                        new Airport(
                                rs.getLong  ("arrival_airport_id"),
                                rs.getString("a.code"),
                                rs.getString("a.city"),
                                rs.getString("a.airport_name"),
                                rs.getDouble("a.latitude"),
                                rs.getDouble("a.longitude")
                        ),
                        rs.getDouble   ("base_cost"),
                        rs.getInt      ("available_places_econom"),
                        rs.getInt      ("available_places_business"),
                        rs.getTimestamp("flight_datetime").toLocalDateTime()
                ),
                ServletUtils.bitSetConversionFromString(rs.getString("places_econom")),
                ServletUtils.bitSetConversionFromString(rs.getString("places_business"))
        );
    }
}