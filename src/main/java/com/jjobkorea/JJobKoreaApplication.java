package com.jjobkorea;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication

@EnableJpaRepositories(basePackages = "com.jjobkorea.repository")
@MapperScan(basePackages = "com.jjobkorea.mapper")
public class JJobKoreaApplication {

	public static void main(String[] args) {
		SpringApplication.run(JJobKoreaApplication.class, args);
	}

}
