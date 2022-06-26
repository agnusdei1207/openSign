package com.open.cmmn.web;

import java.io.File;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

public class IndexManager {

	public static void main(String[] args) {
		IndexManager indexMng = new IndexManager();
		
	}
	
	
	/**
	 * 색인하기
	 */
	public void doIndex(String dataDir,String atchFileId) {
		
		// 색인 결과파일 폴더 지정
		String indexDir = "C:\\ips_attch\\index";
		
		Directory dir = null;
		IndexWriterConfig config = null;
		IndexWriter indexWriter = null;
		
		try {
			dir = FSDirectory.open(new File(indexDir).toPath());
			config = new IndexWriterConfig(new StandardAnalyzer());
			indexWriter = new IndexWriter(dir, config);
			File file = new File(dataDir);
			if(file.getCanonicalPath().toLowerCase().endsWith(".xlsx")
					|| file.getCanonicalPath().toLowerCase().endsWith(".xls")
					|| file.getCanonicalPath().toLowerCase().endsWith(".docx") 
					|| file.getCanonicalPath().toLowerCase().endsWith(".doc") 
					|| file.getCanonicalPath().toLowerCase().endsWith(".pptx")
					|| file.getCanonicalPath().toLowerCase().endsWith(".ppt")
					|| file.getCanonicalPath().toLowerCase().endsWith(".hwp")
					|| file.getCanonicalPath().toLowerCase().endsWith(".pdf")){
					indexFile(indexWriter, file, atchFileId);
				}
//			File[] fileArr = new File(dataDir).listFiles();
//			int fileCount = fileArr.length;
		/*	ArrayList<String> fileList = new ArrayList<String>();
			FileReadUtil.addAllTextFiles(fileList, new File(dataDir));
			int fileCount = fileList.size();
			
			System.out.println("파일개수 : " + fileCount + "개");
			
			File file = null;
			for (int i=0; i<fileCount; i++) {
				// file = fileArr[i];
				file = new File(fileList.get(i));
				
				if (file.isDirectory()) {
					continue;
				}
				
				if (file.isHidden()) {
					continue;
				}
				
				if (!file.exists()) {
					continue;
				}
				
				if (!file.canRead()) {
					continue;
				}
				
				if(file.getCanonicalPath().toLowerCase().endsWith(".xlsx")
					|| file.getCanonicalPath().toLowerCase().endsWith(".xls")
					|| file.getCanonicalPath().toLowerCase().endsWith(".docx") 
					|| file.getCanonicalPath().toLowerCase().endsWith(".doc") 
					|| file.getCanonicalPath().toLowerCase().endsWith(".pptx")
					|| file.getCanonicalPath().toLowerCase().endsWith(".ppt")
					|| file.getCanonicalPath().toLowerCase().endsWith(".pdf")){
					indexFile(indexWriter, file);
				}
			}*/
			
			System.out.println(indexWriter.numRamDocs() + "개 파일 색인처리 완료.");
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (indexWriter != null) {
					indexWriter.close();
				}
			} catch (Exception e) {
				indexWriter = null;
			}
			
			try {
				if (dir != null) {
					dir.close();
				}
			} catch (Exception e) {
				dir = null;
			}
		}
	}

	
	public void indexFile(IndexWriter indexWriter, File file, String atchFileId) throws Exception {
		Document doc = getDocument(file,atchFileId);
		indexWriter.addDocument(doc);
		
		

	}
	
	
	private Document getDocument(File file,String atchFileId) throws Exception {
		String fileContent = "";
	/*	if(file.getCanonicalPath().toLowerCase().endsWith(".xlsx") || file.getCanonicalPath().toLowerCase().endsWith(".docx") || file.getCanonicalPath().toLowerCase().endsWith(".pptx")){
			fileContent = FileReadUtil.docxFileContentParser(file);
		}else if(file.getCanonicalPath().toLowerCase().endsWith(".xls") || file.getCanonicalPath().toLowerCase().endsWith(".doc") || file.getCanonicalPath().toLowerCase().endsWith(".ppt")){
			fileContent = FileReadUtil.docFileContentParser(file);
		}else if(file.getCanonicalPath().toLowerCase().endsWith(".pdf")){
			fileContent = FileReadUtil.pdfFileParser(file);
		}else if(file.getCanonicalPath().toLowerCase().endsWith(".hwp")){
			fileContent = FileReadUtil.hwpFileParser(file);
		}*/
		
		Document doc = new Document();
		doc.add(new TextField("contents", fileContent,Field.Store.YES));
		doc.add(new TextField("filename", String.valueOf(file.getName()), Field.Store.YES));
		doc.add(new TextField("fullpath", String.valueOf(file.getCanonicalPath()), Field.Store.YES));
		doc.add(new TextField("atchFileId", atchFileId, Field.Store.YES));
		
		System.out.println("canonicalPath : " + file.getCanonicalPath());
		System.out.println("filename : " + file.getName());
		System.out.println("fileContent : " + fileContent);
		System.out.println("====================");
		
		return doc;
	}
}