package com.jjobkorea.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jjobkorea.dto.JobseekerBoardAttachDTO;
import com.jjobkorea.service.JobseekerUploadService;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Slf4j
public class JobseekerUploadController {
	@Autowired
	private JobseekerUploadService service;
	
	@PostMapping("/uploadAjaxAction")
//	public void uploadAjaxPost(MultipartFile[] uploadFile) {
//	ResponseEntity : 파일 정보를 넘기기위해서 사용
	public ResponseEntity<List<JobseekerBoardAttachDTO>> uploadAjaxPost(@RequestParam("uploadFile") MultipartFile[] uploadFile) {
		log.info("upload ajax post...");
		
		List<JobseekerBoardAttachDTO> list = new ArrayList<>();
		
		String uploadFolder = "D:\\dev\\upload";
		String uploadFolderPath = getFolder();
//		"D:\\dev\\upload"+년월일 폴더
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("@# uploadPath=>"+uploadPath);
		
		if (uploadPath.exists() == false) {
			// make yyyy/MM/dd folder
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("==============================");
//			getOriginalFilename : 업로드 되는 파일 이름
			log.info("@# 업로드 되는 파일 이름=>"+multipartFile.getOriginalFilename());
//			getSize : 업로드 되는 파일 크기
			log.info("@# 업로드 되는 파일 크기=>"+multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			log.info("@# uuid=>"+uuid);
			
			JobseekerBoardAttachDTO boardAttachDTO = new JobseekerBoardAttachDTO();
			boardAttachDTO.setJobseekerBoardAttachFileName(uploadFileName);
			boardAttachDTO.setJobseekerBoardAttachUuid(uuid.toString());
			boardAttachDTO.setJobseekerBoardAttachUploadPath(uploadFolderPath);
			log.info("@# boardAttachDTO 01=>"+boardAttachDTO);
			
			uploadFileName = uuid.toString() +"_"+uploadFileName;
			log.info("@# uuid uploadFileName=>"+uploadFileName);
			
//			saveFile : 경로하고 파일이름
			File saveFile = new File(uploadPath, uploadFileName);
			FileInputStream fis=null;
			
			try {
//				transferTo : saveFile 내용을 저장
				multipartFile.transferTo(saveFile);
				
//				참이면 이미지 파일
				if (checkImageType(saveFile)) {
					boardAttachDTO.setJobseekerBoardAttachImage(true);
					log.info("@# boardAttachDTO 02=>"+boardAttachDTO);
					
					fis = new FileInputStream(saveFile);
					
//					썸네일 파일은 s_ 를 앞에 추가
					FileOutputStream thumnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					
//					썸네일 파일 형식을 100/100 크기로 생성
					Thumbnailator.createThumbnail(fis, thumnail, 100, 100);
					
					thumnail.close();
				}
				
				list.add(boardAttachDTO);
			} catch (Exception e) {
				log.error(e.getMessage());
			}finally {
				try {
					if (fis != null) fis.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}//end of for
		
//		파일정보들을 list 객체에 담고, http 상태값은 정상으로 리턴
		return new ResponseEntity<List<JobseekerBoardAttachDTO>>(list, HttpStatus.OK);
	}
	
//	날짜별 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String str = sdf.format(date);
		
		log.info("@# str=>"+str);
		log.info("@# separator=>"+File.separator);
		
		return str.replace("-", File.separator);
	}
	
//	이미지 여부 체크
	public boolean checkImageType(File file) {
		try {
//			이미지파일인지 체크하기 위한 타입(probeContentType)
			String contentType = Files.probeContentType(file.toPath());
			log.info("@# contentType=>"+contentType);
			
//			probeContentType 메소드 버그로 로직 추가
			if (contentType == null) {
				return false;
			}
			
			log.info("@# startsWith===>"+contentType.startsWith("image"));
			
//			startsWith : 파일종류 판단
			return contentType.startsWith("image");//참이면 이미지파일
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;//거짓이면 이미지파일이 아님
	}
	
//	이미지파일을 받아서 화면에 출력(byte 배열타입)
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(@RequestParam(name = "fileName") String fileName) {
		log.info("@# display fileName=>"+fileName);
		
//		업로드 파일경로+이름
		File file = new File("D:\\dev\\upload\\"+fileName);
		log.info("@# file=>"+file);
		
		ResponseEntity<byte[]> result=null;
		HttpHeaders headers=new HttpHeaders();
		
		try {
//			파일타입을 헤더에 추가
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
//			파일정보를 byte 배열로 복사+헤더정보+http상태 정상을 결과에 저장
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(@RequestParam("fileName") String fileName, @RequestParam("type") String type) {
		log.info("@# deleteFile fileName=>"+fileName);
		File file;
		
		try {
//			URLDecoder.decode : 서버에 올라간 파일을 삭제하기 위해서 디코딩
			file = new File("D:\\dev\\upload\\"+URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
//			이미지 파일이면 썸네일도 삭제
			if (type.equals("image")) {
//				getAbsolutePath : 절대경로(full path)
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("@# largeFileName=>"+largeFileName);
				
				file = new File(largeFileName);
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
//			예외 오류 발생시 not found 처리
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
//		deleted : success 의 result 로 전송
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
//	@GetMapping(value = "/getFileList", produces = MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
	@GetMapping(value = "/getFileList")
	public ResponseEntity<List<JobseekerBoardAttachDTO>> getFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# getFileList()");
		log.info("@# param=>"+param);
		log.info("@# param=>"+param.get("jobseekerCommunityBoardNum"));
		
		return new ResponseEntity<>(service.getFileList(Integer.parseInt(param.get("jobseekerCommunityBoardNum"))), HttpStatus.OK);
	}
	
//	모든 파일은 내부적으로 bit 값을 가짐(문서, 영상, 이미지, 소리)
	@GetMapping(value = "/download")
	public ResponseEntity<Resource> download(@RequestParam("fileName") String fileName) {
		log.info("@# download fileName=>"+fileName);
		
		//파일을 리소스(자원)로 변경. 파일을 비트값으로 전환.
		Resource resource=new FileSystemResource("D:\\dev\\upload\\"+fileName);
		log.info("@# resource=>"+resource);
		
//		리소스에서 파일명을 찾아서 변수에 저장
		String resourceName = resource.getFilename();
		
//		uuid 를 제외한 파일명
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		HttpHeaders headers=new HttpHeaders();
		
		try {
//			헤더에 파일다운로드 정보 추가
			headers.add("Content-Disposition"
					, "attachment; filename="
						+ new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		윈도우 다운로드시 필요한 정보(리소스, 헤더, 상태OK)
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
}