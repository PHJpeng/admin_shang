<?php
/**
 * Created by PhpStorm.
 */

namespace app\v1\service;


use app\model\UsersModel;
use app\model\StoreModel;
use app\model\OrderModel;
use app\model\GoodsModel;
use app\model\TaskOfModel;
use app\model\UserCollectModel;
use app\utils\AppCode;
use think\Controller;
use think\Db;
use think\Exception;
use think\facade\Cache;
use think\facade\Env;

class UserService extends Controller
{
    /**
     * 发送验证码
     * @param $mobile
     * @return bool|array
     * @author userid
     * @date 2019/3/26
     */
    public static function sendCode($mobile)
    {
        try{
            $codeKey = $mobile."_loginCode";

            //验证码开关
            $ver_code = Env::get('tool.ver_code');
            if($ver_code){
                $code = get_rand_code(4,1);
                Cache::store('redis')->set("loginCode:".$codeKey,$code,60*5);
                //参数拼接
                $param['PhoneNumbers'] = $mobile;
                $param['SignName'] = Env::get('ali.sign_name');
                $param['TemplateCode'] = Env::get('ali.template_code');
                $param['TemplateParam']['code'] = $code;
                $param['TemplateParam']['product'] = "code";

                $result = sendSms($param);
                if($result->Code === 'OK'){
                    return ['data'=>[]];
                }else{
                    return ['msg'=>'验证码发送失败，请稍后重试'];
                }
            }else{
                $code = '1111';
                Cache::store('redis')->set("loginCode:".$codeKey,$code,60*5);
                return ['data'=>[]];
            }
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 登录/注册
     * @param $param
     * @return array
     * @author userid
     * @date 2019/3/26
     */
    public static function enterCode($param)
    {
        try{
            $users_m = new UsersModel();
            $where['mobile'] = $param['mobile'];
            //判断验证码
            $codeKey = $param['mobile']."_loginCode";
            if($param['mobile'] == '13200009999'){
                $codeHas = false;
            }else{
                $codeHas = Cache::store('redis')->has("loginCode:".$codeKey);
            }

            if($codeHas){
                if($param['mobile'] == '13200009999'){
                    $cacheCode = '1111';
                }else{
                    $cacheCode = Cache::store('redis')->get("loginCode:".$codeKey);
                }
                if($cacheCode != $param['code']){
                    return ['msg'=>'验证码不正确 或者已 过期 请重新获取'];
                }
                //删除无用验证码
                Cache::store('redis')->rm("loginCode:".$codeKey);
                if ($param['usercode']) {
                    $pwhere['usercode'] = $param['usercode'];
                    $pid = $users_m->findOne($where,'userid');
                    if ($pid) {
                        $add_member['pid'] = $pid['userid'];
                    }
                }
                $login_salt = user_salt();
                $add_member['login_pwd'] = pwdMd5($param['pwd'], $login_salt);
                $add_member['safety_pwd'] = $add_member['login_pwd'];
                $add_member['login_salt'] = $login_salt;
                $add_member['safety_salt'] = $login_salt;
                $add_member['mobile'] = $param['mobile'];
                $add_member['regtime'] = time();
                $add_member['regip'] = ip2long(ip());
                $add_member['path'] = '';
                $add_member['deep'] = '';
                $add_member['session_id'] = '';
                $add_member['login_time'] = time();
                $add_member['usercode'] = getRandChar(9);
                $add_member['account'] = 'ss_' . $add_member['usercode'];
                $users_m->add($add_member);

                $user = $users_m->findOne($where,'userid');
                $cache_arr['userid'] = $user['userid'];
                $userToken = base64_encode(json_encode($cache_arr));

                return ['data'=>['authorization'=>$userToken]];
            }else{
                $user = DB::table('ss_user')->field('userid,login_salt,login_pwd,status')->where($where)->find();
                if ($user) {
                    $password = pwdMd5($param['pwd'], $user['login_salt']);
                    if ($password == $user['login_pwd']) {
                        $edit['login_time'] = time();
                        DB::table('ss_user')->where(['userid' => $user['userid']])->update($edit);
                        $cache_arr['userid'] = $user['userid'];
                        $userToken = base64_encode(json_encode($cache_arr));
                        return ['data'=>['authorization'=>$userToken]];
                    } else {
                        return ['msg'=>'密码填写错误！'];
                    }
                } else {
                    return ['msg'=>'当前用户不存在，请先注册！'];
                }
            }

        }catch (\Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
 * 忘记密码
 * @param $param
 * @return array
 * @author userid
 * @date 2019/3/26
 */
    public static function resetpwd($param)
    {
        try{
            $users_m = new UsersModel();
            $where['mobile'] = $param['mobile'];
            $user = $users_m->findOne($where,'userid,login_salt,login_pwd');
            if (!$user) {
                return ['msg'=>'用户不存在请注册'];
            }
//            $password = pwdMd5($param['pwd'], $user['login_salt']);
//            if ($password != $user['login_pwd']) {
//                return ['msg'=>'旧密码输入错误'];
//            }

            //判断验证码
            $codeKey = $param['mobile']."_loginCode";
            $codeHas = Cache::store('redis')->has("loginCode:".$codeKey);
            if($codeHas){
                $cacheCode = Cache::store('redis')->get("loginCode:".$codeKey);
                if($cacheCode != $param['code']){
                    return ['msg'=>'验证码不正确 或者已 过期 请重新获取'];
                }
                //删除无用验证码
                Cache::store('redis')->rm("loginCode:".$codeKey);

                $edit['login_pwd'] = pwdMd5($param['pwd'], $user['login_salt']);
                $edit['login_time'] = time();
                $users_m->edit($edit,$where);
                $cache_arr['userid'] = $user['userid'];
                $userToken = base64_encode(json_encode($cache_arr));

                return ['data'=>['authorization'=>$userToken]];
            }else{
                return ['msg'=>'验证码不正确 或者已 过期 请重新获取'];
            }

        }catch (\Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 修改密码
     * @param $param
     * @return array
     * @author userid
     * @date 2019/3/26
     */
    public static function resetpassword($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $user_m = new UsersModel();

            $userInfo = $user_m->findOne(['userid'=>$user['userid']], 'login_salt,login_pwd');
            if (!$user) {
                return ['msg'=>'该用户不存在或已被冻结'];
            }

            if (pwdMd5($param['oldpwd'], $userInfo['login_salt']) != $userInfo['login_pwd']) {
                return ['msg'=>'旧密码输入错误'];
            }
            $where['userid'] = $user['userid'];
            $edit['login_pwd'] = pwdMd5($param['pwd'], $userInfo['login_salt']);
            $edit['login_time'] = time();
            $user_m->edit($edit,$where);
            $cache_arr['userid'] = $user['userid'];
            $userToken = base64_encode(json_encode($cache_arr));
            return ['data'=>['authorization'=>$userToken]];

        }catch (\Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 授权接口
     * @param $param
     * @return array|bool
     * @author userid
     * @date
     */
    public static function authorization($param)
    {
        try{
            //判断该手机是否已经授权
            $users_m = new UsersModel();
            $where['device_number'] = $param['device_number'];
            $member = $users_m->findOne($where,'userid');
            $cache_arr = [];
            if ($member) {
                //编辑member
                $where_member['userid'] = $member['userid'];
                $edit['login_time'] = time();
                $users_m->edit($edit,$where);
                $userid = $member['userid'];
                $cache_arr['userid'] = $userid;
            } else {
                //添加member
                $add_member['model'] = $param['model'];
                $add_member['regtime'] = time();
                $add_member['regip'] = ip2long(ip());
                $add_member['login_time'] = time();
                $add_member['usercode'] = $param['usercode'];
                $users_m->add($add_member);

                $user = $users_m->findOne($where,'userid');
                $cache_arr['userid'] = $user['userid'];
            }
            $userToken = base64_encode(json_encode($cache_arr));
            return ['data'=>['authorization'=>$userToken]];
        }catch (Exception $e){
            Db::rollback();
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 用户信息
     * @param $param
     * @return array
     * @author userid
     * @date 2019/5/19
     */
    public static function userInfo($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $user_m = new UsersModel();

            $userInfo = $user_m->findOne(['userid'=>$user['userid']],'');
            if(!$userInfo){
                return ['data'=>[]];
            }
            $img = 'http://admin.shangtout.com:90/upload/20200817/57d1391ef78269a7df9df736a0fa8cea.png';
            $userInfo['head_img'] = strlen($userInfo['head_img']) < 10 ? $img : Env::get('oss.READ_URL') . $userInfo['head_img'];
            $userInfo['sex'] = $userInfo['sex'] == 1 ? '男' : ($userInfo['sex'] == 2 ? '女' : '未知');
            $userInfo['expire'] = $userInfo['level_time'] ? date('Y-m-d H:i:s', ($userInfo['level_time'] + 92*86400)) : 0;

//            $integral = DB::table('ss_store')->where(['uid'=>$user['userid']])->value('get_coin');
            $own = Db::table("ss_store")
                ->where(['uid' => $user['userid']])
                ->find();

            if (!$own) {
                $own['uid']           = $user['userid'];
                $own['get_coin']      = 0.00;
                $own['static_time']   = time();
                $own['frozen_coin']   = 0.00;
                $own['no_get_coin']   = 0.00;
                $own['get_coin_time'] = '';

                Db::table("ss_store")->insert($own);
            }

            $userInfo['integral'] = $own['get_coin'];

            return ['data'=>$userInfo];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }
    /**
     * 收藏列表
     * @param $param
     * @return array
     * @author userid
     * @date 2019/5/16
     */
    public static function myCollect($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $start = ((int)$param['page'] - 1) * (int)$param['length'];
            $result = Db::table("ss_goods_collect")->alias('gc')
                ->field('g.*')
                ->join('ss_goods g','g.id = gc.goodid')
                ->where(['gc.userid' => $user['userid'], 'gc.status'=>1])
                ->limit($start, $param['length'])
                ->select();

            foreach ($result as $k => $v) {
                $result[$k]['cover_img'] = $v['cover_img'] ? Env::get('oss.READ_URL').$v['cover_img'] : '';
            }

            if(count($result) == 0){
                return ['code'=>AppCode::NOT_FOUND,'msg'=>'暂无数据','data'=>[]];
            }

            return ['data'=>$result];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 添加或取消收藏
     * @param $param
     * @return array
     * @author userid
     * @date 2019/5/16
     */
    public static function addOrCancelCollect($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $collect_m = new UserCollectModel();
            //查看是否已经收藏
            $where['userid'] = $user['userid'];
            $where['goodid'] = $param['goodid'];
            $collect = $collect_m->findOne($where);
            if($collect && $collect['status'] == 1){
                $where['userid'] = $user['userid'];
                $where['goodid'] = $param['goodid'];
                $edit['status'] = 2;
                $res = $collect_m->edit($edit,$where);
                if(!$res){
                    return ['msg'=>'操作失败，请稍后重试'];
                }
                return ['code'=>AppCode::SUCCESS,'msg'=>'取消收藏','data'=>[]];
            }elseif ($collect && $collect['status'] == 2) {
                $where['userid'] = $user['userid'];
                $where['goodid'] = $param['goodid'];
                $edit['status'] = 1;
                $res = $collect_m->edit($edit,$where);
                if(!$res){
                    return ['msg'=>'操作失败，请稍后重试'];
                }
                return ['code'=>AppCode::SUCCESS,'msg'=>'收藏成功','data'=>[]];
            }else{
                $add['userid'] = $user['userid'];
                $add['goodid'] = $param['goodid'];
                $add['status'] = 1;
                $add['create_time'] = time();
                $res = $collect_m->add($add);
                if(!$res){
                    return ['msg'=>'操作失败，请稍后重试'];
                }
                return ['code'=>AppCode::SUCCESS,'msg'=>'收藏成功','data'=>[]];
            }
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
 * 修改头像
 * @param $param
 * @param $file
 * @return array|string
 * @author userid
 * @date 2019/7/3
 */
    public static function editHeadImg($param,$file)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);

            $info = $file->move( '/www/wwwroot/admin.shangtout.com/shang_admin/public/uploads');
            $param['head_ico'] = 'http://admin.shangtout.com:90/uploads/'.$info->getSaveName();

            $user_m = new UsersModel();
            $where['userid'] = $user['userid'];
            $edit['head_ico'] = $param['head_ico'];
            $edit['login_time'] = time();

            $res = $user_m->edit($edit,$where);
            if(!$res){
                return ['msg'=>'修改失败，请稍后重试'];
            }
            $head_ico = Env::get('oss.READ_URL').$param['head_ico'];
            return ['data'=>['head_ico'=>$head_ico]];
        }catch (\Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 实名认证
     * @param $param
     * @param $file
     * @return array|string
     * @author userid
     * @date 2019/7/3
     */
    public static function realName($param, $file)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);

            $userInfo = Db::table('ss_user_cert')->where(['uid' => $user['userid']])->find();
//            if ($userInfo) {
//                return ['msg'=>'已认证'];
//            }

            $certificates = '';
            if ($file) {
                $info = $file->move( '/www/wwwroot/admin.shangtout.com/shang_admin/public/uploads');
                $certificates = '/uploads/'.$info->getSaveName();
            }

            $user_m = new UsersModel();
            $where['userid'] = $user['userid'];
            $edit['username'] = $param['name'];
            $edit['idcard'] = $param['num'];
            $edit['login_time'] = time();
            $edit['activate'] = 2;
            $res = $user_m->edit($edit,$where);

            $data['no'] = 'C'.date('YmdHis').rand(1000,9999);
            $data['uid'] = $user['userid'];
            $data['account'] = $param['name'];
            $data['username'] = $param['name'];
            $data['realname'] = $param['name'];
            $data['idcard'] = $param['num'];
            $data['idcard_front'] = $certificates;
            $data['idcard_back'] = '';
            $data['status'] = 0;
            $data['create_time'] = time();
            $data['juhe_status'] = 1;
            Db::table('ss_user_cert')->insert($data);

            if(!$res){
                return ['msg'=>'修改失败，请稍后重试'];
            }
            return ['data'=>[]];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 注销
     * @param $param
     * @param $file
     * @return array|string
     * @author userid
     * @date 2019/7/3
     */
    public static function cancel($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);

            $user_m = new UsersModel();
            $where['userid'] = $user['userid'];
            $edit['status'] = 0;
            $edit['remarks'] = $param['remarks'];
            $edit['login_time'] = time();
            $res = $user_m->edit($edit,$where);

            if(!$res){
                return ['msg'=>'修改失败，请稍后重试'];
            }
            return ['data'=>[]];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }


    /**
     * 修改昵称
     * @param $param
     * @return array
     * @author userid
     * @date comments
     */
    public static function editNickName($param, $file)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            //验证昵称合法性
            $strlen = mb_strlen ($param['account'], 'utf-8');
            if($strlen < 2 || $strlen > 30){
                return ['code'=>'2001','data'=>[],'msg'=>'请输入2~30个字符的昵称'];
            }
            $param['head_ico'] = '';
            if ($file) {
                $info = $file->move( '/www/wwwroot/admin.shangtout.com/shang_admin/public/uploads');
                $param['head_ico'] = '/uploads/'.$info->getSaveName();
            }


            $user_m = new UsersModel();

            $where['userid']    = $user['userid'];
            if ($param['account']) {
                $edit['account']    = $param['account'];
            }

            if ($param['head_ico']) {
                $edit['head_img']   = $param['head_ico'];
            }
            $edit['login_time'] = time();

            $res = $user_m->edit($edit,$where);

            if(!$res){
                return ['msg'=>'修改失败，请稍后重试'];
            }
            $head_ico = $param['head_ico'] ? Env::get('oss.READ_URL').$param['head_ico'] : '';
            return ['data'=>['account' => $param['account'], 'head_ico'=>$head_ico]];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 修改手机号
     * @param $param
     * @return array
     * @author userid
     * @date 2019/5/25
     */
    public static function editMobile($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            //判断验证码
            $codeKey = $param['mobile']."_loginCode";
            $codeHas = Cache::store('redis')->has("loginCode:".$codeKey);
            if($codeHas){
                $cacheCode = Cache::store('redis')->get("loginCode:".$codeKey);
                if($cacheCode != $param['code']){
                    return ['msg'=>'验证码不正确'];
                }
                //判断用户是否存在
                $user_m = new UsersModel();
                $userInfo = $user_m->findOne(['mobile'=>$param['mobile']],'uuid');
                if($userInfo){
                    return ['msg' => '该手机号已被使用'];
                }
                $where['uuid'] = $user['userid'];
                $edit['mobile'] = $param['mobile'];
                $res = $user_m->edit($edit,$where);
                if(!$res) {
                    return ['msg' => '修改失败，请稍后重试'];
                }
                $cache_arr['userid'] = $user['userid'];
                $cache_arr['mobile'] = $param['mobile'];

                $userToken = base64_encode(json_encode($cache_arr));

                return ['data'=>['authorization'=>$userToken]];
            }else{
                return ['msg'=>'验证码已失效，请重新发送'];
            }
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 我的任务
     * @param $param
     * @return array
     * @author userid
     * @date 2019/5/25
     */
    public static function taskOfUser($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $task_log_m = new TaskOfModel();
            $where[] = ['uid', '=', $user];
            switch ($param['type']) {
                case 1:
                    $where['day'] = date("Y-m-d",time());
                    break;
                case 2:
                    $where[] = ['day', '<=', date("Y-m-d",time())];
                    $where[] = ['day', '>', date('Y-m-d', strtotime('-7 days'))];
                    break;
                case 3:
                    $start = date('Y-m-d', mktime(0,0,0,date('m')-1,1,date('y'))); //上个月的开始日期
                    $t= date('t',strtotime('m')); //上个月共多少天
                    $end = date('Y-m-d', mktime(0,0,0,date('m')-1,$t,date('Y'))); //上个月的结束日期
                    $where[] = ['day', '<=', date("Y-m-d",$start)];
                    $where[] = ['day', '>=', date('Y-m-d', $end)];
                    break;
            }
            $allLog = $task_log_m->getList($where, 'id', 'sort asc');
            return ['data'=>$allLog];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 排行榜
     * @param $param
     * @return array
     * @author userid
     * @date 2019/5/25
     */
    public static function ranking($param)
    {
        try{
            $topThree = Db::table("ss_store")->alias('s')
                ->field('s.get_coin, u.username, u.head_img')
                ->join('ss_user u','u.userid = s.uid')
                ->where('u.status','=',1)
                ->order(['get_coin desc'])
                ->limit(0, 3)
                ->select();

            $img = 'http://admin.shangtout.com:90/upload/20200817/57d1391ef78269a7df9df736a0fa8cea.png';
            foreach ($topThree as $k => $v) {
                $topThree[$k]['head_img'] = $v['head_img'] ? (strlen($v['head_img']) < 10 ? $img : Env::get('oss.READ_URL1') . $v['head_img']) : $img;
                $topThree[$k]['no_get_coin'] = $v['get_coin'] ? $v['get_coin'] : 0;
            }

            $start = ((int)$param['page'] - 1) * (int)$param['length'] + 3;
            $ranking['top']  = $topThree;
            $ranking['list'] = Db::table("ss_store")->alias('s')
                ->field('s.get_coin, u.username, u.head_img')
                ->join('ss_user u','u.userid = s.uid')
                ->where('u.status','=',1)
                ->order(['get_coin desc'])
                ->limit($start,$param['length'])
                ->select();

            foreach ($ranking['list'] as $k => $v) {
                $ranking['list'][$k]['head_img'] = $v['head_img'] ? (strlen($v['head_img']) < 10 ? $img : Env::get('oss.READ_URL1') . $v['head_img']) : $img;
                $topThree[$k]['no_get_coin'] = $v['get_coin'] ? $v['get_coin'] : 0;
            }
            return ['data'=>$ranking];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * -我的钱包/积分纪录
     * @param $param
     * @return array|mixed
     */
    public static function wallet($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $start = ((int)$param['page'] - 1) * $param['length'];
            $own = Db::table("ss_store")
                ->where(['uid' => $user['userid']])
                ->find();

            if (!$own) {
                $own['uid']           = $user['userid'];
                $own['get_coin']      = 0.00;
                $own['static_time']   = time();
                $own['frozen_coin']   = 0.00;
                $own['no_get_coin']   = 0.00;
                $own['get_coin_time'] = '';

                Db::table("ss_store")->insert($own);
            }

            $list = Db::table("ss_money_detail")
                ->field('uid,inc_money,dec_money,create_time,type')
                ->where(['uid' => $user['userid']])
                ->order('create_time', 'desc')
                ->limit($start, $param['length'])
                ->select();

            $typeList = ['transfer' => '转账', 'frozen' => '点赞', 'reward' => '打赏', 'admin' => '后台', 'sign' => '签到', 'order' => '订单', 'task' => '任务'];
            $return['data'] = $own['get_coin'];
            $return['list'] = [];
            foreach ($list as $k => $v) {
                $return['list'][$k]['content'] = $typeList[$v['type']] ? $typeList[$v['type']] : '转账';
                $return['list'][$k]['title'] = $v['inc_money'] ? '+' . $v['inc_money'] : '-' . $v['inc_money'];
                $return['list'][$k]['ctime'] = date("Y-m-d H:i",$v['create_time']);
            }
            return ['data' => $return];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 签到信息
     * @param $param
     * @return array|mixed
     */
    public static function signInfo($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $continuity = Db::table('ss_money_sign_detail')//新的签到记录表
                ->field('uid,inc_money,content,create_time,datestr')
                ->where(['uid'=>$user['userid'],'type'=>'p_sign'])
                ->order('id desc')
                ->find();
            $datestr = $continuity ? $continuity['datestr'] : '00000000';

            $arr = Db::table('ss_money_sign_detail')//新的签到记录表
                ->field('uid,inc_money,content,create_time,datestr')
                ->where(['uid'=>$user['userid'],'type'=>'sign'])
                ->where('datestr','>',$datestr)
                ->order('id desc')
                ->select();

            if (!$arr) {
                $return['continuity'] = 0;
                $return['summary']    = 0;
                return ['data' => $return];
            }

            $dayDate = date('Ymd', time());
            $add_count_days = 0;//连续签到天数
            $count = 0;  //累计签到天数
            $day_list = [];
            if ($arr) {
                $day_list = array_column($arr, 'datestr');
                $count = count($day_list); //累计签到天数
            }

            if($dayDate - 1 > $day_list[0]){
                return array('add_days'=>$add_count_days,'total_day'=>$count);
            } else {
                $add_count_days = 1;//连续签到天数
            }
            for($i = 0;$i < $count - 1;$i++){
                $res = compareDay($day_list[$i],$day_list[$i+1]);
                if($res) $add_count_days++;
                else break;
            }
            $return['continuity'] = $add_count_days;
            $return['summary']    = $add_count_days;
            return ['data' => $return];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 签到
     * @param $param
     * @return array|mixed
     */
    public static function signIn($param)
    {
        try{
            $sign_money = Db::table('ss_admin_config')->where(['name' => 'SIGN_MONEY'])->value('value');
            $user = json_decode(base64_decode($param['authorization']),true);

            $beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));
            $where = [];
            $where[] = ['type', '=', 'sign'];
            $where[] = ['uid', '=', $user['userid']];
            $where[] = ['create_time', '>', $beginToday];

            $todayIsSign = Db::table('ss_money_sign_detail')
                ->where($where)
                ->value('id');

            if ($todayIsSign) {
                return ['msg'=>'今日已经签到'];
            }

            Db::startTrans();

            $res = Db::table('ss_store')->where(['uid' => $user['userid']])->setInc('get_coin',$sign_money);
            if(!$res){
                // 回滚事务
                Db::rollback();
                return ['msg'=>'网络繁忙，请稍后再试!'];
            }

            $user_info = Db::table('ss_user')
                ->where(['userid'=>$user['userid']])
                ->field('username,account')
                ->find();//获取用户名称和账号

            $over_moeny = Db::table('ss_store')->where(['uid' => $user['userid']])->value('get_coin');//获取用户最后可交易币

            $data['uid'] = $user['userid'];
            $data['type'] = 'sign';
            $data['username'] = $user_info['username'];
            $data['account'] = $user_info['account'];
            $data['content'] = '每日签到赠送'.$sign_money.'个币';
            $data['inc_money'] = $sign_money;
            $data['over_money'] = $over_moeny;
            $data['mtype'] = 'get_coin';
            $data['create_time'] = time();
            $data['datestr'] = date('Ymd');
            Db::table('ss_money_sign_detail')->insert($data);//插入到签到记录表里

            $add = add_money_detail($user['userid'],'sign','每日签到赠送'.$sign_money.'个币',$sign_money,'get_coin');
            if(!$add){
                // 回滚事务
                Db::rollback();
                return ['msg'=>'网络繁忙，请稍后再试!'];
            }

            if ($param['continuity'] == 6) {
                $sign_money = Db::table('ss_admin_config')->where(['name' => 'CONTINUED_SIGN_MONEY'])->value('value');
                $res = Db::table('ss_store')->where(['uid' => $user['userid']])->setInc('get_coin',$sign_money);
                if(!$res){
                    // 回滚事务
                    Db::rollback();
                    return ['msg'=>'网络繁忙，请稍后再试!'];
                }

                $over_moeny = Db::table('ss_store')->where(['uid' => $user['userid']])->value('get_coin');//获取用户最后可交易币

                $data['uid'] = $user['userid'];
                $data['type'] = 'p_sign';
                $data['username'] = $user_info['username'];
                $data['account'] = $user_info['account'];
                $data['content'] = '持续签到赠送'.$sign_money.'个币';
                $data['inc_money'] = $sign_money;
                $data['over_money'] = $over_moeny;
                $data['mtype'] = 'get_coin';
                $data['create_time'] = time();
                $data['datestr'] = date('Ymd');
                Db::table('ss_money_sign_detail')->insert($data);//插入到签到记录表里

                $add = add_money_detail($user['userid'],'sign','持续签到赠送'.$sign_money.'个币',$sign_money,'get_coin');
                if(!$add){
                    // 回滚事务
                    Db::rollback();
                    return ['msg'=>'网络繁忙，请稍后再试!'];
                }
            }
            // 提交事务
            Db::commit();

            return ['data' => []];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 任务奖励
     * @param $param
     * @return array|mixed
     */
    public static function taskend($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $taskType = ['1' => 'species1', '2' => 'species2', '3' => 'species3'];
            if (isset($taskType[$param['species']])) {
                $name = $taskType[$param['species']];
            } else {
                return ['msg'=>'未匹配对应规则!'];
            }

            $user_info = Db::table('ss_user')
                ->where(['userid'=>$user['userid']])
                ->field('username,account,level')
                ->find();//获取用户名称和账号
            $level = $user_info['level'];
            if ($level == 1) {
                $taskTypeArr = [1,2,3];
            } else {
                $taskTypeArr = [1];
            }

            $taskReward = Db::table('ss_money_task_detail')
                ->where(['type' => $name, 'uid' => $user['userid']])
                ->select();

            $taskNum = Db::table('ss_task')
                ->where(['task_species' => $param['species']])
                ->whereIn('task_type', $taskTypeArr)
                ->select();
            $taskCountNum = array_sum(array_column($taskNum, 'task_num'));

            if (count($taskReward) >= $taskCountNum) {
                return ['msg'=>'今日该任务已达到上限'];
            }

            if ($level == 1) {
                $taskRole = [];
                foreach ($taskNum as $k => $v) {
                    $taskRole[$v['task_species']][$v['task_type']] = $v['task_num'];
                }
                $num  = isset($taskRole[$param['species']]) ? $taskRole[$param['species']]['1'] : 0;
                $num1 = isset($taskRole[$param['species']]) ? $taskRole[$param['species']]['2'] + $num : $num;
                if (isset($taskRole[$param['species']]) && count($taskReward) >= $num1) {
                    $sign_money = Db::table('ss_task')->where(['task_type' => 3, 'task_species' => $param['species']])->value('task_reward');
                } elseif (isset($taskRole[$param['species']]) && count($taskReward) >= $num) {
                    $sign_money = Db::table('ss_task')->where(['task_type' => 2, 'task_species' => $param['species']])->value('task_reward');
                } else {
                    $sign_money = Db::table('ss_task')->where(['task_type' => 1, 'task_species' => $param['species']])->value('task_reward');
                }
            } else {
                $sign_money = Db::table('ss_task')->where(['task_type' => 1, 'task_species' => $param['species']])->value('task_reward');
            }

            Db::startTrans();
            $res = Db::table('ss_store')->where(['uid' => $user['userid']])->setInc('get_coin',$sign_money);
            if(!$res){
                // 回滚事务
                Db::rollback();
                return ['msg'=>'网络繁忙，请稍后再试!'];
            }

            $over_moeny = Db::table('ss_store')->where(['uid' => $user['userid']])->value('get_coin');//获取用户最后可交易币

            $data['uid'] = $user['userid'];
            $data['type'] = $name;
            $data['username'] = $user_info['username'];
            $data['account'] = $user_info['account'];
            $data['content'] = '完成任务，奖励'.$sign_money.'个币';
            $data['inc_money'] = $sign_money;
            $data['over_money'] = $over_moeny;
            $data['mtype'] = 'get_coin';
            $data['create_time'] = time();
            $data['datestr'] = date('Ymd');
            Db::table('ss_money_task_detail')->insert($data);//插入到签到记录表里

            $add = add_money_detail($user['userid'],'task','完成任务，奖励'.$sign_money.'个币',$sign_money,'get_coin');
            if(!$add){
                // 回滚事务
                Db::rollback();
                return ['msg'=>'网络繁忙，请稍后再试!'];
            }
            $taskList = Db::table('ss_money_task_detail')->field('type')->where(['uid' => $user['userid'], 'datestr' => date('Ymd')])->select();
            $progress = $taskList ? count($taskList) : 0;
            if ($level == 1 && ($progress == 5 || $progress == 11 || $progress == 22)) {
                $progress = 5;
                if ($progress == 11) {
                    $sign_money = 10;
                } elseif ($progress == 22) {
                    $sign_money = 20;
                }

                $res = Db::table('ss_store')->where(['uid' => $user['userid']])->setInc('get_coin',$sign_money);
                if(!$res){
                    // 回滚事务
                    Db::rollback();
                    return ['msg'=>'网络繁忙，请稍后再试!'];
                }

                $over_moeny = Db::table('ss_store')->where(['uid' => $user['userid']])->value('get_coin');//获取用户最后可交易币

                $data['uid'] = $user['userid'];
                $data['type'] = 'more';
                $data['username'] = $user_info['username'];
                $data['account'] = $user_info['account'];
                $data['content'] = '完成指定数量任务奖励'.$sign_money.'个币';
                $data['inc_money'] = $sign_money;
                $data['over_money'] = $over_moeny;
                $data['mtype'] = 'get_coin';
                $data['create_time'] = time();
                $data['datestr'] = date('Ymd');
                Db::table('ss_money_task_detail')->insert($data);//插入到签到记录表里

                $add = add_money_detail($user['userid'],'task','完成指定数量任务奖励'.$sign_money.'个币',$sign_money,'get_coin');
                if(!$add){
                    // 回滚事务
                    Db::rollback();
                    return ['msg'=>'网络繁忙，请稍后再试!'];
                }
            }
            // 提交事务
            Db::commit();

            return ['data' => []];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }


    /**
     * 分享推广码
     * @param $param
     * @return array|mixed
     */
    public static function share($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $own = Db::table('ss_user')
                ->where(['userid'=>$user['userid'],'status'=>1])
                ->field('usercode,is_team_leader')
                ->find();
            $return = [
                'is_team_leader' => $own['is_team_leader'],
                'qrcode' => $own['usercode']
            ];

            return ['data' => $return];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 推广记录
     * @param $param
     * @return array|mixed
     */
    public static function extension($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $start = ((int)$param['page'] - 1) * (int)$param['length'];
            $where = [];
            $where['pid'] = $user['userid'];
            $where['level'] = $param['type'];

            $whereOr = [];
            if ($param['title']) {
                $whereOr['account'] = 'like "%' . $param['title'] . '%"';
                $whereOr['mobile'] = 'like "%' . $param['title'] . '%"';
            }

            $own = Db::table('ss_user')
                ->where($where)
                ->whereOr($whereOr)
                ->field('userid,account,head_img,level,sex,mobile')
                ->limit($start, $param['length'])
                ->select();

            foreach ($own as $k => $v) {
                $own[$k]['head_img'] = strlen($v['head_img']) < 10 ? Env::get('oss.READ_URL') . '/uploads/admin/image/2019-11-19/5dd38b1849e8e.png' : Env::get('oss.READ_URL') . $v['head_img'];
                $own[$k]['sex'] = $v['sex'] == 1 ? '男' : ($v['sex'] == 2 ? '女' : '未知');
            }
            return ['data' => $own];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 积分转账
     * @param $param
     * @return array|mixed
     */
    public static function transfer($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $store_info = Db::table('store')->where(['uid'=>$user['userid']])->value('get_coin');
            if ($store_info < $param['nums']) {
                return ['msg'=>'可转出币数量不足!'];
            }

            $me_info = Db::table('user')->where(array('userid'=>$user['userid']))->field('is_team_leader,mobile,username,path,account,transaction_status')->find();
            $to_info = Db::table('user')->where(array('mobile'=>$param['touser']))->field('userid,is_team_leader,level,username,account,transaction_status')->find(); //var_dump($me_info);
            if(!$to_info){
                return ['msg'=>'接收人不存在!'];
            }

            if($me_info['is_team_leader']!=1 && $to_info['is_team_leader']!=1){
                return ['msg'=>'无效接收人!'];
            }

            if ($me_info['is_team_leader']==1) {
                $where[] = ['pid', '=', $user['userid']];
                $where[] = ['status', '=', 1];
            } else {
                //
            }

            $data['get_coin'] = $store_info - (int)$param['nums'];
            Db::table('store')->where(['uid'=>$user['userid']])->update($data);

            $store_info = Db::table('store')->where(['uid'=>$param['touser']])->value('get_coin');
            $data['get_coin'] = $store_info - (int)$param['nums'];
            Db::table('store')->where(['uid'=>$param['touser']])->update($data);

            return ['data' => []];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 开通会员
     * @param $param
     * @return array|mixed
     */
    public static function membership($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $store_info = Db::table('ss_store')->where(['uid'=>$user['userid']])->value('get_coin');
            if ($store_info < 6000) {
                return ['msg'=>'积分不足!'];
            }

            $historical = Db::table('ss_level_status')->where(['uid' => $param['touser']])->find();
            if (empty($historical)) {
                $data['uid'] = $param['touser'];
                $data['status'] = 1;
                $data['create_time'] = time();
                Db::table('ss_level_status')->insert($data);
            } elseif($historical['status'] != 1) {
                $saveData['status'] = 1;
                Db::table('ss_level_status')->where(['uid' => $param['touser']])->update($saveData);
            } else {
                return ['msg' => '正在申请，请稍等！！！'];
            }

//            Db::startTrans();
//            $data['get_coin'] = $store_info - 6000;
//
//            $res1 = Db::table('ss_user')->where(['userid'=>$param['touser']])->update(['level'=>1,'level_time'=>time()]);
//            if ($res && $res1) {
//                Db::commit();
//                return ['data' => []];
//            } else {
//                Db::rollback();
//                return ['msg' => '开通失败'];
//            }
            return ['data' => []];
        }catch (Exception $e){
            Db::rollback();
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 绑定推荐者
     * @param $param
     * @return array|mixed
     */
    public static function recommender($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $pid = Db::table('ss_user')->where(['userid'=> $user['userid']])->value('pid');
            if ($pid) {
                return ['msg'=>'邀请人已绑定!'];
            }

            $pid = Db::table('ss_user')->where(['usercode'=> $param['usercode']])->value('userid');
            if (!$pid) {
                return ['msg'=>'邀请码错误!'];
            }
            $data['pid'] = $pid;
            Db::table('ss_user')->where(['userid'=>$user['userid']])->update($data);

            return ['data' => []];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 消息列表
     * @param $param
     * @return array|mixed
     */
    public static function messageList($param)
    {
        try{
            $start = ((int)$param['page'] - 1) * (int)$param['length'];
            $messageList = Db::table('ss_notice')->field('id, title, cover_img, create_time')->where(['status'=> 1])->limit($start, $param['length'])->select();

            foreach ($messageList as $k => $v) {
                $messageList[$k]['cover_img'] = $v['cover_img'] ? Env::get('oss.READ_URL').$v['cover_img'] : '';
                $messageList[$k]['create_time'] = date('Y-m-d H:i:s', $v['create_time']);
            }

            return ['data' => $messageList];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 消息详情
     * @param $param
     * @return array|mixed
     */
    public static function messageInfo($param)
    {
        try{
            $message = Db::table('ss_notice')->where(['id'=> $param['id']])->find();

            $message['cover_img'] = $message['cover_img'] ? Env::get('oss.READ_URL').$message['cover_img'] : '';
            $message['create_time'] = date('Y-m-d H:i:s', $message['create_time']);

            return ['data' => $message];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

}


/**
 * 随机生成要求位数个字符
 * @param length 规定几位字符
 */
function getRandChar($length){
    $str = null;
    $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";//大小写字母以及数字
    $max = strlen($strPol)-1;

    for($i=0;$i<$length;$i++){
        $str.=$strPol[rand(0,$max)];
    }
    return $str;
}