package com.moviehub.view.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moviehub.biz.movie.impl.MovieService;

@Controller
public class MovieController {
	@Autowired
	private MovieService movieService;
	
	@RequestMapping("/test.do")
	public String saveMovie() {
       movieService.saveMovie();
       return "index.jsp";
	}
	
	@RequestMapping(value="/index.do", method = RequestMethod.GET)
	public String getMovieList(Model boxofficeModel, Model netflixModel, Model watchaModel) {
		boxofficeModel.addAttribute("boxofficeList", movieService.getMovieList("boxoffice"));
		netflixModel.addAttribute("netflixList", movieService.getMovieList("netflix"));
		watchaModel.addAttribute("watchaList", movieService.getMovieList("watcha"));
		return "index.jsp";
	}
}
