package getInfo_FIDS;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class IncheonAirport {
    private static final String ServiceKey = "7VDR5J%2Bou578BKJjc7Sx2zZapo4KWdDYheTbg%2BsNJgt%2FHMLGtWD1W6xAube0dHcQ2iUvTav81Hq09%2BXq3b8srw%3D%3D";
    private static final String url = "http://openapi.airport.co.kr/service/rest/FlightStatusList/getFlightStatusList?ServiceKey=";
    private static final String preAppended = "&pageNo=1&schStTime=";
    private static final String afterAppended = "&schEdTime=2400&schAirCode=CJU";
    String time = null;
    String destination = null;
    String flightID = null;
    String airLine = null;
    String gate = null;

    HashMap<Integer, ArrayList<String>> FIDS_Info_Map = new HashMap<>();
    public HashMap<Integer, ArrayList<String>>  getFIDS() {
        try {
            String URL = url + ServiceKey + preAppended + getCurrTime() + afterAppended;
            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(URL);
            doc.getDocumentElement().normalize();
            Element e;
            NodeList parentNodelist;
            parentNodelist = doc.getElementsByTagName("item");
            for (int i = 0; i < parentNodelist.getLength(); i++) {
                e = (Element) parentNodelist.item(i);
                ArrayList<String> FIDS_Info_AL = new ArrayList<>();
                time = e.getElementsByTagName("std").item(0).getTextContent();
                destination = e.getElementsByTagName("arrivedKor").item(0).getTextContent();
                flightID = e.getElementsByTagName("airFln").item(0).getTextContent();
                airLine = e.getElementsByTagName("airlineKorean").item(0).getTextContent();
                gate = e.getElementsByTagName("gate").item(0).getTextContent();
                FIDS_Info_AL.add(0, time);
                FIDS_Info_AL.add(1, destination);
                FIDS_Info_AL.add(2, flightID);
                FIDS_Info_AL.add(3, airLine);
                FIDS_Info_AL.add(4, gate);
                FIDS_Info_Map.put(i, FIDS_Info_AL);
            }
            return FIDS_Info_Map;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public String getDate(){
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String Today = formatter.format(date);
        return Today;
    }

    public static String getCurrTime(){
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("HHmm");
        String CurrTime = formatter.format(date);
        return CurrTime;
    }
}
