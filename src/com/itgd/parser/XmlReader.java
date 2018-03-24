package com.itgd.parser;

import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

//import com.itgd.data.DbManager;


/**
 * 
 * @author Santosh Jena
 */
public class XmlReader {

	public ArrayList read(String url) {

		ArrayList rssData = new ArrayList();

		try {

			DocumentBuilderFactory factory = DocumentBuilderFactory	.newInstance();
			factory.setValidating(false);
			factory.setNamespaceAware(true);
			factory.setIgnoringElementContentWhitespace(true);
			factory.setIgnoringComments(true);
			DocumentBuilder builder = factory.newDocumentBuilder();
			builder.setErrorHandler(new ErrorHandler() {
			public void warning(SAXParseException e) throws SAXException {
			System.out.println(e);			
			}
			public void error(SAXParseException e) throws SAXException {
			System.out.println(e);			
			}
			public void fatalError(SAXParseException e) throws SAXException {
			System.out.println(e);			
			}
			});

			Document doc = builder.parse(url);
			Node root = doc.getDocumentElement();

			NodeList channels = doc.getElementsByTagName("indices");
			for (int i = 0; i < channels.getLength(); i++) {
				NodeList nodes = channels.item(i).getChildNodes();
				for (int j = 0; j < nodes.getLength(); j++) {

					Node n = nodes.item(j);
					
					if (n.getNodeName().equals("indice")) {
						XmlItem rssItem = loadRssItem(n);
						rssData.add(rssItem);
					}
					
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			//DbManager db = new DbManager();
			//db.insertError(e.getMessage());

		}

		return rssData;
	}

	private XmlItem loadRssItem(Node root) throws Exception {
		String id = "";
		String name = "";
		String current_value = "";
		String value_change = "";
		String percentage_change = "";
		
		NamedNodeMap nnp = root.getAttributes();		
		//id = nnp.getNamedItem("indice").getNodeValue();
		NodeList nodes = root.getChildNodes();
		for (int i = 0; i < nodes.getLength(); i++) {
			Node node = nodes.item(i);
			//System.out.println("----->"+node.getNodeName());
			if (node.getNodeName().toLowerCase().equals("name")) {
				
				name=node.getTextContent();
			}
			if (node.getNodeName().toLowerCase().equals("current_value")) {
				
				current_value=node.getTextContent();
			}if (node.getNodeName().toLowerCase().equals("value_change")) {
				
				value_change=node.getTextContent();
			}if (node.getNodeName().toLowerCase().equals("percentage_change")) {
				
				percentage_change=node.getTextContent();
			}
				

		
		
		}
		
		
		
		
		XmlItem item = new XmlItem();
		item.setId(id);
		item.setName(name);
		item.setCurrent_value(current_value);
		item.setPercentage_change(percentage_change);
		item.setValue_change(value_change);
		
		
		return item;
	}

	

	public void getxmlData(String url) {
		String id = "";
		String name = "";
		String current_value = "";
		String value_change = "";
		String percentage_change = "";
		ArrayList xmlata = read(url);
		if (xmlata != null && xmlata.size() > 0) {
			for (int i = 0; i < xmlata.size(); i++) {
				XmlItem item = (XmlItem) xmlata.get(i);
				
				 name = item.getName();
				 current_value = item.getCurrent_value();
				 value_change = item.getValue_change();
				 percentage_change = item.getPercentage_change();
				 
				 System.out.println("---->"+name);
				 System.out.println("---->"+current_value);
				 System.out.println("---->"+value_change);
				 System.out.println("---->"+percentage_change);

			}

		} else {

			System.out.println("No Data Found");
		}

	}

	
	public static void main(String[] args) {
		XmlReader read = new XmlReader();		
		read.getxmlData("http://businesstoday.accordhostings.com/SensexNiftyFeed.aspx");
		
	}

}
