package com.generator.service.impl;

import java.util.List;
import java.util.Map;

import com.entity.Generator;
import com.generator.mapper.GeneratorMapper;
import com.generator.service.GeneratorService;

public class GeneratorServiceImpl implements GeneratorService{

	
	private GeneratorMapper generatorMapper;
	public void setGeneratorMapper(GeneratorMapper generatorMapper) {
		this.generatorMapper = generatorMapper;
	}

	public List<Generator> selectAllGenerators() {
		return generatorMapper.selectAllGenerators();
	}

	@Override
	public Generator selectOneGenerator(int id) {
		return generatorMapper.selectOneGenerator(id);
	}

	public boolean addGenerator(Generator generator) {
		int flag = generatorMapper.addGenerator(generator);
		if(flag > 0)
			return true;
		else
			return false;
	}

	public boolean updateGenerator(Generator generator) {
		int flag = generatorMapper.updateGenerator(generator);
		if(flag > 0)
			return true;
		else
			return false;
	}

	public boolean deleteGenerator(List<String> list) {
		int flag = generatorMapper.deleteGenerator(list);
		if(flag > 0)
			return true;
		else
			return false;
	}

	public List<Generator> selectGeneratorListByConditions(
			Map<String, Object> map) {
		return generatorMapper.selectGeneratorListByConditions(map);
	}

}
