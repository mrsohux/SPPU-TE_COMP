import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class spos2 {
	static obj[] symb_table=new obj[10];
	static obj[] literal_table=new obj[10];
	static int symb_found=0;
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("ENTER TOTAL NUMBER OF SYMBOLS : ");
		int total_symb = sc.nextInt();
		int pos,num;
		for(int i=0 ; i<total_symb; i++)
		{
			symb_table[i]=new obj("",0);
			System.out.println("ENTER SYMBOL NAME : ");
			symb_table[i].name=sc.next();
			System.out.println("ENTER SYMBOL ADDRESS : ");
			symb_table[i].addr=sc.nextInt();
		}
		int total_ltr = sc.nextInt();
		for(int i=0 ; i<total_ltr; i++)
		{
			literal_table[i]=new obj("",0);
			System.out.println("ENTER LITERAL NAME : ");
			literal_table[i].name=sc.next();
			System.out.println("ENTER LITERAL ADDRESS : ");
			literal_table[i].addr=sc.nextInt();
		}
		
		System.out.println("\n*************************************SYMBOL TABLE*************************************");
		System.out.println("\nSYMBOL\tADDRESS");
		for(int i=0;i<total_symb;i++)
			System.out.println(symb_table[i].name+"\t"+symb_table[i].addr);
		
		System.out.println("\n*************************************LITERAL TABLE*************************************");
	    System.out.println("\nIndex\tLITERAL\tADDRESS");
	    for(int i=0;i<total_ltr;i++)
	    	System.out.println((i+1) +"\t"+literal_table[i].name+"\t"+literal_table[i].addr);
	     
		BufferedReader br2=new BufferedReader(new FileReader("Output2.txt"));
	 	String line;
	 	boolean symbol_error=false,undef_mnemonic=false;
	 	System.out.println("\n***********************OUTPUT FILE**************************\n\n");
	 	while((line = br2.readLine())!=null)
	 	{
	 		String[] token_list=line.split("\\s+",5);
	 		symbol_error=undef_mnemonic=false;
	 		for(String token:token_list)
	 		{
	 			if(token.length()>0)
	 			{
		 			pos = -1;
		 			if(token.matches("---"))
		 			{
		 				System.out.print("\t---");
						undef_mnemonic=true;
		 			}
		 			else if(token.matches("[0-9]+"))
		 				System.out.print("\n\n"+token);
		 			else
		 			{
		 				String letters = token.replaceAll("[^A-Za-z]+", "");
			 			num = Integer.parseInt(token.replaceAll("[^0-9]+", ""));
			 			
			 			if(token.matches("\\([0-9]+\\)"))
			 				System.out.print("\t"+num);
			 			else
			 			{
			 				switch (letters.toUpperCase()) {
								case "S" : if(symb_table[num-1].addr==0)
											{
												System.out.print("\t---");
												symbol_error=true;
											}
											else
												System.out.print("\tS_"+symb_table[num-1].addr);
											break;
								case "L" : System.out.print("\tL_"+literal_table[num-1].addr);
									break;
								case "C" : System.out.print("\tC_"+num);
									break;
								default: System.out.print("\t"+letters+"_000"+num);
							}
			 			}
		 			}		 			
	 			}
	 		}
	 		if(symbol_error)	 			
	 			System.out.print("\n\n******************************SYMBOL IS NOT DEFINED******************************");
	 		if(undef_mnemonic)
	 			System.out.print("\n\n******************************INVALID MNEMONIC ******************************");
	 	}
	 	int[] flag=new int[total_symb];
	 	for(int i=0;i<total_symb;i++)
	 	{
	 		symb_found=0;
			for(int j=0;j<total_symb;j++)
				if(symb_table[i].name.equalsIgnoreCase(symb_table[j].name) && flag[j]==0)
				{
					symb_found++;
					flag[i]=flag[j]=1;
				}
			if(symb_found>1)
				System.out.print("\n\n****************************** '"+symb_table[i].name+"' IS DUPLICATE SYMBOL******************************");
	 	}
	}
}


/*
mca17@mca17-desktop:~/mayur/Group A/SPOS2/src$ java spos2 
ENTER TOTAL NUMBER OF SYMBOLS : 
6
ENTER SYMBOL NAME : 
up
ENTER SYMBOL ADDRESS : 
102
ENTER SYMBOL NAME : 
a
ENTER SYMBOL ADDRESS : 
109
ENTER SYMBOL NAME : 
b
ENTER SYMBOL ADDRESS : 
110
ENTER SYMBOL NAME : 
c
ENTER SYMBOL ADDRESS : 
0
ENTER SYMBOL NAME : 
next
ENTER SYMBOL ADDRESS : 
102
ENTER SYMBOL NAME : 
a
ENTER SYMBOL ADDRESS : 
114

5
ENTER LITERAL NAME : 
 ='5'
ENTER LITERAL ADDRESS : 
102
ENTER LITERAL NAME : 
='8'
ENTER LITERAL ADDRESS : 
105
ENTER LITERAL NAME : 
='8'
ENTER LITERAL ADDRESS : 
106
ENTER LITERAL NAME : 
='7'
ENTER LITERAL ADDRESS : 
114
ENTER LITERAL NAME : 
='8'
ENTER LITERAL ADDRESS : 
115

*************************************SYMBOL TABLE*************************************

SYMBOL	ADDRESS
up	102
a	109
b	110
c	0
next	102
a	114

*************************************LITERAL TABLE*************************************

Index	LITERAL	ADDRESS
1	='5'	102
2	='8'	105
3	='8'	106
4	='7'	114
5	='8'	115

***********************OUTPUT FILE**************************


	AD_0001	C_100

100	---	1	C_5

******************************INVALID MNEMONIC ******************************

101	IS_0001	2	C_10

102	S_102	IS_0003	1	2

103	IS_0002	S_109	L_102

104	IS_0006	1	S_102

105	AD_0003	S_102

102	DL_0001	L_102

103	IS_0002	S_110	L_105

104	IS_0002	---	L_106

******************************SYMBOL IS NOT DEFINED******************************

105	DL_0001	L_105

106	DL_0001	L_106

107	IS_0002	S_109	L_114

108	IS_0002	S_110	L_115

109	DL_0001	S_102	C_2

110	DL_0002	S_109	C_10

111	DL_0001	S_102	C_9

112	S_102	AD_0005	S_102

113	AD_0002

****************************** 'a' IS DUPLICATE SYMBOL******************************mca17@mca17-desktop:~/mayur/Group A/SPOS2/src$ 


*/
