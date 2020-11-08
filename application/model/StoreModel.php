<?php
/**
 * Created by PhpStorm.
 */

namespace app\model;
use think\Model;

class StoreModel extends Model
{

    protected $table = "ss_store";
    //开启自动时间戳
    protected $autoWriteTimestamp = 'timestamp';
    // 定义时间戳字段名
    protected $createTime = 'addtime';

    /*
     * 是否删除 1:未删除 2:已删除
     */
    const DEFAULT_IMG = '';

}