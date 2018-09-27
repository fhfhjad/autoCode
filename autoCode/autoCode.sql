/*
Navicat MySQL Data Transfer

Source Server         : 47.94.101.239
Source Server Version : 50719
Source Host           : 47.94.101.239:3306
Source Database       : auto_code

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-09-27 17:02:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for back_user
-- ----------------------------
DROP TABLE IF EXISTS `back_user`;
CREATE TABLE `back_user` (
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of back_user
-- ----------------------------
INSERT INTO `back_user` VALUES ('admin', 'admin', '2014-06-24 10:12:49');

-- ----------------------------
-- Table structure for datasource_config
-- ----------------------------
DROP TABLE IF EXISTS `datasource_config`;
CREATE TABLE `datasource_config` (
  `dc_id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_class` varchar(50) DEFAULT NULL COMMENT '数据库驱动',
  `db_name` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `back_user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datasource_config
-- ----------------------------
INSERT INTO `datasource_config` VALUES ('13', 'com.mysql.jdbc.Driver', 'order', '47.94.101.239', '3306', 'root', 'b_kskhzov7Ot4', 'admin');
INSERT INTO `datasource_config` VALUES ('14', 'com.mysql.jdbc.Driver', 'user', '47.94.101.239', '3306', 'root', 'b_kskhzov7Ot4', 'admin');
INSERT INTO `datasource_config` VALUES ('15', 'com.mysql.jdbc.Driver', 'settlement', '47.94.101.239', '3306', 'root', 'b_kskhzov7Ot4', 'admin');
INSERT INTO `datasource_config` VALUES ('16', 'com.mysql.jdbc.Driver', 'ka_order', '47.94.101.239', '3306', 'root', 'b_kskhzov7Ot4', 'admin');
INSERT INTO `datasource_config` VALUES ('17', 'com.mysql.jdbc.Driver', 'statistics', '47.94.101.239', '3306', 'root', 'b_kskhzov7Ot4', 'admin');
INSERT INTO `datasource_config` VALUES ('18', 'com.mysql.jdbc.Driver', 'ka_user', '47.94.101.239', '3306', 'root', 'b_kskhzov7Ot4', 'admin');
INSERT INTO `datasource_config` VALUES ('19', 'com.mysql.jdbc.Driver', 'ka_accredit', '47.94.101.239', '3306', 'root', 'b_kskhzov7Ot4', 'admin');
INSERT INTO `datasource_config` VALUES ('20', 'com.mysql.jdbc.Driver', 'mall', '47.94.101.239', '3306', 'root', 'b_kskhzov7Ot4', 'admin');
INSERT INTO `datasource_config` VALUES ('21', 'com.mysql.jdbc.Driver', 'message', '47.94.101.239', '3306', 'root', 'b_kskhzov7Ot4', 'admin');

-- ----------------------------
-- Table structure for template_config
-- ----------------------------
DROP TABLE IF EXISTS `template_config`;
CREATE TABLE `template_config` (
  `tc_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `save_path` varchar(100) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `content` text,
  `back_user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tc_id`),
  KEY `f_backuser` (`back_user`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of template_config
-- ----------------------------
INSERT INTO `template_config` VALUES ('8', 'dayu_Model', 'model', 'java', '${context.javaBeanName}.java', 'package ${context.packageName}.model;\n\nimport java.util.Date;\n\nimport io.swagger.annotations.ApiModel;\nimport io.swagger.annotations.ApiModelProperty;\n\n/**\n  ${table.comment}\n*/\n@ApiModel(\"${context.javaBeanName}\")\npublic class ${context.javaBeanName} {\n#foreach($column in $columns)\n	\n    @ApiModelProperty(\"${column.comment}\")\n	private ${column.javaTypeBox} ${column.javaFieldName};  // ${column.comment}\n    \n#end\n\n#foreach(${column} in ${columns}) \n	public void set${column.javaFieldNameUF}(${column.javaTypeBox} ${column.javaFieldName}){\n		this.${column.javaFieldName} = ${column.javaFieldName};\n	}\n\n	public ${column.javaTypeBox} get${column.javaFieldNameUF}(){\n		return this.${column.javaFieldName};\n	}\n\n#end\n}', 'admin');
INSERT INTO `template_config` VALUES ('10', 'dayu_Service', 'service', 'java', '${context.javaBeanName}Service.java', 'package ${context.packageName}.service;\n\nimport java.util.List;\n\nimport ai.dayu.core.page.GenericPage;\nimport ai.dayu.core.response.Result;\nimport ${context.packageName}.vo.${context.javaBeanName}VO;\n\npublic interface ${context.javaBeanName}Service {\n\n    Result<${context.javaBeanName}VO> get${context.javaBeanName}(Long ${context.javaBeanNameLF}Id);\n\n    Result<List<${context.javaBeanName}VO>> find${context.javaBeanName}(${context.javaBeanName}VO ${context.javaBeanNameLF}VO);\n\n    Result<GenericPage<${context.javaBeanName}VO>> find${context.javaBeanName}ByPage(${context.javaBeanName}VO ${context.javaBeanNameLF}VO,int pageNo, int pageSize);\n\n    Result<Boolean> save${context.javaBeanName}(${context.javaBeanName}VO ${context.javaBeanNameLF}VO);\n\n    Result<Boolean> modify${context.javaBeanName}(${context.javaBeanName}VO ${context.javaBeanNameLF}VO);\n\n    Result<Boolean> remove${context.javaBeanName}(Long ${context.javaBeanNameLF}Id);\n\n}', 'admin');
INSERT INTO `template_config` VALUES ('12', 'dayu_Mybatis', 'dao', 'xml', '${context.javaBeanName}Mapper.xml', '#set($jq=\"$\")\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\n	\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n<mapper namespace=\"${context.packageName}.dao.${context.javaBeanName}Mapper\">\n    \n    <!-- 表-->\n    <sql id=\"TABLE\"><![CDATA[ ${table.tableName} ]]></sql>\n    \n    <resultMap id=\"BaseResultMap\" type=\"${context.packageName}.model.${context.javaBeanName}\">\n        #foreach($column in $columns)\n        #if( \"${column.comment}\" != \"\" )<!-- ${column.comment} -->#end\n        <result column=\"${column.columnName}\" property=\"${column.javaFieldName}\" jdbcType=\"${column.mybatisJdbcType}\" />\n        #end\n    </resultMap>\n    \n    <resultMap id=\"BaseResultMapVO\" type=\"${context.packageName}.vo.${context.javaBeanName}VO\">\n        #foreach($column in $columns)\n        #if( \"${column.comment}\" != \"\" )\n		<!-- ${column.comment} -->\n		#end\n        <result column=\"${column.columnName}\" property=\"${column.javaFieldName}\" jdbcType=\"${column.mybatisJdbcType}\" />\n        #end\n    </resultMap>\n    \n    \n    <!-- 所有查询列 -->\n	<sql id=\"Base_Column_List\">\n		<![CDATA[\n        #foreach($column in $columns)\n#if( $velocityCount != $columns.size() )\nt.`${column.columnName}` AS \'${column.javaFieldName}\',\n#end\n#if( $velocityCount == $columns.size() )\nt.`${column.columnName}` AS \'${column.javaFieldName}\'\n#end\n        #end\n]]>\n	</sql>\n    \n    <select id=\"selectByPrimaryKey\" resultMap=\"BaseResultMapVO\" parameterType=\"java.lang.Long\" >\n    select\n        <include refid=\"Base_Column_List\" />\n        from <include refid=\"TABLE\" /> t\n        where t.id = #{id}\n    </select>\n    \n    <delete id=\"deleteByPrimaryKey\" parameterType=\"java.lang.Long\" >\n    delete from <include refid=\"TABLE\" />\n        where id = #{id}\n    </delete>\n    \n    <insert id=\"insert\" parameterType=\"${context.packageName}.vo.${context.javaBeanName}VO\"  useGeneratedKeys=\"true\" keyProperty=\"id\">\n    insert into <include refid=\"TABLE\" /> (            \n          #foreach($column in $columns)\n            #if( $velocityCount != $columns.size() )\n`${column.columnName}`,#end\n            #if( $velocityCount == $columns.size() )\n`${column.columnName}`#end\n          #end\n        )\n        values (\n          #foreach($column in $columns)\n            #if( $velocityCount != $columns.size() )\n#{${column.javaFieldName}},#end\n            #if( $velocityCount == $columns.size() )\n#{${column.javaFieldName}}#end\n           #end\n        )\n        \n    </insert>\n\n    <update id=\"updateByPrimaryKey\" parameterType=\"${context.packageName}.model.${context.javaBeanName}\" \n    >\n        update <include refid=\"TABLE\" /> t\n        <include refid=\"UPDATE_COLUMN_SET\"/>\n        where t.id = #{id}\n    </update>\n\n    <select id=\"select${context.javaBeanName}List\" parameterType=\"${context.packageName}.model.${context.javaBeanName}\"\n    resultMap=\"BaseResultMapVO\">\n        select <include refid=\"Base_Column_List\" />\n        from <include refid=\"TABLE\" /> t\n        <include refid=\"QUERY_WHERE_CLAUSE\"/>\n    </select>\n\n    <!-- 更新列字段,只要不为NULL则更新,除开主键列 -->\n    <sql id=\"UPDATE_COLUMN_SET\">\n        <set> \n            #foreach($column in $columns)<if test=\"${column.javaFieldName} != null\"><![CDATA[ t.`${column.columnName}` = #{${column.javaFieldName}},]]></if>\n        	#end\n</set>\n    </sql>\n\n    <!-- 全部条件(更多功能可以通过queryData扩展实现)  -->\n    <sql id=\"QUERY_WHERE_CLAUSE\">\n        <where> \n            #foreach($column in $columns)<if test=\"${column.javaFieldName} != null and ${column.javaFieldName} != \'\'\"><![CDATA[AND t.`${column.columnName}` = #{${column.javaFieldName}}]]></if>\n            #end\n</where>\n    </sql>\n    \n</mapper>', 'admin');
INSERT INTO `template_config` VALUES ('14', 'dayu_Controller', 'controller', 'java', '${context.javaBeanName}Controller.java', 'package ${context.packageName}.controller;\n\nimport org.springframework.beans.factory.annotation.Autowired;\nimport org.springframework.cloud.context.config.annotation.RefreshScope;\nimport org.springframework.web.bind.annotation.CrossOrigin;\nimport org.springframework.web.bind.annotation.PathVariable;\nimport org.springframework.web.bind.annotation.RequestBody;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RequestMethod;\nimport org.springframework.web.bind.annotation.RequestParam;\nimport org.springframework.web.bind.annotation.RestController;\n\nimport ai.dayu.core.page.GenericPage;\nimport ai.dayu.core.response.Result;\nimport ${context.packageName}.service.${context.javaBeanName}Service;\nimport ${context.packageName}.vo.${context.javaBeanName}VO;\nimport io.swagger.annotations.Api;\nimport io.swagger.annotations.ApiImplicitParam;\nimport io.swagger.annotations.ApiImplicitParams;\nimport io.swagger.annotations.ApiOperation;\n\n\n@Api(value = \"api\", tags = \"${context.javaBeanName}\")\n@CrossOrigin\n@RefreshScope\n@RestController\n@RequestMapping(\"/${context.javaBeanNameLF}\")\npublic class ${context.javaBeanName}Controller {\n\n    @Autowired\n    private ${context.javaBeanName}Service ${context.javaBeanNameLF}Service;\n\n    /**\n	 * 查询单个数据\n	 *\n	 * @param id\n	 * @return\n	 */\n	@ApiOperation(value = \"获取信息\", httpMethod=\"GET\",notes=\"查询单个信息数据\")\n	@ApiImplicitParams({\n        @ApiImplicitParam(name = \"id\",required = true, value = \"id\",paramType =\"path\",dataType=\"int\"),\n    })\n	@RequestMapping(value = \"/{id}\", method = RequestMethod.GET)\n	public Result<${context.javaBeanName}VO> queryById(@PathVariable(\"id\") Long id) {\n		return ${context.javaBeanNameLF}Service.get${context.javaBeanName}(id);\n	}\n\n	/**\n	 * 分页查询\n	 *\n	 * @param ${context.javaBeanName}VO 查询条件\n	 * @param pageNo 当前页\n	 * @param pageSize 每页多少条\n	 * @return\n	 */\n	@RequestMapping(method = RequestMethod.GET)\n	public Result<GenericPage<${context.javaBeanName}VO>> queryByPage(${context.javaBeanName}VO ${context.javaBeanNameLF}VO,\n	                                                            @RequestParam(value = \"page\", defaultValue = \"1\") int pageNo,\n			                                                    @RequestParam(value = \"pageSize\", defaultValue = \"10\") int pageSize) {\n		return ${context.javaBeanNameLF}Service.find${context.javaBeanName}ByPage(${context.javaBeanNameLF}VO, pageNo, pageSize);\n	}\n\n	/**\n	 * 保存数据\n	 *\n	 * @param ${context.javaBeanNameLF}VO\n	 * @return\n	 */\n	@RequestMapping(method = RequestMethod.POST, produces = \"application/json;charset=utf-8\")\n	public Result<Boolean> save(@RequestBody ${context.javaBeanName}VO ${context.javaBeanNameLF}VO) {\n		return ${context.javaBeanNameLF}Service.save${context.javaBeanName}(${context.javaBeanNameLF}VO);\n	}\n\n	/**\n	 * 修改数据\n	 *\n	 * @param ${context.javaBeanNameLF}VO\n	 * @return\n	 */\n	@RequestMapping(method = RequestMethod.PUT, produces = \"application/json;charset=utf-8\")\n	public Result<Boolean> modify(@RequestBody ${context.javaBeanName}VO ${context.javaBeanNameLF}VO) {\n		return ${context.javaBeanNameLF}Service.modify${context.javaBeanName}(${context.javaBeanNameLF}VO);\n	}\n\n	/**\n	 * 删除数据\n	 *\n	 * @param id\n	 * @return\n	 */\n	@RequestMapping(value = \"/{id}\", method = RequestMethod.DELETE)\n	public Result<Boolean> remove(@PathVariable(\"id\") Long id) {\n		return ${context.javaBeanNameLF}Service.remove${context.javaBeanName}(id);\n	}\n\n}\n', 'admin');
INSERT INTO `template_config` VALUES ('39', 'dayu_vo', 'vo', 'java', '${context.javaBeanName}VO.java', 'package ${context.packageName}.vo;\n\nimport java.util.Date;\n\nimport io.swagger.annotations.ApiModel;\nimport io.swagger.annotations.ApiModelProperty;\n\n/**\n  ${table.comment}\n*/\n@ApiModel(\"${context.javaBeanName}VO\")\npublic class ${context.javaBeanName}VO {\n#foreach($column in $columns)\n	\n    @ApiModelProperty(\"${column.comment}\")\n	private ${column.javaTypeBox} ${column.javaFieldName};  // ${column.comment}\n    \n#end\n\n#foreach(${column} in ${columns}) \n	public void set${column.javaFieldNameUF}(${column.javaTypeBox} ${column.javaFieldName}){\n		this.${column.javaFieldName} = ${column.javaFieldName};\n	}\n\n	public ${column.javaTypeBox} get${column.javaFieldNameUF}(){\n		return this.${column.javaFieldName};\n	}\n\n#end\n}\n', 'admin');
INSERT INTO `template_config` VALUES ('40', 'dayu_ServiceImpl', 'service/impl', 'java', '${context.javaBeanName}ServiceImpl.java', 'package ${context.packageName}.service.impl;\n\nimport java.util.List;\n\nimport org.springframework.beans.BeanUtils;\nimport org.springframework.beans.factory.annotation.Autowired;\nimport org.springframework.stereotype.Service;\n\nimport com.github.pagehelper.PageHelper;\nimport com.github.pagehelper.PageInfo;\n\nimport ai.dayu.core.page.GenericPage;\nimport ai.dayu.core.response.Result;\nimport ai.dayu.core.response.Results;\nimport ${context.packageName}.dao.${context.javaBeanName}Mapper;\nimport ${context.packageName}.model.${context.javaBeanName};\nimport ${context.packageName}.service.${context.javaBeanName}Service;\nimport ${context.packageName}.vo.${context.javaBeanName}VO;\n\n@Service\npublic class ${context.javaBeanName}ServiceImpl implements ${context.javaBeanName}Service {\n\n    @Autowired\n    private ${context.javaBeanName}Mapper ${context.javaBeanNameLF}Mapper;\n\n\n    public Result<GenericPage<${context.javaBeanName}VO>> find${context.javaBeanName}ByPage(${context.javaBeanName}VO\n                                                        ${context.javaBeanNameLF}VO, int pageNo, int pageSize) {\n        PageHelper.startPage(pageNo, pageSize);\n        List<${context.javaBeanName}VO> list=${context.javaBeanNameLF}Mapper.select${context.javaBeanName}List(${context.javaBeanNameLF}VO);\n        PageInfo<${context.javaBeanName}VO> pageInfo = new PageInfo<>(list);\n        GenericPage<${context.javaBeanName}VO> page = new GenericPage<>(pageSize, pageInfo.getTotal(), list);\n        return Results.success(page);\n    }\n\n    @Override\n    public Result<${context.javaBeanName}VO> get${context.javaBeanName}(Long ${context.javaBeanNameLF}Id) {\n        return Results.success(${context.javaBeanNameLF}Mapper.selectByPrimaryKey(${context.javaBeanNameLF}Id));\n    }\n\n    @Override\n    public Result<List<${context.javaBeanName}VO>> find${context.javaBeanName}(${context.javaBeanName}VO ${context.javaBeanNameLF}VO) {\n        return Results.success(${context.javaBeanNameLF}Mapper.select${context.javaBeanName}List(${context.javaBeanNameLF}VO));\n    }\n\n    @Override\n    public Result<Boolean> save${context.javaBeanName}(${context.javaBeanName}VO ${context.javaBeanNameLF}VO) {\n        ${context.javaBeanName} ${context.javaBeanNameLF} = new ${context.javaBeanName}();\n        BeanUtils.copyProperties(${context.javaBeanNameLF}VO,${context.javaBeanNameLF});\n        ${context.javaBeanNameLF}Mapper.insert(${context.javaBeanNameLF});\n        return Results.success(true);\n    }\n\n    @Override\n    public Result<Boolean> modify${context.javaBeanName}(${context.javaBeanName}VO ${context.javaBeanNameLF}VO) {\n        ${context.javaBeanName} ${context.javaBeanNameLF} = new ${context.javaBeanName}();\n        BeanUtils.copyProperties(${context.javaBeanNameLF}VO,${context.javaBeanNameLF});\n        ${context.javaBeanNameLF}Mapper.updateByPrimaryKey(${context.javaBeanNameLF});\n        return Results.success(true);\n    }\n\n    @Override\n    public Result<Boolean> remove${context.javaBeanName}(Long ${context.javaBeanNameLF}Id) {\n        //${context.javaBeanNameLF}Mapper.deleteByPrimaryKey(${context.javaBeanNameLF}Id);\n        return Results.success(true);\n    }\n}', 'admin');
INSERT INTO `template_config` VALUES ('41', 'dayu_Mapper', 'dao', 'java', '${context.javaBeanName}Mapper.java', 'package ${context.packageName}.dao;\n\nimport java.util.List;\n\nimport ${context.packageName}.model.${context.javaBeanName};\nimport ${context.packageName}.vo.${context.javaBeanName}VO;\n\npublic interface ${context.javaBeanName}Mapper {\n\n    int deleteByPrimaryKey(Long id);\n\n    int insert(${context.javaBeanName} ${context.javaBeanNameLF});\n\n    ${context.javaBeanName}VO selectByPrimaryKey(Long id);\n\n    int updateByPrimaryKey(${context.javaBeanName} ${context.javaBeanNameLF});\n\n    List<${context.javaBeanName}VO> select${context.javaBeanName}List(${context.javaBeanName}VO ${context.javaBeanNameLF}VO);\n\n}', 'admin');
