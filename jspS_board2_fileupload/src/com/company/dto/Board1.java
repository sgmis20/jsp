package com.company.dto;

public class Board1 {
	public int bno;
	public String bname;
	public String bpass;
	public String btitle;
	public String bcontent;
	public String bip;
	public String bdate;
	public int bhit;

	@Override
	public String toString() {
		return "DTO [bno=" + bno + ", bname=" + bname + ", bpass=" + bpass + ", btitle=" + btitle + ", bcontent="
				+ bcontent + ", bip=" + bip + ", bdate=" + bdate + ", bhit=" + bhit + ", getBno()=" + getBno()
				+ ", getBname()=" + getBname() + ", getBpass()=" + getBpass() + ", getBtitle()=" + getBtitle()
				+ ", getBcontent()=" + getBcontent() + ", getBip()=" + getBip() + ", getBdate()=" + getBdate()
				+ ", getBhit()=" + getBhit() + "]";
	}

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

	public Board1() {
	}

	public Board1(int bno, String bname, String btitle, String bcontent) {
		this.bno = bno;
		this.bname = bname;
		this.btitle = btitle;
		this.bcontent = bcontent;
	}

	public Board1(int bno, String btitle, String bname, String bdate, int bhit) {
		this.bno = bno;
		this.btitle = btitle;
		this.bname = bname;
		this.bdate = bdate;
		this.bhit = bhit;
	}

}
