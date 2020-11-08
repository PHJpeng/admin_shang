<?php
/**
 * Created by PhpStorm.
 */

namespace app\model;


use think\Model;

class CityModel extends Model
{

    protected $table = "ss_city_list";
    //开启自动时间戳
    protected $autoWriteTimestamp = 'timestamp';
    // 定义时间戳字段名
    protected $createTime = 'ctime';

    /*
     * 城市类别 1:省 2:城市
     */
    const LEVEL_ONE = 1;
    const LEVEL_TWO = 2;

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
}