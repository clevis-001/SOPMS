package sopms.risk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sopms.risk.service.riskService;
import sopms.vo.Risk;
import sopms.vo.User;
import sopms.vo.riskJochi;
import sopms.vo.riskSch;


@Controller
public class riskController {
	@Autowired(required=false)
	private riskService service;
	// http://localhost:7080/sopms/risk.do
	@RequestMapping("risk.do")
	public String riskList(String risk_name, Model d) {
		d.addAttribute("list", service.getRiskList(risk_name));
		return "WEB-INF\\view\\risk_Index.jsp";
	}
	
	//http://localhost:7080/sopms/riskPageList.do
		@RequestMapping("riskPageList.do") //페이징 처리
		public String riskList2(riskSch sch,Model d) { 
			d.addAttribute("list",service.getRiskListPaging(sch));
		
			return "WEB-INF\\view\\risk_Index.jsp";
		}  
	
	//http://localhost:7080/sopms/insertList.do	
	@RequestMapping("insertList.do")
	public String insertList(){
		return "WEB-INF\\view\\risk_Insert.jsp";
	}
	
	//http://localhost:7080/sopms/insertPageGo.do	
	@RequestMapping("insertPageGo.do")
	public String insertPageGo( HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		System.out.println("login : "+user.getId());
		d.addAttribute("pj", service.projectList(user.getId()));
		return "WEB-INF\\view\\risk_Insert.jsp";
	}
	
	//http://localhost:7080/sopms/insertRisk.do	
		// 등록페이지 등록버튼
		@RequestMapping("insertRisk.do")
		public String riskInsert(HttpServletRequest request, Risk rk) {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			rk.setId(user.getId());
			service.insertRisk(rk);
			return "redirect:/riskPageList.do";
		}
		
	// 상세페이지 이동
	@RequestMapping("updatePageGo.do")
	public String updatePageGo(@RequestParam("risk_no") int risk_no, Model d) {
		d.addAttribute("riskDetail", service.detailRiskPaging(risk_no));
		return "WEB-INF\\view\\risk_Update.jsp";
	}
	
	
	// 등록 모달 창
	@RequestMapping("updateModalContent.do")
	public String updateModalContent(HttpServletRequest request, Risk rk, Model d) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		rk.setId(user.getId());
		service.uptModalContent(rk);
		d.addAttribute("riskJochi", service.riskJochiSelect(Integer.parseInt(rk.getRisk_no())));
		return "forward:/updatePageGo.do";
	}
	
	// 상세페이지 리스크 내용 수정
	
	
	// 삭제
	@RequestMapping("deleteRisk.do")
	public String deleteRisk(@RequestParam("risk_no") int risk_no) {
		service.deleteDetailRiskPage(risk_no);
		return "redirect:/riskPageList.do";
	}
}	
