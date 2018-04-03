import java.io.*;
import java.util.*;
public class ReadCsv{
String filename,dilimiter;
ArrayList<String[]> csvData;
BufferedReader br;
ReadCsv(String filename,String dilimiter) throws IOException{
this.filename=filename;
this.dilimiter=dilimiter;
csvData = new ArrayList<String[]>();
br = new BufferedReader(new FileReader(new File(this.filename)));
String line;
while((line = br.readLine())!=null){
String[] singleLine  = line.split(this.dilimiter);
csvData.add(singleLine);
}
}
}
