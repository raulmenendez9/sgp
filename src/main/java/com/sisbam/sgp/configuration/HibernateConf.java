package com.sisbam.sgp.configuration;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
//@ImportResource({ "classpath:hibernate.cfg.xml" })

@Configuration
@EnableTransactionManagement
public class HibernateConf {
	@Bean
	public DataSource restDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("org.postgresql.Driver");
		dataSource.setUrl("jdbc:postgresql://localhost:5432/d9g01ahadabair");
		dataSource.setUsername("onvyfzfzktljub");
		dataSource.setPassword("e4061346fb8bdca4a4e71ad26d56cce0283e90e1a3e610b43828e0e5cf7b1dce");


		return dataSource;
	} 

	@Bean(name = "sessionFactory")
	public LocalSessionFactoryBean sessionFactory() {
		Properties prop = new Properties(); 
		prop.setProperty("hibernate.hbm2ddl.auto", "update");
		prop.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
		prop.setProperty("hibernate.current_session_context_class", "thread");
		prop.setProperty("hibernate.show_sql", "true");
		
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(restDataSource());
		sessionFactory.setPackagesToScan("com.sisbam.sgp.entity");
		sessionFactory.setHibernateProperties(prop);

		return sessionFactory;
	}
	
	
	
	@Bean
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);
		return txManager;
	}
	/*
	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}
	*/

}
