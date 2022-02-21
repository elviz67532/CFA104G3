package com.activity_attend.model;

import com.activity.model.ActivityVO;

import core.DualKey;
import core.dao.CoreDao;

public interface ActivityAttendDAO extends CoreDao<ActivityAttendVO, DualKey<Integer, Integer>> {
}

