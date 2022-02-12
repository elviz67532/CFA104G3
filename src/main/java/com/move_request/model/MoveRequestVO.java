package com.move_request.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import lombok.Data;

@Data
public class MoveRequestVO implements Serializable {
	private Integer id;
	private Integer memberId;
	private String fromAddress;
	private String toAddress;
	private Timestamp evaluateDate;
	private String items;
	private Integer evaluatePrice;
	private Timestamp moveDate;
	private Integer evaluateType;
	private Timestamp requestDate;
	private int status;
	private Boolean handled;
}
