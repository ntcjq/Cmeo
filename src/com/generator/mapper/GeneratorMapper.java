package com.generator.mapper;

import java.util.List;
import java.util.Map;
import com.entity.Generator;

public interface GeneratorMapper {

	/**
	 * 查询所有机房信息 
	 * @return
	 */
	public List<Generator> selectAllGenerators();
	/**
	 * 查询某个机房信息
	 * @param id
	 * @return
	 */
	public Generator selectOneGenerator(int id);
	/**
	 * 添加机房
	 * @param generator
	 * @return
	 */
	public int addGenerator(Generator generator);
	/**
	 * 更新机房信息
	 * @param generator
	 * @return
	 */
	public int updateGenerator(Generator generator);
	/**
	 * 删除机房信息
	 * @param list
	 * @return
	 */
	public int deleteGenerator(List<String> list);
	
	/**
	 * 动态查询机房信息
	 * @param emp
	 * @return
	 */
	public List<Generator> selectGeneratorListByConditions(Map<String,Object> map);
}
