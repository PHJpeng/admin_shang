<?php
/**
 * Created by PhpStorm.
 */

namespace app\model;

use think\Model;

class UsersModel extends Model
{

    protected $table = "ss_user";
    //开启自动时间戳
    protected $autoWriteTimestamp = 'timestamp';
    // 定义时间戳字段名
    protected $createTime = 'regtime';
    protected $updateTime = 'login_time';

    /*
     * 用户来源 1:app1, 2:app2 ....
     */
    const TYPE = 1;

    /*
     * 用户状态：0，未激活；1，已激活；2，已个人实名；
     */
    const USER_NO = 1;
    const USER_YES = 2;
    const USER_cCOMPLETE = 3;

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