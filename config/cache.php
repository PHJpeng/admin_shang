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

// +----------------------------------------------------------------------
// | 缓存设置
// +----------------------------------------------------------------------
use think\facade\Env;
return [
    // 缓存配置为复合类型
    'type'  =>  'complex',
    'default'	    =>	[
        'type'	    =>	'file',
        'expire'    =>  0,  // 全局缓存有效期（0为永久有效）
        'prefix'    =>  'think',    // 缓存前缀
        'path'      =>  '../runtime/cache/',    // 缓存目录
    ],
    'redis'	=>	[
        'type'	    =>	'redis',
        'host'	    =>  Env::get('redis.host'),
        'password'  =>  Env::get('redis.password'),
        'select'    =>  Env::get('redis.redis_database'),
        'port'      =>  Env::get('redis.redis_port'),
        'expire'    =>  0,  // 全局缓存有效期（0为永久有效）
        'prefix'    =>  '',    // 缓存前缀
    ],
    // 添加更多的缓存类型设置
];
