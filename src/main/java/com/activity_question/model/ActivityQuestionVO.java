package com.activity_question.model;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ActivityQuestionVO implements Serializable {
	private Integer id;
	private Integer activityId;
	private Integer memberId;
	private String problem;
	private String reply;
	private Timestamp problemDate;
	private Timestamp replyDate;
}
