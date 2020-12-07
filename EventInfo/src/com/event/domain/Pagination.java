package com.event.domain;


public class Pagination {
	// ������ �� �������� �Խñ��� �ִ� ����
    private int pageSize = 0;
    //����¡�� ��ư�� ���� �ִ� ����
    private int blockSize = 3;
    //���� ������
    private int page = 1;
    //���� ��
    private int block = 1;
    //�� �Խñ� ��
    private int totalListCnt;
    //�� ������ ��
    private int totalPageCnt;
    //�� �� ��
    private int totalBlockCnt;
    //�� ���� ������
    private int startPage = 1;
    //�� ������ ������
    private int endPage = 1;
    //���� ���� ������ ������
    private int preBlock;
    //���� ���� ���� ������
    private int nextBlock;
    //DB���� ��𼭺��� select����
    private int startIndex = 0;
    //DB����  ������ select����
    private int endIndex = 0;
    
    public Pagination(int totalListCnt, int page, int writePageSize){
    	setPageSize(writePageSize); 
    	
    	setPage(page);
    	setTotalListCnt(totalListCnt);
    	if(totalListCnt == 0) {
    		setEndPage(1);
    		setPage(1);
    		setTotalPageCnt(1);
    		return;
    	}
        //�� ������ ��
        setTotalPageCnt((int) Math.ceil((double)(totalListCnt) / pageSize));
        //�� ����
        setTotalBlockCnt((int)Math.ceil((double)(totalPageCnt)/ blockSize));
        //���� ���
        setBlock((int)Math.ceil((double)(page) / blockSize));
        //��� ����������
        setStartPage((block - 1) * blockSize + 1);
        //��� ������������
        setEndPage(startPage + blockSize - 1);
        //��� �������������� ������ ���������� �����Ƿ�
        if(totalPageCnt < endPage) this.endPage = totalPageCnt;
        //���� ��(Ŭ���� ���� ����� �������������� �����;ߵ� ex 11~20���� ���� Ŭ���� 10�� �����;ߵ�)
        setPreBlock(((block - 1) * blockSize));
        //1���� ���� ����� ������ ������ ���Ƿ�
        if(preBlock < 1) this.preBlock = 1;
        //���� ��(Ŭ���� ������ ù��° �������� �ҷ��;ߵ�)
        setNextBlock((block * blockSize) + 1);
        //���� ���� �����µ� ��ü ���������� ��������
        if(nextBlock > totalPageCnt) this.nextBlock = totalPageCnt;
        //DB select start index 
    	setStartIndex(((page-1) * writePageSize) + 1);
    	//DB select end index
    	setEndIndex(page * writePageSize);
    }
    
    public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getBlock() {
		return block;
	}
	public void setBlock(int block) {
		this.block = block;
	}
	public int getTotalListCnt() {
		return totalListCnt;
	}
	public void setTotalListCnt(int totalListCnt) {
		this.totalListCnt = totalListCnt;
	}
	public int getTotalPageCnt() {
		return totalPageCnt;
	}
	public void setTotalPageCnt(int totalPageCnt) {
		this.totalPageCnt = totalPageCnt;
	}
	public int getTotalBlockCnt() {
		return totalBlockCnt;
	}
	public void setTotalBlockCnt(int totalBlockCnt) {
		this.totalBlockCnt = totalBlockCnt;
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
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getPreBlock() {
		return preBlock;
	}
	public void setPreBlock(int preBlock) {
		this.preBlock = preBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
}
