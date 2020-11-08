<?php
/**
 * Created by PhpStorm.
 */
namespace app\model;

use think\Model;

class ToolModel extends Model
{

    protected $table = "ss_admin_config";
    //开启自动时间戳
    protected $autoWriteTimestamp = 'timestamp';
    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';

    /*
     * 配置分组 ；
     */
    const GROUP_LUCK_DRAW = 10;
    const GROUP_TASK = 11;

    /**
     * 查询一条数据
     * @param array $where
     * @param string $field
     * @return array|null|\PDOStatement|string|Model
     * @author userid
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
     * @author userid
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
     * @author userid
     * @date
     */
    public function edit($param=[], $where=[]){

        return self::save($param, $where);
    }
}