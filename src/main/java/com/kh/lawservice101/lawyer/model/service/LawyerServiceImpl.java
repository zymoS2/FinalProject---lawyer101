package com.kh.lawservice101.lawyer.model.service;

import com.kh.lawservice101.category.model.service.CategoryService;
import com.kh.lawservice101.category.model.vo.CategoryVo;
import com.kh.lawservice101.lawyer.model.dao.LawyerDao;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.UUID;

@RequiredArgsConstructor
@Service
@Slf4j
public class LawyerServiceImpl implements LawyerService {

    private final LawyerDao lawyerDao;
    private final CategoryService categoryService;
    @Value("${file.upload.path}")
    private String uploadPath;

    //변호사 업데이트
    @Override
    public int updateLawyer(LawyerVo lawyerPram) {
        //실행하고 바로 반환
        return lawyerDao.updateLawyer(lawyerPram);
    }

    //변호사 가입
    @Override
    public void saveLawyer(LawyerVo lawyerVo) {
        lawyerDao.insertLawyer(lawyerVo);
    }

    //변호사 단건 조회
    @Override
    public LawyerVo findLawyer(LawyerVo lawyerPram) {
        return lawyerDao.selectLawyerVo(lawyerPram);
    }

    //변호사 단건 조회
    @Override
    public LawyerVo findLawyer(Long lawyerNum) {
        return lawyerDao.selectLawyer(lawyerNum);
    }

    //변호사 목록 조회
    @Override
    public ArrayList<LawyerVo> findAllLawyers() {
        return lawyerDao.selectAllLawyers();
    }

    @Override
    public LawyerVo findLawyerByEmail(String email) {
        return lawyerDao.selectLawyerByEmail(email);
    }

    @Override
    public LawyerVo findLawyerByIdAndEmail(String resetPwdId, String resetPwdEmail) {
        return lawyerDao.selectLawyerByIdAndEmail(resetPwdId, resetPwdEmail);
    }

    @Override
    public void passwordModify(String tempPwd, Long lawyerNum) {
        lawyerDao.updatePassword(tempPwd, lawyerNum);
    }

    @Override
    public void editInfo(LawyerVo findLawyer, LawyerVo lawyerVo) {
        findLawyer.setLawyerEmail(lawyerVo.getLawyerEmail());
        findLawyer.setLawyerName(lawyerVo.getLawyerName());

        lawyerDao.updateInfo(findLawyer);
    }

    @Override
    public void editProfile(LawyerVo findLawyer, MultipartFile multipartFile, LawyerVo lawyerVo) {
        if(!multipartFile.getOriginalFilename().equals("")) {
            String folderPath = makeFolder();
            String uuid = UUID.randomUUID().toString();

            String originalFilename = multipartFile.getOriginalFilename();
            String fileName = originalFilename.substring(originalFilename.lastIndexOf("//") + 1);
            log.info("fileName={}", fileName);

            String saveName = folderPath + File.separator + uuid + "_" + fileName;
            log.info("saveName={}", saveName);

            Path savePath = Paths.get(uploadPath + File.separator + saveName);
            log.info("savePath={}", savePath);

            try {
                multipartFile.transferTo(savePath);

                saveName = URLEncoder.encode(saveName,"UTF-8");
                findLawyer.setLawyerImg(saveName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        CategoryVo category = categoryService.findCategory(lawyerVo.getCategoryVo().getCategoryNum());

        findLawyer.setLawyerIntroMsg(lawyerVo.getLawyerIntroMsg());
        findLawyer.setCategoryVo(category);

        lawyerDao.updateProfile(findLawyer);
    }

    private String makeFolder(){

        String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
        String folderPath = str.replace("/", File.separator);

        // make folder
        File uploadPathFolder = new File(uploadPath, folderPath);
        //File newFile= new File(dir,"파일명");
        //->부모 디렉토리를 파라미터로 인스턴스 생성

        if(uploadPathFolder.exists() == false){
            uploadPathFolder.mkdirs();
            //만약 uploadPathFolder가 존재하지않는다면 makeDirectory하라는 의미입니다.
            //mkdir(): 디렉토리에 상위 디렉토리가 존재하지 않을경우에는 생성이 불가능한 함수
            //mkdirs(): 디렉토리의 상위 디렉토리가 존재하지 않을 경우에는 상위 디렉토리까지 모두 생성하는 함수
        }
        return folderPath;
    }
}
