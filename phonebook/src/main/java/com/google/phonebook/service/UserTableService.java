package com.google.phonebook.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.google.phonebook.dao.PhoneBookDao;
import com.google.phonebook.dao.UserTableDao;
import com.google.phonebook.dto.PhoneBookDto;
import com.google.phonebook.dto.UserTableDto;

public class UserTableService {

	public int equalcheck(String userid, String userpassword) throws Exception {
		UserTableDao usertabledao = new UserTableDao();
		ArrayList<UserTableDto> usertable = usertabledao.isexistuserid();
		int check = 0;
		for (int i = 0; i < usertable.size(); i++) {
			if (userid.equals(usertable.get(i).getUserid())
					&& userpassword.equals(usertable.get(i).getUserpassword())) {
				check = 1;
				break;
			} else {
				check = 0;
			}
			
		}
		return check;

	}
}
