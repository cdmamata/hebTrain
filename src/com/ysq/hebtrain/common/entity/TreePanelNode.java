package com.ysq.hebtrain.common.entity;

/**
 * 适用于任何 treePanel 的节点类
 * @author Administrator
 *
 */
public class TreePanelNode {
	private String id;  //树节点id
	private String text;  //树节点名称
	private boolean leaf;  //是否是叶子节点
	private String cls;  //节点样式
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	public String getCls() {
		return cls;
	}
	public void setCls(String cls) {
		this.cls = cls;
	}
}
