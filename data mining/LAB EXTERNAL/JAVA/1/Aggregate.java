import java.io.*;
import java.util.*;
public class Aggregate{
ReadCsv rcsv;
HashMap<String,ArrayList<String[]>> classes;
int min,max,col;
static Scanner sc = new Scanner(System.in);
Aggregate(String filename) throws IOException
{
rcsv = new ReadCsv(filename,",");
classes = new HashMap<String,ArrayList<String[]>>();
min = Integer.MAX_VALUE;
max = Integer.MIN_VALUE;
System.out.println("Enter The Column Number:");
col = sc.nextInt()-1;
classes.put("S",new ArrayList<String[]>());
classes.put("A",new ArrayList<String[]>());
classes.put("B",new ArrayList<String[]>());
classes.put("C",new ArrayList<String[]>());
classes.put("D",new ArrayList<String[]>());
classes.put("E",new ArrayList<String[]>());
classes.put("F",new ArrayList<String[]>());
this.aggregate();
this.discretize();
this.stratifyData();
this.selectRandomSample();
}
void aggregate(){
for(String[] line:rcsv.csvData){
if(Integer.parseInt(line[col])>max)
max=Integer.parseInt(line[col]);
else if(Integer.parseInt(line[col])<min)
min=Integer.parseInt(line[col]);
}
System.out.println("Max :"+max);
System.out.println("Min :"+min);
}
void discretize(){
int mean = (min+max)/2;
int mid1 = (min+mean)/2;
int mid2 = (mean+max)/2;
for(String[] line:rcsv.csvData){
for(int i=0;i<line.length;i++){
if(i==col){
int val = Integer.parseInt(line[i]);
if(val >=min && val < mid1)
System.out.print(min+"-"+mid1+" ");
else if(val >=mid1 && val < mean)
System.out.print(mid1+"-"+mean+" ");
else if(val >=mean && val <mid2)
System.out.print(mean+"-"+mid2+" ");
else if(val >=mid2 && val <=max)
System.out.print(mid2+"-"+max+" ");
}else
System.out.print(line[i]+" ");
}
System.out.println();
}
}
void stratifyData(){
String cl ="";
for(String[] line:rcsv.csvData){
double val = Double.parseDouble(line[2]);
if(val >=90 && val <= 100)
cl="S";
else if(val >=75 && val <90)
cl="A";
else if(val >=60 && val <75)
cl="B";
else if(val >=45 && val<60)
cl="C";
else if(val >=35 && val<45)
cl="D";
else
cl="F";
classes.get(cl).add(line);
}
}

void selectRandomSample(){
Random r = new Random();
for(String key:classes.keySet()){
System.out.println("Class : "+key);
if(classes.get(key).isEmpty())
continue;
String[] sample = classes.get(key).get(r.nextInt(classes.get(key).size()));
for(String s:sample)
System.out.print(s+" ");
System.out.println();
}
}

public static void main(String args[]) throws IOException{
System.out.println("Enter File Name :");
Aggregate a = new Aggregate(sc.next());
}
}

