package kr.co.picTO.admin.domain;

import lombok.Data;

@Data
public class SingleResult<T> extends CommonResult {

    private T data;
}
