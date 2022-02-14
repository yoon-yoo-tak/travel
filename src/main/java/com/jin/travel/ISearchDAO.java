package com.jin.travel;

import java.util.List;

public interface ISearchDAO {

	List<Detail> selectSearch(String searchTxt);

}
