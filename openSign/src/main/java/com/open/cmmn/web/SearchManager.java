package com.open.cmmn.web;
import java.io.File;

import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.WildcardQuery;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

public class SearchManager {

	public static void main(String[] args) {
		SearchManager searchMng = new SearchManager();
		searchMng.doSearch("회원사");
	}
	
	
	/**
	 * 검색하기
	 */
	public void doSearch(String key) {
		
		// 색인 결과파일 폴더 지정
		String indexDir = "C:\\ips_attch\\index";
		
		// 검색 키워드
		String keyword = "*"+key+"*";
		
		Directory dir = null;
		IndexReader indexReader = null;
		IndexSearcher indexSearcher = null;
		
		try {
			dir = FSDirectory.open(new File(indexDir).toPath());
			indexReader = DirectoryReader.open(dir);
			indexSearcher = new IndexSearcher(indexReader);
			
			// 정확한 어절을 검색하려면 TermQuery 객체 사용.
			//Query query = new TermQuery(new Term("contents", keyword));
			
			// 와일드 카드(? 또는 *) 사용하여 검색하려면 WildcardQuery 객체 사용.
			Query query = new WildcardQuery(new Term("contents", keyword));
			TopDocs docs = indexSearcher.search(query, 10);
			
			int docCount = 0;
			if (docs.scoreDocs != null) {
				docCount = docs.scoreDocs.length;
				System.out.println("검색결과 : " + docCount + "개");
				Document doc = null;
				for (int i=0; i<docCount; i++) {
					doc = indexSearcher.doc(docs.scoreDocs[i].doc);
					System.out.println(doc.get("contents"));
					System.out.println(doc.get("filename"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (indexReader != null) {
					indexReader.close();
				}
			} catch (Exception e) {
				indexReader = null;
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
	
}