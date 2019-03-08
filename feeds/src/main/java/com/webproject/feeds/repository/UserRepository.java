package com.webproject.feeds.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.webproject.feeds.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String username);
	User findByEmail(String email);
	User findById(long id);
	User findByConfirmationToken(String confirmationToken);

	@Modifying
	@Query("update User u set u.enabled = :enabled where u.email = :email")
	int updateUserSetStatusForName(@Param("enabled") boolean enabled, @Param("email") String email);

	@Modifying
	@Query("update User u set u.username = :username,u.firstname = :firstname,u.lastname = :lastname, u.phoneNumber = :phoneNumber, u.photo = :photo where u.email = :email")
	int updateUserInformation(@Param("username") String username,@Param("firstname") String firstname,@Param("lastname") String lastname,@Param("phoneNumber") String phoneNumber, @Param("email") String email,@Param("photo") byte[] photo);

}
