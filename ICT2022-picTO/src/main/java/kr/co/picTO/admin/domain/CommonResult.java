package kr.co.picTO.admin.domain;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class CommonResult {

    @ApiModelProperty(value = "Response Result : T/F")
    private boolean success;

    @ApiModelProperty(value = "Response Code : >= 0 Success, < 0 Failed")
    private int code;

    @ApiModelProperty(value = "Response Message")
    private String msg;
}
