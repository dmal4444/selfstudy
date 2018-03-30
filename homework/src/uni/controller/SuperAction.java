package uni.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class SuperAction {

    public abstract String action(HttpServletRequest req, HttpServletResponse resp);
}