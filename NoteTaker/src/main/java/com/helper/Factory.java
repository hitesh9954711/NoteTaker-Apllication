package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Factory {

	private static SessionFactory sessionFactory=null;

	public static SessionFactory getSessionFactory() {

		if (sessionFactory == null) {
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			sessionFactory = cfg.buildSessionFactory();
			return sessionFactory;
		}
		else {
		return sessionFactory;
		}
	}

	public static void factoryClose() {
		if (sessionFactory.isOpen()) {
			sessionFactory.close();
		}
	}

}
