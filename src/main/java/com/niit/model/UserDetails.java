package com.niit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


import org.springframework.stereotype.Component;
@Entity
@Table(name="register",uniqueConstraints={
		@UniqueConstraint(columnNames="Name")})

@Component
public class UserDetails {
	
			 @Id
			 @GeneratedValue(strategy=GenerationType.AUTO)
			 @Column(name="id")
		     private int id;
			
			 @NotNull
			 @Size(min=6,max=15,message="Username must be between 6 to 15 characters")
			 @Column(name="Name", unique=true)
		     private String username;
			 
			 
			 @NotNull
			 @Size(min=11,max=35)
			 @Column(name="email")
		     private String email;
			 
			 
					 
			 @NotNull
			 @Size(min=6,max=15,message="state must be between 6 to 15 characters")
			 @Column(name="state")
		     private String state; 
			 
			 
			 @NotNull
			 @Column(name="city")
		     private String city;
			 
			 
			 
			 @NotNull
			 @Column(name="address")
			 private String address;	
			 
			 
			 @NotNull
			 @Column(name="phone")
		     private String phone;
			 
			 
			 @NotNull
			 @Size(min=6,max=15,message="password must be between 6 to 15 characters")
			 @Column(name="password")
		     private String password;
			  
			  
			 @NotNull
			 @Column(name="confirmpassword")
		     private String confirmpassword;

			private boolean status=true;

			public int getId() {
				return id;
			}

			public void setId(int id) {
				this.id = id;
			}

			public String getUsername() {
				return username;
			}

			public void setUsername(String username) {
				this.username = username;
			}

			public String getEmail() {
				return email;
			}

			public void setEmail(String email) {
				this.email = email;
			}

			public String getState() {
				return state;
			}

			public void setState(String state) {
				this.state = state;
			}

			public String getCity() {
				return city;
			}

			public void setCity(String city) {
				this.city = city;
			}

			public String getAddress() {
				return address;
			}

			public void setAddress(String address) {
				this.address = address;
			}

			public String getPhone() {
				return phone;
			}

			public void setPhone(String phone) {
				this.phone = phone;
			}

			public String getPassword() {
				return password;
			}

			public void setPassword(String password) {
				this.password = password;
			}

			public String getConfirmpassword() {
				return confirmpassword;
			}

			public void setConfirmpassword(String confirmpassword) {
				this.confirmpassword = confirmpassword;
			}

			public boolean isStatus() {
				return status;
			}

			public void setStatus(boolean status) {
				this.status = status;
			}
			
			
}
               


			