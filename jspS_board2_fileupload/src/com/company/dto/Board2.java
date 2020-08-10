package com.company.dto;

public class Board2 {
	int bno=0;
	String bname="";
	String bpass="";
	String btitle="";
	String bcontent="";
	String bip="";
	String bdate="";
	int bhit=0;
	String bfile="";
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBpass() {
		return bpass;
	}
	public void setBpass(String bpass) {
		this.bpass = bpass;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBip() {
		return bip;
	}
	public void setBip(String bip) {
		this.bip = bip;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	public Board2() {
		// TODO Auto-generated constructor stub
	}
	public Board2(int bno, String bname, String btitle, String bcontent) {
		this.bno = bno;
		this.bname = bname;
		this.btitle = btitle;
		this.bcontent = bcontent;
	}

	public Board2(int bno, String btitle, String bname, String bdate, int bhit) {
		this.bno = bno;
		this.btitle = btitle;
		this.bname = bname;
		this.bdate = bdate;
		this.bhit = bhit;
	}
	public Board2(int bno, String btitle, String bname, String bdate, int bhit, String bfile) {
		this.bno = bno;
		this.btitle = btitle;
		this.bname = bname;
		this.bdate = bdate;
		this.bhit = bhit;
		this.bfile = bfile;
	}
	
}
