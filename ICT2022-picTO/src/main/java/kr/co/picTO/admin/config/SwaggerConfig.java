package kr.co.picTO.admin.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
public class SwaggerConfig {

    private ApiInfo commonInfo() {
        return new ApiInfoBuilder().title("ICT-2022 PICTO API")
                .description("앱 서버 API 설명을 위한 문서입니다.")
                .version("1.0")
                .build();
    }

    @Bean
    public Docket allApi() {
        return new Docket(DocumentationType.OAS_30)
                .apiInfo(commonInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("kr.co.picTO.*.controller"))
                .paths(PathSelectors.any())
                .build();
    }
}
