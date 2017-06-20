package com.dgit.domain;

import java.io.UnsupportedEncodingException;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;// 전체게시물갯수
	private int startPage;// 시작페이지 번호
	private int endPage;// 끝페이지번호
	private boolean prev;// 이전유무
	private boolean next;// 다음유무
	private int displayPageNum = 5;// 보여지는 페이지번호갯수
	private Criteria cri;// 화면에 보여지는 게시물정보

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}

	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery (int page){
		UriComponents uri = UriComponentsBuilder.newInstance()
										.queryParam("page", page)
										.queryParam("perPageNum", cri.getPerPageNum())
										.build();
		return uri.toUriString(); //?page=1&perPageNum=10 알아서만들어줌
	}
	
	public String makeSearch (int page) throws UnsupportedEncodingException{
		UriComponents uri = UriComponentsBuilder.newInstance()
										.queryParam("page", page)
										.queryParam("perPageNum", cri.getPerPageNum())
										//.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
										//.queryParam("keyword", URLEncoder.encode(((SearchCriteria)cri).getKeyword(),"utf-8"))
										//.queryParam("keyword", ((SearchCriteria)cri).getKeyword())
										.build();
		return uri.toUriString(); //?page=1&perPageNum=10 알아서만들어줌 &searchType=n&keyword=어쩌구
	}
}
