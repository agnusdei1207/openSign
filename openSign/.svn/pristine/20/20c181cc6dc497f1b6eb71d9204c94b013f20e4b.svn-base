package com.open.cmmn.util;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlParserUtil {

	public static String getTagValue(String tag, Element eElement){
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		
		Node nValue = (Node) nlList.item(0);
		if(nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
	public static String getTagValue(String tag, Element eElement, int idx){
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		
		Node nValue = (Node) nlList.item(idx);
		if(nValue == null)
			return null;
		return nValue.getNodeValue();
	}
}