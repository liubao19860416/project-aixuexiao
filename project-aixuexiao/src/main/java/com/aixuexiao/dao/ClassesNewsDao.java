package com.aixuexiao.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.aixuexiao.model.ClassesNews;

@Component("classesNewsDao")
public class ClassesNewsDao extends BaseDao {

    public List<ClassesNews> findClassesNewsByClassId(int classid, int limit) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("classid", classid);
        map.put("limit", limit);
        return this.readSqlSession.selectList(
                "com.aixuexiao.dao.ClassesNewsDao.selectClassesNewsByClassId",
                map);
    }

    public int addClassesNews(ClassesNews classesNews) {
       return writerSqlSession.insert(
                "com.aixuexiao.dao.ClassesNewsDao.addClassesNews", classesNews);
    }

    public int deleteClassesNewsById(int id) {
        return writerSqlSession.delete(
                "com.aixuexiao.dao.ClassesNewsDao.deleteClassesNewsById", id);
    }

}
