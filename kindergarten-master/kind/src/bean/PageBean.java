package bean;

import java.util.List;

public class PageBean {

    //指定的或是页面参数
    private Integer currentPage;//当前页
    private Integer pageSize;//每页显示多少条

    //查询数据库
    private Integer recordCount;//总记录数
    private List recordList;//本页的数据列表

    //计算
    private Integer pageCount;//总页数
    private Integer beginPageIndex;//页码列表的开始索引
    private Integer endPageIndex;//页码列表的结束索引

    /**
     * 只接受前4个必要的属性，会自动计算出其他3个属性的值
     *
     * @param currentPage
     * @param pageSize
     * @param recordCount
     * @param recordList
     */
    public PageBean(Integer currentPage, Integer pageSize, Integer recordCount, List recordList, Integer pageIndexNum) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.recordCount = recordCount;
        this.recordList = recordList;

        //计算总页码
        pageCount = (recordCount + pageSize - 1) / pageSize;
        //计算beginPageIndex 和 endPageIndex
        //>>总页数不多于10页，则全部显示
        if (pageCount <= pageIndexNum) {
            beginPageIndex = 1;
            endPageIndex = pageCount;
        }
        //总页数多于10页，则显示当前页附近的共10个页码
        else {
            //当前页附近的共10个页码（前4个+当前页+后5个）
            beginPageIndex = currentPage - pageIndexNum / 2;
            endPageIndex = currentPage + pageIndexNum / 2;

            //当前面的页码不足4个时，则显示前10个页码
            if (beginPageIndex < 1) {
                beginPageIndex = 1;
                endPageIndex = pageIndexNum;
            }
            //当后面的页码不足5个时，则显示后10个页码
            if (endPageIndex > pageCount) {
                endPageIndex = pageCount;
                beginPageIndex = pageCount - pageIndexNum + 1;
            }
        }
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(Integer recordCount) {
        this.recordCount = recordCount;
    }

    public List getRecordList() {
        return recordList;
    }

    public void setRecordList(List recordList) {
        this.recordList = recordList;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public Integer getBeginPageIndex() {
        return beginPageIndex;
    }

    public void setBeginPageIndex(Integer beginPageIndex) {
        this.beginPageIndex = beginPageIndex;
    }

    public Integer getEndPageIndex() {
        return endPageIndex;
    }

    public void setEndPageIndex(Integer endPageIndex) {
        this.endPageIndex = endPageIndex;
    }

}
