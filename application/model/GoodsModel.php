<?php
/**
 * Created by PhpStorm.
 */

namespace app\model;
use think\Model;

class GoodsModel extends Model
{

    protected $table = "ss_goods";
    //开启自动时间戳
    protected $autoWriteTimestamp = 'timestamp';
    // 定义时间戳字段名
    protected $createTime = 'create_time';

    /*
     * 是否推荐 1:是 2:否
     */
    const IS_HOT = 1;
    const IS_HOT_NO = 2;

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