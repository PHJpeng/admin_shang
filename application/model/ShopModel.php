<?php
/**
 * Created by PhpStorm.
 */

namespace app\model;


use think\Model;

class ShopModel extends Model
{

    protected $table = "ss_shop";
    //开启自动时间戳
    protected $autoWriteTimestamp = 'timestamp';
    // 定义时间戳字段名
    protected $createTime = 'cate_create_time';

    /*
     * 是否删除 1:未删除 2:已删除
     */
    const DEL_NO = 1;
    const DEL_YED = 2;

    /**
     * 查询列表
     * @param array $where
     * @param string $field
     * @param array $order
     * @return array
     */
    public function getList($where=[], $start = 0, $length = 10, $field='*', $order=[])
    {
        $res = self::where($where)->field($field)->order($order)->limit($start, $length)->select()->toArray();

        return $res;
    }
}