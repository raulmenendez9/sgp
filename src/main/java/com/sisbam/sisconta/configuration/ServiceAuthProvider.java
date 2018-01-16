package com.sisbam.sisconta.configuration;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.sisbam.sisconta.dao.DaoImp;
import com.sisbam.sisconta.entity.administration.Usuario;

@Component
public class ServiceAuthProvider implements AuthenticationProvider {

	@Autowired
	private DaoImp manage_entity;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String username = authentication.getName();
		String password = authentication.getCredentials().toString();

		if (usuario(username, password) != null) {
	
				
			// use the credentials
			// and authenticate against the third-party system

			return new UsernamePasswordAuthenticationToken(username, password, new ArrayList<>());

		} else {
			return null;
		}
	}
 
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

	private Usuario usuario(String username, String password) {
		Usuario usuario = null;
		try {
			usuario = (Usuario) manage_entity.getByName("Usuario", "username", username);
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		if (usuario != null) {
			if(passwordEncoder.matches(password, usuario.getPassword())){
				return usuario;
			}
		}
		return null;
	}

}
