package com.demo.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MultipleStatementsOnConnectionEx {
public static void main(String[] args) {
	displayAll();
}
private static void displayAll() {
	try {
		// load the driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		// establish connection with db url
		// <protocol>:<sub-protocol>://<server>:<port>/DBNAME
		Connection mySQLConnection =  DriverManager.getConnection("jdbc:mysql://localhost:3306/SAKILA","root","mysql");
		// create statement
		String selectQueryString = "SELECT ACTOR_ID, FIRST_NAME, LAST_NAME FROM ACTOR";
		Statement selectStatement = mySQLConnection.createStatement();
		// execute query + get results
		ResultSet actorResultset = selectStatement.executeQuery(selectQueryString);
//		iterate and display result
		while(actorResultset.next()) {
			int actorId = actorResultset.getInt("ACTOR_ID");
			String firstNameString = actorResultset.getString("FIRST_NAME");
			String lastNameString = actorResultset.getString("LAST_NAME");
			System.err.println(actorId + "\t" + firstNameString + "\t" + lastNameString);
		}
		try {
			if (mySQLConnection != null) {
				mySQLConnection.close();
			}
		} catch (SQLException sqlException) {
			System.err.println("Error closing connection : " + sqlException);
		}
		selectQueryString = "select title from film";
//		Error establishing connection : java.sql.SQLException: No operations allowed after statement closed.
		ResultSet filmResultSet = selectStatement.executeQuery(selectQueryString);
//		iterate and display result
		while(filmResultSet.next()) {
			System.err.println(filmResultSet.getString("title"));
		}
	} catch (ClassNotFoundException classNotFoundException) {
		System.err.println("Driver could not be loaded. Pls check the jdbc library configuration");
	} catch (SQLException sqlException) {
		System.err.println("Error establishing connection : " + sqlException);
	}
}
}
