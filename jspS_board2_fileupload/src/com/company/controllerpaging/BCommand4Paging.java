package com.company.controllerpaging;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BCommand4Paging {
	void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
