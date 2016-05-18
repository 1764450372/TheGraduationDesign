package tools;

import java.util.List;

public class SearchResult<T> {
    private Integer totalcount;//������
    private List<T> list;//����
    private Integer nowpage;//��ǰҳ
    @SuppressWarnings("unused")
	private Integer totalPage;//��ҳ��
    private Integer numPerPage;//ÿҳ��ʾ������
    
	public Integer getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(Integer numPerPage) {
		this.numPerPage = numPerPage;
	}
	public Integer getTotalPage() {
		return totalcount%numPerPage==0?totalcount/numPerPage:totalcount/numPerPage+1;
	}
	
	public Integer getNowpage() {
		return nowpage;
	}
	public void setNowpage(Integer nowpage) {
		this.nowpage = nowpage;
	}
	public Integer getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(Integer totalcount) {
		this.totalcount = totalcount;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
}
