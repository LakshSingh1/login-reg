package singh.laksh.loginandreg.repositories;


import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import singh.laksh.loginandreg.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
    Optional<User> findByEmail(String email);
    
}
