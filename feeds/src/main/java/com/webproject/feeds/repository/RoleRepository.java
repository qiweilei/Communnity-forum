package com.webproject.feeds.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.webproject.feeds.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
	Role findByName(String name);
}
