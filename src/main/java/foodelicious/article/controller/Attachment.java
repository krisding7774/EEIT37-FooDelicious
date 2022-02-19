package foodelicious.article.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("attachment")
public class Attachment {
	//這邊是給CKEditor用的 建構資料夾&圖片
    private static final String CK_IMAGE_PATH = File.separator + "uploadImage";

    public Map<String, String> ckEditorUploadImage(MultipartFile file, HttpServletRequest request) {
        if(file==null || "".equals(file.getOriginalFilename().trim())) {
            return generateResult(false, "#");
        }
        // generate file name
        String originalName = file.getOriginalFilename();
        // get project path
        //System.currentTimeMillis() + "-" + 這個會自動產生系統編號 應該是可以不用沒問題 主要是怕說剛好有圖片同樣名稱
        String localFileName = originalName;
        // get the real path to store received images
        String projectRealPath = request.getSession().getServletContext().getRealPath("");
        
        String realPath = projectRealPath + CK_IMAGE_PATH;
        File imageDir = new File(realPath);
        if(!imageDir.exists()) {
            imageDir.mkdirs();
        }

        String localFilePath = realPath + File.separator + localFileName;
        try {
            file.transferTo(new File(localFilePath));
        } catch (IllegalStateException e) {
            e.printStackTrace();
            // log here
        } catch (IOException e) {
            e.printStackTrace();
            // log here
        }
        String imageContextPath = request.getContextPath() + "/uploadImage" + "/" + localFileName;
        // log here + 
//        System.out.println("received file original name: " + originalName);
//        System.out.println("stored local file name: " + localFileName);
//        System.out.println("file stored path: " + localFilePath);
//        System.out.println("returned url: " + imageContextPath);
        // log here -
        return generateResult(true, imageContextPath);
    }

    private Map<String, String> generateResult(boolean uploaded, String relativeUrl){
        Map<String, String> result = new HashMap<String, String>();
        result.put("uploaded", uploaded + "");
        result.put("url", relativeUrl);

        return result;
    }
}