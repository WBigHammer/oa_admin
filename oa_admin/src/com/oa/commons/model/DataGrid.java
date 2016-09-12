/**  
 * @Title: DataGrid.java
 * @date 2013-8-28 下午10:54:14
 * @Copyright: 2013 
 */
package com.oa.commons.model;

import java.util.List;

/**
 * easyui 分页查询数据表格返回的结果
 * @author	LiuJincheng
 * @version	 1.0
 *
 */
public class DataGrid<T> implements java.io.Serializable{
	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	/**
	 * 总条数
	 */
	private Long total;// 总记录数
	/**
	 * 查询数据集合
	 */
	private List<T> rows;
	/**
	 * 表格底部显示的信息,固定在底部
	 * 列名和数据列名相同
	 */
	private List<T> footer;
	
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public List<T> getFooter() {
		return footer;
	}
	public void setFooter(List<T> footer) {
		this.footer = footer;
	}
	
}
