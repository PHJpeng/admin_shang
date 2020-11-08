<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Env;
return [
    // 数据库类型
    'type'           => '\think\mongo\Connection',
    // 设置查询类
    'query'			 => '\think\mongo\Query',
    // 服务器地址
    'hostname'       => 'dds-2ze45100a36431e433270.mongodb.rds.aliyuncs.com',
    // 集合名
    'database'       => 'Baobaoshu',
    // 用户名
    'username'       => '',
    // 密码
    'password'       => '',
    // 端口
    'hostport'       => '3717',
    // 强制把_id转换为id
    'pk_convert_id' => true,
];
