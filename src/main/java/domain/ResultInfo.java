package domain;

import java.io.Serializable;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/11 21:12
 * @Description: 用于封装后端返回前端数据对象
 */
public class ResultInfo implements Serializable {

    private boolean flag;           //后端返回结果正常为true，发生异常返回false
    private Object data;            //后端返回结果数据对象
    private String errorMsg;        //发生异常的错误消息

    public ResultInfo() {}

    public ResultInfo(boolean flag, Object data, String errorMsg) {
        this.flag = flag;
        this.data = data;
        this.errorMsg = errorMsg;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    @Override
    public String toString() {
        return "返回结果信息{" +
                "后端返回结果=" + flag +
                ", 后端返回结果数据对象=" + data +
                ", 发生异常的错误消息='" + errorMsg + '\'' +
                '}';
    }
}
