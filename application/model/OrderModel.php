<?php
/**
 * Created by PhpStorm.
 */

namespace app\model;
use think\Model;

class OrderModel extends Model
{

    protected $table = "ss_order";
    //开启自动时间戳
    protected $autoWriteTimestamp = 'timestamp';
    // 定义时间戳字段名
    protected $createTime = 'addtime';

    /*
     * 订单信息 0待打款 1待收款 2已完成 3超时未打款
     */
    const STATUS_ZERO = 0;
    const STATUS_ONE = 1;
    const STATUS_TWO = 2;
    const STATUS_THIRD = 3;


    /**
     * 查询列表
     * @param array $where
     * @param string $field
     * @param array $order
     * @return array
     * @date
     */
    public function getList($where=[], $field='*', $order=[])
    {
        $res = self::where($where)->field($field)->order($order)->select()->toArray();

        return $res;
    }

    /**
     * 查询一条数据
     * @param array $where
     * @param string $field
     * @return array|null|\PDOStatement|string|Model
     * @date
     */
    public function findOne($where = [], $field = '*')
    {
        $res = self::where($where)->field($field)->find();
        return $res;
    }
}