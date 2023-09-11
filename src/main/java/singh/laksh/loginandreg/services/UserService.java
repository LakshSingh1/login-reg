package singh.laksh.loginandreg.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import singh.laksh.loginandreg.models.LoginUser;
import singh.laksh.loginandreg.models.User;
import singh.laksh.loginandreg.repositories.UserRepository;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    // TO-DO: Write register and login methods!
    public User register(User newUser, BindingResult result) {
        // TO-DO: Additional validations!

        Optional<User> user = userRepository.findByEmail(newUser.getEmail());

        if (!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }

        if (result.hasErrors()) {
            return null;
        }

        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        System.out.println(hashed);
        newUser.setPassword(hashed);

        return userRepository.save(newUser);

    }

    public User login(LoginUser newLoginObject, BindingResult result) {
        // TO-DO: Additional validations!
        Optional<User> user = userRepository.findByEmail(newLoginObject.getEmail());

        if (!user.isPresent()) {
            result.rejectValue("email", "loginEmail", "email not found");
        } else if (!BCrypt.checkpw(newLoginObject.getPassword(), user.get().getPassword
        ())) {
            result.rejectValue("password", "logpasswords", "invalid credentials");
        }

        if (result.hasErrors()) {
            return null;
        }
        return user.get();
    }

}
