package com.itgd.parser;

import java.io.Serializable;

/**
 * Represents an item in an XML feed.
 * 
 * @author Santosh Jena
 */
public class XmlItem implements Serializable {
	String id = "";
	String name = "";
	String current_value = "";
	String value_change = "";
	String percentage_change = "";
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCurrent_value() {
		return current_value;
	}
	public void setCurrent_value(String currentValue) {
		current_value = currentValue;
	}
	public String getValue_change() {
		return value_change;
	}
	public void setValue_change(String valueChange) {
		value_change = valueChange;
	}
	public String getPercentage_change() {
		return percentage_change;
	}
	public void setPercentage_change(String percentageChange) {
		percentage_change = percentageChange;
	}
}
