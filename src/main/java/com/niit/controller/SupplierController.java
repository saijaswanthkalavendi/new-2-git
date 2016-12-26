package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.dao.SupplierDao;
import com.niit.model.Supplier;

@Controller
public class SupplierController {
	@Autowired
	SupplierDao supplierDao;

	@ModelAttribute("Supplier")
	public Supplier createSupplier() {
		return new Supplier();
	}

	@RequestMapping("/managesuppliers")
	public ModelAndView display6() {
		ModelAndView m4 = new ModelAndView("managesuppliers");
		return m4;
	}
	
	@RequestMapping("addsupplier")
	public ModelAndView display3() {

		ModelAndView mv3 = new ModelAndView("addsupplier");
		return mv3;
	}
	@RequestMapping("/viewsupplier")
	public ModelAndView display8() {
		ModelAndView m4 = new ModelAndView("viewsupplier");
		return m4;
	}

	@RequestMapping("storesupplier")
	public String addBook(HttpServletRequest request, @Valid @ModelAttribute("Supplier") Supplier supplier,
			BindingResult result) {
		if (result.hasErrors()) {
			return "addsupplier";
		}
		System.out.println("sai jaswanth @@@@@@@@@@@@@@@@@@@@@###################$$$$$$$$$$$$$$$$$$$$");
		supplierDao.saveOrUpdate(supplier);
		return "managesuppliers";

	}
	
	@RequestMapping(value = "listsup", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String showList()
	{
		List list = supplierDao.getAllSuppliers();
		System.out.println("hello @@@@@@@@@@@@@@@@@@@@@###################$$$$$$$$$$$$$$$$$$$$");
		System.out.println(list);
		Gson x = new Gson();
		String json = x.toJson(list);
		return json;
	}

	
	

	@RequestMapping(value = "viewsupplier", method = RequestMethod.GET)
	public ModelAndView viewSup(@RequestParam int id, @ModelAttribute Supplier suppliers) {
		Supplier supplier = supplierDao.getSingleSupplier(id);
		return new ModelAndView("viewsupplier", "supplier", supplier);
	}
	 		 
	 @RequestMapping("editsupplier")
		public ModelAndView display15() {
			ModelAndView m6 = new ModelAndView("editsupplier");
			return m6;

		}		 		 
	 @RequestMapping(value="editsupplier",method=RequestMethod.GET)
	    public ModelAndView editSup(@RequestParam int id){
		 Supplier supplier1=supplierDao.getSingleSupplier(id);
	    	return new ModelAndView("editsupplier","Supplier",supplier1);
	    }

	 @RequestMapping(value="updatesupplier",method=RequestMethod.POST)
	    public ModelAndView updateSupplier(HttpServletRequest request,@Valid @ModelAttribute("Supplier")Supplier editsup,BindingResult result,Model model)
	    {
		 supplierDao.update(editsup);
			return new ModelAndView("managesuppliers");
	    }	 
	 @RequestMapping("deletesupplier")
		public ModelAndView deleteSupplier(@RequestParam int id) {
		 supplierDao.delete(id);
			ModelAndView m1 = new ModelAndView("managesuppliers");
			return m1;
		}
	 	 

}
