<?php
/**
 * Created by PhpStorm.
 */

namespace app\model;
use think\Model;

class UserCollectModel extends Model
{

    protected $table = "ss_goods_collect";
    //开启自动时间戳
    protected $autoWriteTimestamp = 'timestamp';
    // 定义时间戳字段名
    protected $createTime = 'create_time';

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

    /**
     * 添加数据
     * @param array $param
     * @return mixed
     * @date
     */
    public function add($param = [])
    {
        $model = self::data($param);
        return $model->save($param);
    }

    /**
     * 更新数据
     * @param array $param
     * @param array $where
     * @return bool
     * @date
     */
    public function edit($param=[], $where=[]){

        return self::save($param, $where);
    }
}