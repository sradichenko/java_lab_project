package db.dao.daoimpl;

import db.dao.DataSource;
import db.dao.interfaces.AirportDAO;
import lombok.SneakyThrows;
import pojo.Airport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class AirportDAOImpl implements AirportDAO {
    private static final String SELECT_ALL = "SELECT id, code, city, airport_name, latitude, longitude FROM Airport ";

    @Override
    @SneakyThrows
    public void add(Airport airport) {
        String sql = "INSERT INTO Airport (code, city, airport_name, latitude, longitude) VALUES (?, ?, ?, ?, ?)";

        try(Connection connection = DataSource.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, airport.getCode());
            ps.setString(2, airport.getCity());
            ps.setString(3, airport.getAirportName());
            ps.setDouble(4, airport.getLatitude());
            ps.setDouble(5, airport.getLongitude());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    @SneakyThrows
    public Optional<Airport> get(long id) {
        String sql = SELECT_ALL + "WHERE id = ?";

        try(Connection connection = DataSource.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setLong(1, id);

            ResultSet rs = ps.executeQuery();

            Airport airport = null;
            while (rs.next()) {
                airport = createNewAirport(rs);
            }

            return Optional.ofNullable(airport);
        }
    }

    @Override
    @SneakyThrows
    public void update(Airport airport) {
        String sql = "UPDATE Airport SET code = ?, city = ?, airport_name = ?, latitude = ?, longitude = ? WHERE id = ?";

        try(Connection connection = DataSource.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, airport.getCode());
            ps.setString(2, airport.getCity());
            ps.setString(3, airport.getAirportName());
            ps.setDouble(4, airport.getLatitude());
            ps.setDouble(5, airport.getLongitude());
            ps.setLong  (6, airport.getAirportId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    @SneakyThrows
    public void delete(Airport airport) {
        String sql = "DELETE FROM Airport WHERE id = ?";

        try(Connection connection = DataSource.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setLong(1, airport.getAirportId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    @SneakyThrows
    public List<Airport> getAll() {
        List<Airport> airports = new ArrayList<>();
        try (Connection connection = DataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
             ResultSet result = statement.executeQuery()) {
            while (result.next()) {
                airports.add(createNewAirport(result));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return airports;
    }

    private Airport createNewAirport(ResultSet result) throws SQLException {
        return new Airport(
                result.getLong  ("id"),
                result.getString("code"),
                result.getString("city"),
                result.getString("airport_name"),
                result.getDouble("latitude"),
                result.getDouble("longitude"));
    }
}