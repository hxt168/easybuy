package un.dez.easybuy.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

//上传图片路径和图片名的处理

public class ImageFilePath {
	private final String upfolder="upload"; //上传到的文件夹
	private Date date;
	private String sqlPathName;
	private String filePath;
	private String filePathName;
	private boolean isFileRight; 
	
	public ImageFilePath(String fileName)
	{
		isFileRight=false;
		if(fileName!=null&&!"".equals(fileName))
		{
			String yearFolder;
			String dayFolder;
			String setFileName;
			String suffix="";
			date=new Date();
			if(fileName.indexOf(".")>0)
			{
				suffix=fileName.substring(fileName.lastIndexOf("."));
				
			}
			setFileName=date.getTime()+suffix;
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
			SimpleDateFormat sdf2=new SimpleDateFormat("MMdd");
			yearFolder=sdf.format(date);
			dayFolder=sdf2.format(date);
			filePath=upfolder+"\\"+yearFolder+"\\"+dayFolder+"\\";
			filePathName=filePath+setFileName;
			//sqlPathName="/"+upfolder+"/"+yearFolder+"/"+dayFolder+"/"+setFileName;
			sqlPathName="/"+yearFolder+"/"+dayFolder+"/"+setFileName;
			isFileRight=true;
				
			
		}else{
			sqlPathName="/0.jpg";
			
		}
		
		
	}
	
	public String getSqlPathName() {
		
		
		return sqlPathName;
	}
	public String getFilePath() {
		return filePath;
	}
	public String getFilePathName() {
		return filePathName;
	}

	public boolean isFileRight() {
		return isFileRight;
	}
	
	
}
