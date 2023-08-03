package com.google.phonebook.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.phonebook.dao.PhoneBookDao;
import com.google.phonebook.dao.UserTableDao;
import com.google.phonebook.dto.PhoneBookDto;
import com.google.phonebook.dto.UserTableDto;
import com.google.phonebook.service.UserTableService;

import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/phonebook")
public class PhoneBookController {

	PhoneBookDao phonebookDao;
	UserTableDao usertableDao;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	public PhoneBookController(PhoneBookDao phonebookDao, UserTableDao usertableDao) {
		this.phonebookDao = phonebookDao;
		this.usertableDao = usertableDao;
	}

	@Value("${phonebook.imgdir}")
	String fdir;

//   회원가입 화면
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}

//   회원가입 처리
	@PostMapping("/up")
	public String signup(@ModelAttribute UserTableDto usertableDto, Model model,
			@RequestParam("file") MultipartFile file, RedirectAttributes red) {
		// 2.0 파일 처리 => 파일 객체 생성, 저장
		File dest = new File(fdir + "/" + file.getOriginalFilename()); // 파일 생성x(경로+파일명)

		try {
			// 2.1 정상처리
			file.transferTo(dest);// 파일 저장
			usertableDto.setImgnm("/images/" + dest.getName());// 중복이미지일시 변경된이름으로get
			logger.info(dest.getName());
			usertableDao.insert(usertableDto);
			red.addFlashAttribute("msg", "<script>alert('회원가입을 축하합니다.');</script>");
		} catch (Exception e) {
			// 2.2 비정상처리 => 화면에 비정상처리 경고메세지보내야함
			e.printStackTrace();
			logger.warn("회원가입 과정에서의 문제 발생");
			model.addAttribute("error", "회원가입이 정상적으로되지 않았습니다.");
			red.addFlashAttribute("msg", "<script>alert('회원가입에 실패하셨습니다. 다시 회원가입해주세요');</script>");
		}

		return "redirect:/phonebook/signin";
	}

//   로그인 화면
	@GetMapping("/signin")
	public String signin() {
		return "signin";
	}

//	 로그인 처리
	@PostMapping("/in")
	public String signin(@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "userpassword", required = false) String userpassword, Model model,
			HttpServletRequest request, RedirectAttributes red) {
		UserTableService usertableservice = new UserTableService();
		int check;
		try {
			usertableservice.equalcheck(userid, userpassword);
			check = usertableservice.equalcheck(userid, userpassword);

			if (check == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("userid", userid);
				red.addFlashAttribute("msg", "<script>alert('로그인에 성공하셨습니다.');</script>");
			} else {
				red.addFlashAttribute("msg", "<script>alert('로그인에 실패하셨습니다. 다시 로그인해주세요');</script>");
				return "redirect:/phonebook/signin";
			}
		} catch (Exception e) {
			// 2.2 비정상처리 => 화면에 비정상처리 경고메세지보내야함
			e.printStackTrace();
			logger.warn("로그인 과정에서의 문제 발생");
			model.addAttribute("error", "로그인이 정상적으로되지 않았습니다.");
		}
		return "redirect:/phonebook/login/afterlogin";

	}

//	 연락처 추가 화면
	@GetMapping("/login/add")
	public String add() {

		return "addMember";
	}

//	연락처 추가 처리
	@PostMapping("/add")
	public String adddto(@ModelAttribute PhoneBookDto phonebookdto, Model model, HttpServletRequest request) {
		PhoneBookDao phonebookdao = new PhoneBookDao();
		try {
			HttpSession session = request.getSession();
			String insertsession = (String) session.getAttribute("userid");
			phonebookdto.setUserid(insertsession);
			phonebookdao.insert(phonebookdto);
		} catch (Exception e) {
			// 2.2 비정상처리 => 화면에 비정상처리 경고메세지보내야함
			e.printStackTrace();
			logger.warn("연락처 추가과정에서의 문제 발생");
			model.addAttribute("error", "연락처 추가가 정상적으로되지 않았습니다.");
		}
		return "redirect:/phonebook/login/searchall";
	}

// 	로그인 전 메인화면 
	@GetMapping("/beforelogin")
	public String loginbefore() {
		return "loginbeforemainpage";
	}

//	로그인 후 메인화면
	@GetMapping("/login/afterlogin")
	public String loginafter(Model model, HttpServletRequest request,
			@RequestParam(defaultValue = "/") String redirectURL) {
		UserTableDto userdto;
		try {
			HttpSession session = request.getSession();
			String insertsession = (String) session.getAttribute("userid");
			userdto = usertableDao.searchAll(insertsession);
			session.setAttribute("image", userdto);
			session.setAttribute("username", userdto.getUsername());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "loginaftermainpage";
	}

//  연락처 전체 목록
	@GetMapping("/login/searchall")
	public String searchall(Model model, HttpServletRequest request) {
		List<PhoneBookDto> list;
		try {
			HttpSession session = request.getSession();
			String sessionuserid = (String) session.getAttribute("userid");
			list = phonebookDao.searchByID(sessionuserid);
			list.size();
			model.addAttribute("memberlist", list);
			model.addAttribute("listsize", list.size());
		} catch (Exception e) {
			e.printStackTrace(); // 개발시에는 필요하다.
			logger.warn("연락처 목록 생성 과정에서 문제 발생"); // logger에는 level이 5개가 있다. // 서버쪽 콘솔에 출력
			model.addAttribute("error", "연락처 목록이 정상적으로 처리되지 않았습니다."); // 브라우저 화면에 출력

		}
		return "searchall";
	}

//	연락처 삭제 
	@GetMapping("/delete/{phonenumber}")
	public String delete(@PathVariable String phonenumber, Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			String sessionuserid = (String) session.getAttribute("userid");
			phonebookDao.delete(phonenumber, sessionuserid);

		} catch (SQLException e) {
			e.printStackTrace();
			logger.warn("연락처 삭제 과정에서 문제 발생");
			model.addAttribute("error", "연락처가 정상적으로 삭제되지 않았습니다.");
		}
		return "redirect:/phonebook/login/searchall";
	}

//	연락처 목록 검색
	@PostMapping("/search")
	public String searchbyname(@RequestParam(value = "searchbyname", required = false) String searchname, Model model,
			HttpServletRequest request) {
		List<PhoneBookDto> list;
		try {
			HttpSession session = request.getSession();
			String insertsession = (String) session.getAttribute("userid");
			list = phonebookDao.searchByName(searchname, insertsession);
			list.size();
			model.addAttribute("searchnamelist", list);
			model.addAttribute("listsize", list.size());
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("이름검색 목록 생성 과정에서 문제 발생"); // logger에는 level이 5개가 있다. // 서버쪽 콘솔에 출력
			model.addAttribute("error", "이름검색 목록이 정상적으로 처리되지 않았습니다.");
		}

		return "searchbyname";

	}

//	연락처 수정 화면,처리
	@PostMapping("/login/update")
	public String update(@ModelAttribute PhoneBookDto phonebookdto,
			@RequestParam(value = "phonenumber", required = false) String phonenumber,
			@RequestParam(value = "membernm", required = false) String name , Model model,
			ServletRequest request) {
		PhoneBookDao phonebookDao = new PhoneBookDao();
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false);
		String userid = (String) session.getAttribute("userid");
		phonebookdto.setUserid(userid);
		phonebookdto.setPhonenumber(phonenumber);
		try {
			phonebookDao.update(phonebookdto);
			logger.info("연락처 수정 성공");

		} catch (Exception e) {
			e.printStackTrace();
			logger.info("연락처 수정 과정에서 문제 발생!!");
			model.addAttribute("error", "연락처가 정상적으로 수정되지 않았습니다!!");
		}

		return "redirect:/phonebook/login/searchall";
	}

//	세션 삭제
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public int idCheck(@RequestParam("userid") String userid) {
		// select * from member where userid = #{};
		// 이 member 객체에는 id만 값이 들어있고, 다른 것은 다 null 값이다.
		int check = 0;
		try {
			ArrayList<UserTableDto> list = usertableDao.signupidcheck(userid);
			if (list.size() > 0) {
				check = 1;
			} else {
				check = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@ResponseBody
	@RequestMapping(value = "/pncheck", method = RequestMethod.POST)
	public int pncheck(@RequestParam(value = "phonenumber", required = false) String phonenumber, ServletRequest request) {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false);
		String userid = (String) session.getAttribute("userid");
		int check = 0;
		try {
			ArrayList<PhoneBookDto> list = phonebookDao.addmemberpncheck(phonenumber, userid);
				if(list.size() == 0) {
					check = 1;
				} else {
				check = 0;
			}
				
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@ResponseBody
	@RequestMapping(value = "/namecheck", method = RequestMethod.POST)
	public int namecheck(@RequestParam(value = "membernm", required = false) String membernm) {
		int check = 0;
		try {
			if (membernm.length() < 2 || membernm.length() == 0) {
				check = 1;
			} else {
				check = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@ResponseBody
	@RequestMapping(value = "/addresscheck", method = RequestMethod.POST)
	public int addresscheck(@RequestParam(value = "address", required = false) String address) {
		int check = 0;
		try {
			if (address.length() < 2 || address.length() == 0) {
				check = 1;
			} else {
				check = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@ResponseBody
	@RequestMapping(value = "/pwcheck", method = RequestMethod.POST)
	public int passwordcheck(@RequestParam(value = "pw", required = false) String password) {
		int check = 0;
		try {
			if (password.length() < 6 || password.length() == 0) {
				check = 1;
			} else {
				check = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	@GetMapping("/login/updateprofile")
	public String updateprofile(Model model, HttpServletRequest request) {
		List<UserTableDto> list;
		
			HttpSession session = request.getSession();
			String sessionuserid = (String) session.getAttribute("userid");
			try {
				list = usertableDao.searchuserinfo(sessionuserid);
				list.size();
				model.addAttribute("userinfo", list);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "updateprofile";
	}
	
	@PostMapping("/login/updateprofileimg")
	public String updateimg(@ModelAttribute UserTableDto usertableDto, Model model,
			@RequestParam("file") MultipartFile file, RedirectAttributes red, HttpServletRequest request) {
		File dest = new File(fdir + "/" + file.getOriginalFilename()); // 파일 생성x(경로+파일명)
		try {
			// 2.1 정상처리
			file.transferTo(dest);// 파일 저장
			usertableDto.setImgnm("/images/" + dest.getName());// 중복이미지일시 변경된이름으로get
			HttpSession session = request.getSession();
			String updateprofile = (String) session.getAttribute("userid");
			usertableDto.setUserid(updateprofile);
			usertableDao.updateprofileimage(usertableDto);
			red.addFlashAttribute("msg", "<script>alert('회원정보 수정에 성공했습니다.');</script>");
		} catch (Exception e) {
			// 2.2 비정상처리 => 화면에 비정상처리 경고메세지보내야함
			e.printStackTrace();
			logger.warn("프로필 이미지 변경 과정에서의 문제 발생");
			model.addAttribute("error", "회원가입이 정상적으로되지 않았습니다.");
			red.addFlashAttribute("msg", "<script>alert('회원정보 수정에 실패했습니다.');</script>");
		}
		return "redirect:/phonebook/login/afterlogin";
		
		
	}
	@PostMapping("/login/updateprofilename")
	public String updatename(@RequestParam(value = "membernm", required = false) String usernm, Model model,
			 RedirectAttributes red, HttpServletRequest request) {
		try {
			// 2.1 정상처리
			HttpSession session = request.getSession();
			String updateprofile = (String) session.getAttribute("userid");
			usertableDao.updateprofilename(usernm, updateprofile);
			red.addFlashAttribute("msg", "<script>alert('회원정보 수정에 성공했습니다.');</script>");
		} catch (Exception e) {
			// 2.2 비정상처리 => 화면에 비정상처리 경고메세지보내야함
			e.printStackTrace();
			logger.warn("이름 과정에서의 문제 발생");
			model.addAttribute("error", "회원가입이 정상적으로되지 않았습니다.");
			red.addFlashAttribute("msg", "<script>alert('회원정보 수정에 실패했습니다.');</script>");
		}
		return "redirect:/phonebook/login/afterlogin";
		
		
	}
	@PostMapping("/login/updateprofilepw")
	public String updatepw(@RequestParam(value = "userpassword", required = false) String userpw, Model model,
			 RedirectAttributes red, HttpServletRequest request) {
		try {
			// 2.1 정상처리
			HttpSession session = request.getSession();
			String updateprofile = (String) session.getAttribute("userid");
			usertableDao.updateprofilepassword(userpw, updateprofile);
			red.addFlashAttribute("msg", "<script>alert('회원정보 수정에 성공했습니다.');</script>");
		} catch (Exception e) {
			// 2.2 비정상처리 => 화면에 비정상처리 경고메세지보내야함
			e.printStackTrace();
			logger.warn("비밀번호 변경 과정에서의 문제 발생");
			model.addAttribute("error", "회원가입이 정상적으로되지 않았습니다.");
			red.addFlashAttribute("msg", "<script>alert('회원정보 수정에 실패했습니다.');</script>");
		}
		return "redirect:/phonebook/login/afterlogin";
		
		
	}
	@PostMapping("/login/deleteprofile")
	public String deleteprofile(Model model,
			 RedirectAttributes red, HttpServletRequest request) {
		try {
			// 2.1 정상처리
			HttpSession session = request.getSession();
			String deleteprofile = (String) session.getAttribute("userid");
			usertableDao.userdelete(deleteprofile);
			red.addFlashAttribute("msg", "<script>alert('회원정보 수정에 성공했습니다.');</script>");
		} catch (Exception e) {
			// 2.2 비정상처리 => 화면에 비정상처리 경고메세지보내야함
			e.printStackTrace();
			logger.warn("비밀번호 변경 과정에서의 문제 발생");
			model.addAttribute("error", "회원가입이 정상적으로되지 않았습니다.");
			red.addFlashAttribute("msg", "<script>alert('회원정보 수정에 실패했습니다.');</script>");
		}
		return "redirect:/phonebook/removesession";
		
		
	}
	@GetMapping("/removesession")
	public String removesession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userid");
		return "redirect:/phonebook/beforelogin";
	}
}