<?php
/**
 * Created by PhpStorm.
 */

namespace app\v1\service;

use app\model\ToolModel;
use app\model\TaskModel;
use app\model\SliderModel;
use think\Controller;
use think\Db;
use think\Exception;
use think\facade\Cache;
use think\facade\Env;

class ToolService extends Controller
{

    /**
     * 配置
     * @param $param
     * @return array|mixed
     */
    public static function config()
    {
        try{
            $config_m = new ToolModel();
            $task_m = new TaskModel();
            $config_key = 'config';
            $configCache = Cache::store('redis')->get("configCache:".$config_key);
            if(!$configCache){

                $where[] = ['status', '=', ToolModel::DEL_NO];
                $where[] = ['group', '=', ToolModel::GROUP_LUCK_DRAW];
                $config = $config_m->getList($where, 'id', 'sort asc');

                $taskWhere[] = ['status', '=', ToolModel::DEL_NO];
                $task = $task_m->getList($where, 'id', 'sort asc');

                Cache::store('redis')->set("configCache:".$config_key,json_encode($config),60*60*24);
            }else{
                $cateList = json_decode($configCache,true);
            }
            return $cateList;
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * banner
     * @param
     * @return array|mixed
     */
    public static function slider()
    {
        try{
            $slider_m = new SliderModel();
            $slider_key = 'slider';
            $sliderCache = Cache::store('redis')->get("configCache:".$slider_key);
            $slider = [];
//            if(!$sliderCache){

                $where[] = ['status', '=', SliderModel::DEL_NO];
                $allSlider = $slider_m->getList($where);

                foreach ($allSlider as $k => $v) {
                    $v['cover'] = isset($v['cover']) ? Env::get('oss.READ_URL1') . $v['cover'] : '';
                    switch ($v['type']) {
                        case 0:
                            $slider['banner'][]   = $v;
                            break;
                        case 1:
                            $slider['activity'][] = $v;
                            break;
                        case 2:
                            $slider['business'][] = $v;
                            break;
                    }
                }
                Cache::store('redis')->set("configCache:".$slider_key,json_encode($slider),60*60*24);
//            }else{
//                $slider = json_decode($sliderCache,true);
//            }
            return ['data' => $slider];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 任务
     * @param $param
     * @return array|mixed
     */
    public static function task($param)
    {
        try{
            $task_m = new TaskModel();
            $task = [];
            $task['every_day'] = [];
            $task['member'] = [];
            $task['senior'] = [];
            $where[] = ['status', '=', SliderModel::DEL_NO];
            $allTask = $task_m->getList($where, 'task_type, task_species, task_num, task_reward');

            foreach ($allTask as $k => $v) {
                $v['num'] = 0;
                switch ($v['task_type']) {
                    case 1:
                        $task['every_day'][]   = $v;
                        break;
                    case 2:
                        $task['member'][] = $v;
                        break;
                    case 3:
                        $task['senior'][] = $v;
                        break;
                }
            }

            $taskList = [];
            $user     = json_decode(base64_decode($param['authorization']),true);
            if ($param['authorization']) {
                $taskRole = Db::table('ss_task')->field('task_species, task_num, task_type')->whereIn('task_type', [1,2])->select();
                $taskRoleList = [];
                foreach ($taskRole as $k => $v) {
                    $taskRoleList[$v['task_type']][] = $v;
                }

//                $taskRole = array_column($taskFloor, 'task_num', 'task_species');
                $taskList = Db::table('ss_money_task_detail')->field('type')->where(['uid' => $user['userid'], 'datestr' => date('Ymd')])->select();
                $userInfo = Db::table('ss_user')->where(['userid' => $user['userid']])->find();
                $userExpire = $userInfo['level_time'] ? $userInfo['level_time'] + 92*86400 : 0;
                $level = $userInfo['level'];
                if ($userInfo['level'] == 1 && $userExpire && time() > $userExpire) {
                    DB::table('ss_user')->where(['userid' => $user['userid']])->update(['level' => 0]);
                    $level = 0;
                }

                $taskEndList = [];

                foreach ($taskList as $k => $v) {
                    $taskEndList[$v['type']][] = $v;
                }

                foreach ($task['every_day'] as $k => $v) {
                    $key = 'species' . $v['task_species'];
                    if (isset($taskEndList[$key])) {
                        $task['every_day'][$k]['num'] = count($taskEndList[$key]) >= $v['task_num'] ? $v['task_num'] : count($taskEndList[$key]);
                    }
                }
                if ((int)$level == 1) {
                    $taskFloor = $taskRoleList['1'];
                    $taskFloor = array_column($taskFloor, 'task_num', 'task_species');
                    foreach ($task['member'] as $k => $v) {
                        $key = 'species' . $v['task_species'];
                        $num = isset($taskFloor[$v['task_species']]) ? $taskFloor[$v['task_species']] : 0;
                        if (isset($taskEndList[$key]) && $num) {
                            $task['member'][$k]['num'] = count($taskEndList[$key]) >= $num ? count($taskEndList[$key]) - $num : count($taskEndList[$key]);
                        } elseif (isset($taskEndList[$key]) && !$num) {
                            $task['member'][$k]['num'] = count($taskEndList[$key]);
                        }
                    }

                    $taskSecond = $taskRoleList['2'];
                    $taskSecond = array_column($taskSecond, 'task_num', 'task_species');
                    foreach ($task['senior'] as $k => $v) {
                        $key  = 'species' . $v['task_species'];
                        $num  = isset($taskFloor[$v['task_species']]) ? $taskFloor[$v['task_species']] : 0;
                        $num1 = isset($taskSecond[$v['task_species']]) ? $taskSecond[$v['task_species']] : 0;
                        $applicationNum = (int)$num + (int)$num1;
                        if (isset($taskEndList[$key]) && $applicationNum) {
                            $task['senior'][$k]['num'] = count($taskEndList[$key]) >= $applicationNum ? count($taskEndList[$key]) - $applicationNum : count($taskEndList[$key]);
                        } elseif (isset($taskEndList[$key]) && !$applicationNum) {
                            $task['senior'][$k]['num'] = count($taskEndList[$key]);
                        }
                    }
                }

            }
            $progress = $taskList ? count($taskList) : 0;

            $return['list']     = $task;
            $return['progress'] = $progress;
            return ['data' =>$return];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 大转盘
     * @param $param
     * @return array|mixed
     */
    public static function retuenTable($param)
    {
        try{
//            $config_key = 'retuentable';
            $paramnum = rand(1, 8);
//            $configCache = Cache::store('redis')->get("configCache:".$config_key);
//            if(!$configCache){
//
//                $where[] = ['status', '=', 1];
//                $where[] = ['name', '=', 'RETURN_TABLE'];
//                $cateList = DB::table('ss_admin_config')->where($where)->value('value');
//
//                Cache::store('redis')->set("configCache:".$config_key,json_encode($cateList),60*60*24);
//            }else{
//                $cateList = json_decode($configCache,true);
//            }

//            $retuentable = explode(',', $cateList);
            $retuentable = [5,20,10,0,0,20,5,10];
            $user = json_decode(base64_decode($param['authorization']),true);

            $userNum = Db::table('ss_zhuanpan_num')->where(['uid' => $user['userid']])->value('num');

            if(empty($userNum)){
                return ['data' => $retuentable, 'msg'=>'还没有抽奖次数'];
            }

            if($userNum == 0){
                return ['msg'=>'抽奖次数已用尽'];
            }

            $numKey = $paramnum - 1;
            $num    = isset($retuentable[$numKey]) ? $retuentable[$numKey] : 0;

            // 启动事务
            Db::startTrans();
            $res  = Db::table('ss_store')->where(['uid' => $user['userid']])->setInc('get_coin',$num);
            $res1 = Db::table('ss_zhuanpan_num')->where(['uid' => $user['userid']])->setDec('num');//处理中奖的逻辑 次数减一 返回次数
            $zhuanpan_cishu = (int)$userNum - 1;//转盘抽奖次数
            $return = ['surplus_num' => $zhuanpan_cishu, 'reward' => $num, 'number' => $paramnum];
            if(!$res || !$res1){
                // 回滚事务
                Db::rollback();
                return ['msg' => '抽奖失败'];
            }else{
                // 提交事务
                Db::commit();
                return ['data' => $return];
            }
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 获取大转盘抽奖次数
     * @param $param
     * @return array|mixed
     */
    public static function getNum($param)
    {
        try{
            $user         = json_decode(base64_decode($param['authorization']),true);
            $isset = DB::table('ss_zhuanpan_num')->where(['uid' => $user['userid']])->find();
            $count = DB::table('ss_user')->where(['pid' => $user['userid']])->count();

            if (!$isset) {
                $addData['uid'] = $user['userid'];
                $addData['num'] = $count;
                $addData['create_time'] = time();
                DB::table('ss_zhuanpan_num')->insert($addData);
                $zhuanpanData = $count;
            } elseif ($isset['create_time'] >= strtotime(date("Y-m-d"),time())) {
                $zhuanpanData = DB::table('ss_zhuanpan_num')->where(['uid' => $user['userid']])->value('num');
            } else {
                DB::table('ss_zhuanpan_num')->where(['uid' => $user['userid']])->update(['num' => $count, 'create_time' => time()]);
                $zhuanpanData = $count;
            }

            if($zhuanpanData == 0){
                return ['msg'=>'今日抽奖次数已用尽'];
            }

            if ($zhuanpanData){
                return ['data' => $zhuanpanData];
            }

        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 推广奖励
     * @param $param
     * @return array|mixed
     */
    public static function shareReward($param)
    {
        try{
            $user    = json_decode(base64_decode($param['authorization']),true);

            $info    = Db::table('ss_user')->where(['uid' => $user['userid']])->value('pid');
            $up_info = Db::table('ss_user')->where(['uid' => $info['pid'],'activate' => 2])->value('userid');

            if(empty($up_info)){
                return ['mag' => '无奖励上级'];
            }

            $time = time();
            $zhuanpanData = Db::table('ss_zhuanpan_num')->where(['uid' => $up_info['userid']])->find();//每次修改次数//每次修改次数
            $cishudata['uid']         = $up_info['userid'];
            $cishudata['create_time'] = $time;

            if(empty($zhuanpanData)){
                $cishu_data['num'] = 1;
                Db::table('ss_zhuanpan_num')->insert($cishu_data);
            }else{

                Db::table('ss_zhuanpan_num')->where(['uid' => $up_info['userid']])->update(['create_time '=> $time]);//更新最新添加时间
                Db::table('ss_zhuanpan_num')->where(['uid' => $up_info['userid']])->setInc('num');//每次修改次数

                $zhuan_time = $zhuanpanData['create_time'];//获取最后抽奖时间
                $end_time  = date('Y-m-d 23:59:00', time());//获取每天的时间23:59:00
                $end_time  = strtotime($end_time);
                //判断 每天凌晨11点59分时 抽奖次数全清零
                if($end_time==$zhuan_time){
                    Db::table('ss_zhuanpan_num')->where('id','>=', 1)->update(['num'=>0]);
                }
            }
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 用户协议、隐私协议
     * @param $param
     * @return array|mixed
     */
    public static function agreement()
    {
        try{
            $config_key = 'agreement';
            $configCache = Cache::store('redis')->get("configCache:".$config_key);
            if(!$configCache){

                $where[] = ['status', '=', 1];
                $agreementList = DB::table('ss_agreement')->where($where)->select();
                $return = [];
                foreach ($agreementList as $k => $v) {
                    if ($v['cid'] == 1) {
                        $return['user'] = ['title' => $v['title'], 'content' => $v['content']];
                    }
                    if ($v['cid'] == 2) {
                        $return['privacy'] = ['title' => $v['title'], 'content' => $v['content']];
                    }
                }

                Cache::store('redis')->set("configCache:".$config_key,json_encode($return),60*60*24);
            }else{
                $return = json_decode($configCache,true);
            }
            return ['data' => $return];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 客服
     * @param $param
     * @return array|mixed
     */
    public static function kefu()
    {
        try{
            $config_key = 'kefu';
            $cateList = Cache::store('redis')->get("configCache:".$config_key);
            if(!$cateList){

                $where[] = ['status', '=', 1];
                $where[] = ['name', '=', 'KEFU_DATA'];
                $cateList = DB::table('ss_admin_config')->where($where)->value('value');

                Cache::store('redis')->set("configCache:".$config_key,$cateList,60*60*24);
            }

            $return = json_decode($cateList,true);
            return ['data' => $return];
        }catch (\Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }


}