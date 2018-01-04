package com.yulu.mangger.bean;

public class CollectsCustom extends Collects {

	private Collects collects;

	private String contect;

	private String title;

	private Integer sort;

	public Collects getCollects() {
		return collects;
	}

	public void setCollects(Collects collects) {
		this.collects = collects;
	}

	public String getContect() {
		return contect;
	}

	public void setContect(String contect) {
		this.contect = contect;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
}
