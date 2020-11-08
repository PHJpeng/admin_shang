<?php

namespace app\http\middleware;

use app\model\UsersModel;
use app\utils\AppCode;
use think\facade\Cache;

class Check
{
	//适配安卓edit-登录验证
    public function handle($request, \Closure $next)
    {
//        $no_validation = ['currency','sendcode','sendcodeopt','entercode','wechatlogin','bindmobile','setlog','confirmBingMobile','authorization','addUserPush','createorderbybalancedetail','bookdetailbyshare','coursedetailbyshare','coords','reversegeocoding','guide','login','wxlogin','fourbindmobile','confirmbing','contentdetailbyshareopt'];
//        if(!in_array($request->action(),$no_validation)){
//            $user_m = new UserModel();
//            $userToken = $request->param('userToken');
//            if($userToken){
//                $user = json_decode(base64_decode($userToken),true);
//                $where['uuid'] = $user['user_uuid'];
//                $field = 'uuid';
//                $user = $user_m->findOne($where, $field);
//                if(!$user){
//                    exit(json_encode(['code'=>AppCode::USER_NO_EXIST,'msg'=>'用户不存在，请先注册','data'=>[],'time'=>time()]));
//                }
//                $user = json_decode(base64_decode($userToken),true);
//                $where['uuid'] = $user['user_uuid'];
//                $field = 'uuid,mobile';
//                $user = $user_m->findOne($where, $field);
//                if($user['mobile']){
//                    $loginCacheKey = $user['uuid'].'_loginCache';
//                    $loginCacheInfo = Cache::store('redis')->get("loginCache:".$loginCacheKey);
//                    if($loginCacheInfo){
//                        $loginCacheInfo = json_decode($loginCacheInfo,true);
//                        if($loginCacheInfo['device_number'] != $request->param('device_number')){
//                            exit(json_encode(['code'=>AppCode::DEVICE_CHANGE,'msg'=>'其他设备登录','data'=>[],'time'=>time()]));
//                        }
//                    }else{
//                        exit(json_encode(['code'=>AppCode::USER_LOGIN_EXPIRE,'msg'=>'登录时间过期，请重新登录','data'=>[],'time'=>time()]));
//                    }
//                }
//            }
//
//        }

        return $next($request);
    }
}
