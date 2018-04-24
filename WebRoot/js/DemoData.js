// JavaScript Document
var demoData = {
	department_List:[
		{"department.ID":"100001","department.Name":"人事部门","department.Admin":"张三"},
		{"department.ID":"100002","department.Name":"后勤部门","department.Admin":"李四海"},
		{"department.ID":"100003","department.Name":"财务部门","department.Admin":"钱多多"}
	],
	department_Info:[
		{"department.ID":"000001","department.Name":"人事部门","department.Admin":"张三","department.Tel":"0513-8888888","department.Mobile":"0123456789","department.E-fax":"086-512-57312110-6436 ","department.Remarks":" "}	 
    ],
	GeneratorRoom_List:[
		{"GeneratorRoom.ID":"200001","GeneratorRoom.name":"机房一","GeneratorRoom.manager":"张三","GeneratorRoom.Department":"人事部门"},
		{"GeneratorRoom.ID":"200002","GeneratorRoom.name":"机房二","GeneratorRoom.manager":"李四海","GeneratorRoom.Department":"后勤部门"},
		{"GeneratorRoom.ID":"200003","GeneratorRoom.name":"机房三","GeneratorRoom.manager":"钱多多","GeneratorRoom.Department":"财务部门"},
		{"GeneratorRoom.ID":"200004","GeneratorRoom.name":"机房四","GeneratorRoom.manager":"张三","GeneratorRoom.Department":"人事部门"}
	],
	GeneratorRoom_Info:[
		{"GeneratorRoom.ID":"200001","GeneratorRoom.name":"机房一","GeneratorRoom.manager":"张三","GeneratorRoom.Department":"人事部门","GeneratorRoom.Address":"A座1025室","GeneratorRoom.Remarks":" ..."}
	],
	GeneratorRoom_QueryList:[
		{"GeneratorRoom.ID":"200001","GeneratorRoom.name":"机房一","GeneratorRoom.manager":"张三","GeneratorRoom.Department":"人事部门","GeneratorRoom.Address":"A座1025室","GeneratorRoom.Remarks":" ..."},
		{"GeneratorRoom.ID":"200004","GeneratorRoom.name":"机房四","GeneratorRoom.manager":"张三","GeneratorRoom.Department":"人事部门","GeneratorRoom.Address":"A座1028室","GeneratorRoom.Remarks":" ..."}
	],
	Person_List:[
		{"Person.ID":"300001","Person.name":"钱多多","Person.manager":"钱多多","Person.Department":"财务部门","Person.Type":"管理员"},
		{"Person.ID":"300002","Person.name":"赵六","Person.manager":"钱多多","Person.Department":"财务部门","Person.Type":"普通员工"},
		{"Person.ID":"300003","Person.name":"王五","Person.manager":"钱多多","Person.Department":"财务部门","Person.Type":"普通员工"},
		{"Person.ID":"300004","Person.name":"周青","Person.manager":"张三","Person.Department":"人事部门","Person.Type":"管理员"},
		{"Person.ID":"300005","Person.name":"海七","Person.manager":"张三","Person.Department":"人事部门","Person.Type":"普通员工"},
		{"Person.ID":"300006","Person.name":"钟山","Person.manager":"张三","Person.Department":"人事部门","Person.Type":"普通员工"},
		{"Person.ID":"300007","Person.name":"孙琦","Person.manager":"张三","Person.Department":"人事部门","Person.Type":"普通员工"}
	],
	Person_Info:[
		{"Person.ID":"300002","Person.name":"赵六","Person.pw":"111111","Person.Department":"财务部门","Person.Type":"普通员工","Person.Tel":"0513-8888888","Person.E-mail":"dsfsd@sina.com","Person.Mobile":"0123456789","Person.E-fax":"086-512-57312110-6436 ","Person.Remarks":" ..."}		
	],
	Person_QueryLIst:[
		{"Person.ID":"300002","Person.name":"赵六","Person.pw":"111111","Person.Department":"财务部门","Person.Type":"普通员工","Person.Tel":"0513-8888888","Person.E-mail":"dsfsd@sina.com","Person.Mobile":"0123456789","Person.E-fax":"086-512-57312110-6436 ","Person.Remarks":" .........."},
		{"Person.ID":"300003","Person.name":"王五","Person.pw":"111111","Person.Department":"财务部门","Person.Type":"普通员工","Person.Tel":"0513-8888888","Person.E-mail":"dsfsd@sina.com","Person.Mobile":"0123456789","Person.E-fax":"086-512-57312110-6436 ","Person.Remarks":" ..."}
	],
	Daily_List:[
       {"Daily.dailyId":"20130212133202","Daily.personId":"300001","Daily.module":"部门管理","Daily.operate":"新增部门"},
	   {"Daily.dailyId":"20130212140002","Daily.personId":"300001","Daily.module":"部门管理","Daily.operate":"修改部门"},
	   {"Daily.dailyId":"20130212143222","Daily.personId":"300001","Daily.module":"人员管理","Daily.operate":"删除部门"}
	],
	DictionaryType_List:[
	   {"DictionaryType.ID":"00001","DictionaryType.TypeName":"字典类型一","DictionaryType.module":"部门管理"},
	   {"DictionaryType.ID":"00002","DictionaryType.TypeName":"字典类型二","DictionaryType.module":"机房管理"},
	   {"DictionaryType.ID":"00003","DictionaryType.TypeName":"字典类型三","DictionaryType.module":"人员管理"},
	   {"DictionaryType.ID":"00004","DictionaryType.TypeName":"字典类型四","DictionaryType.module":"权限管理"},
	   {"DictionaryType.ID":"00005","DictionaryType.TypeName":"字典类型五","DictionaryType.module":"字典管理"}
	],
	DictionaryType_Info:[
	   {"DictionaryType.ID":"00001","DictionaryType.TypeName":"字典类型一","DictionaryType.module":"部门管理","DictionaryType.Remarks":"...."}
	],
	DictionaryContent_List:[
	   {"DictionaryContent.ID":"0000101","DictionaryContent.Name":"字典一","DictionaryContent.type":"字典类型一"},
	   {"DictionaryContent.ID":"0000101","DictionaryContent.Name":"字典二","DictionaryContent.type":"字典类型一"},
	   {"DictionaryContent.ID":"0000201","DictionaryContent.Name":"字典三","DictionaryContent.type":"字典类型二"},
	   {"DictionaryContent.ID":"0000202","DictionaryContent.Name":"字典四","DictionaryContent.type":"字典类型二"},
	   {"DictionaryContent.ID":"0000301","DictionaryContent.Name":"字典五","DictionaryContent.type":"字典类型三"},
	   {"DictionaryContent.ID":"0000302","DictionaryContent.Name":"字典六","DictionaryContent.type":"字典类型三"}
	],
	DictionaryContent_Info:[
		{"DictionaryContent.Name":"字典一","DictionaryContent.type":"字典类型一","DictionaryContent.Remarks":"...."}
	],
	Role_List:[
		{"Role_name":"角色一","Role_module":"部门管理"},
		{"Role_name":"角色二","Role_module":"机房管理"},
		{"Role_name":"角色三","Role_module":"日志管理"},
		{"Role_name":"角色四","Role_module":"人员管理"},
		{"Role_name":"角色五","Role_module":"权限管理"}
	],
	Power_List:[
		{"Power_PersonId":"10001","Power_PersonName":"张丹丹"},
		{"Power_PersonId":"20002","Power_PersonName":"扎翟"},
		{"Power_PersonId":"30001","Power_PersonName":"冠华居"},
		{"Power_PersonId":"40004","Power_PersonName":"赵六"},
		{"Power_PersonId":"50008","Power_PersonName":"周琪"}
	],
    xxList: []
};

// list的最后一个元素后不要有逗号，否则在页面中显示数据时，会多出一行模板行。是因为没有数据内容造成的。
// （是使用替换的方式完成的显示数据，如果没有替换值，就不会替换，所以会多一个模板行）
