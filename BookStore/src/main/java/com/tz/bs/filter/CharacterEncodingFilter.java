package com.tz.bs.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
@WebFilter(filterName="CharacterEncodingFilter",urlPatterns="/*",
             initParams={@WebInitParam(name="encoding",value="utf-8")})
public class CharacterEncodingFilter implements Filter{
    private String config_encoding;
	@Override
	public void init(FilterConfig config) throws ServletException {
		config_encoding=config.getInitParameter("encoding");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 
		 request.setCharacterEncoding(config_encoding);
		 response.setContentType("text/html;charset="+config_encoding);
		 //����
		 chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		
	}
}
