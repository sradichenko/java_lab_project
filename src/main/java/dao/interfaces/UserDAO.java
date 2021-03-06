package dao.interfaces;

import pojo.User;

import java.util.List;
import java.util.Optional;

public interface UserDAO {
    void add(User user);
    Optional<User> get(long id);
    Optional<User> get(String email);
    void update(User user);
    void delete(User user);
    List<User> getAll();
}
