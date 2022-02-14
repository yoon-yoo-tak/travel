package com.jin.travel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ISearchServiceImpl implements ISearchService{
@Autowired ISearchDAO iSearchDao;
	@Override
	public List<Detail> selectSearch(String searchTxt) {
		List<Detail> detail=iSearchDao.selectSearch(searchTxt);
	 return detail;
		
	}

}
