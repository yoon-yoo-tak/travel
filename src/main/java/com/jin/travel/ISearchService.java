package com.jin.travel;

import java.util.List;

public interface ISearchService {

	List<Detail> selectSearch(String searchTxt);

}
