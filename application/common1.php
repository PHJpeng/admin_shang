<?php
use AlibabaCloud\Client\AlibabaCloud;
use AlibabaCloud\Client\Exception\ClientException;
use AlibabaCloud\Client\Exception\ServerException;
use think\facade\Cache;
use think\facade\Env;
use think\Db;

// 应用公共文件

/**
 * 阿里大鱼发短信
 * @param $param
 * @return bool|stdClasss
 */
function sendSms($param)
{
    try {
        $params = array();
        // *** 需用户填写部分 ***
        // fixme 必填: 请参阅 https://ak-console.aliyun.com/ 取得您的AK信息
        $accessKeyId = Env::get('ali.access_id');
        $accessKeySecret = Env::get('ali.access_secret');
        // fixme 必填: 短信接收号码
        $params["PhoneNumbers"] = $param['PhoneNumbers'];
        // fixme 必填: 短信签名，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
        $SignName = str_replace('【', '', $param['SignName']);
        $SignName = str_replace('】', '', $SignName);
        $SignName = str_replace('[', '', $SignName);
        $SignName = str_replace(']', '', $SignName);
        $params["SignName"] = $SignName;

        // fixme 必填: 短信模板Code，应严格按"模板CODE"填写, 请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/template
        $params["TemplateCode"] = $param['TemplateCode'];

        // fixme 可选: 设置模板参数, 假如模板中存在变量需要替换则为必填项
        $params['TemplateParam'] = $param['TemplateParam'];
        // *** 需用户填写部分结束, 以下代码若无必要无需更改 ***
        if (!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
            $params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
        }
        // 初始化SignatureHelper实例用于设置参数，签名以及发送请求
        $helper = new \app\utils\SignatureHelper();

        // 此处可能会抛出异常，注意catch
        $content = $helper->request(
            $accessKeyId,
            $accessKeySecret,
            "dysmsapi.aliyuncs.com",
            array_merge($params, array(
                "RegionId" => "cn-hangzhou",
                "Action" => "SendSms",
                "Version" => "2017-05-25",
            ))
        // fixme 选填: 启用https
        // ,true
        );
        return $content;
    } catch (\Exception $e) {
        return false;
    }
}

/**
 * 生成随机字符串
 * @param int $length   要生成的随机字符串长度
 * @param int $type     随机码类型：0，数字+大小写字母；1，数字；2，小写字母；3，大写字母；4，特殊字符；5，数字+小写字母；-1，数字+大小写字母+特殊字符
 * @return string
 * @author userid
 * @date
 */
function get_rand_code($length = 5, $type = 0)
{
    $arr = array(1 => "0123456789", 2 => "abcdefghijklmnopqrstuvwxyz", 3 => "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 4 => "~@#$%^&*(){}[]|");
    if ($type == 0) {
        array_pop($arr);
        $string = implode("", $arr);
    } elseif ($type == "-1") {
        $string = implode("", $arr);
    }elseif ($type == 5){
        $string = $arr[1].$arr[2];
    } else {
        $string = $arr[$type];
    }
    $count = strlen($string) - 1;
    $code = '';
    for ($i = 0; $i < $length; $i++) {
        $code .= $string[rand(0, $count)];
    }
    return $code;
}

/**
 * 获取ip
 * @return string
 * @author userid
 * @date
 */
function ip()
{
    if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), 'unknown')) {
        $ip = getenv('HTTP_CLIENT_IP');
    } elseif(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), 'unknown')) {
        $ip = getenv('HTTP_X_FORWARDED_FOR');
    } elseif(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown')) {
        $ip = getenv('REMOTE_ADDR');
    } elseif(isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown')) {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    return preg_match ( '/[\d\.]{7,15}/', $ip, $matches ) ? $matches [0] : '';
}

/**
 * 根据code获取微信登录授权access_token
 * @param $code
 * @return bool|string
 * @author userid
 * @date 2019/3/6 13:31
 */
function getAccessToken($code)
{
    $url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".Env::get('wechat.login_appid')."&secret=".Env::get('wechat.login_secret')."&code=".$code."&grant_type=authorization_code";
    $result = file_get_contents($url);
    return $result;
}

function formatSignString($host, $uri, $param, $requestMethod)
{
    $tmpParam = array();
    ksort($param);
    foreach ($param as $key => $value) {
        array_push($tmpParam, str_replace("_", ".", $key) . "=" . $value);
    }
    $strParam = join("&", $tmpParam);
    $signStr = strtoupper($requestMethod) . $host . $uri . "?" . $strParam;
    return $signStr;
}


function http_curl_exec($url, $data, &$rsp_str, &$http_code, $method = 'POST', $timeout = 10, $cookie = array(), $headers = array())
{
    $ch = curl_init();
    if (!curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1)) {
        return -1;
    }
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    if (count($headers) > 0) {
        if (!curl_setopt($ch, CURLOPT_HTTPHEADER, $headers)) {
            return -1;
        }
    }

    if ($method != 'GET') {
        $data = is_array($data) ? http_build_query($data) : $data;
        if (!curl_setopt($ch, CURLOPT_POSTFIELDS, $data)) {
            echo 'http_curl_ex set postfields failed';
            return -1;
        }
    } else {
        $data = is_array($data) ? http_build_query($data) : $data;
        echo 'data (GET method) : ' . $data . "\n";
        if (strpos($url, '?') === false) {
            $url .= '?';
        } else {
            $url .= '&';
        }
        $url .= $data;
    }

    if (!curl_setopt($ch, CURLOPT_URL, $url)) {
        return -1;
    }

    if (!curl_setopt($ch, CURLOPT_TIMEOUT, $timeout)) {
        return -1;
    }

    if (!curl_setopt($ch, CURLOPT_HEADER, 0)) {
        return -1;
    }

    $rsp_str = curl_exec($ch);
    if ($rsp_str === false) {
        var_dump(curl_error($ch));
        curl_close($ch);
        return -2;
    }

    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    return $rsp_str;
}

/**
 * curlPOST请求
 * @param $url
 * @param $post_data
 * @return mixed
 * @author userid
 * @date 2019/4/5
 */
function curl_post($url, $post_data)
{
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $result = curl_exec($curl);
    return $result;
}

/**
 * 状态加密
 * @param $array
 * @return false|int|string
 * @author userid
 * @date 2019/9/17
 */
function encryptStatus($array)
{
    $num       = 12;
    $num_array = range(1, $num);
    $list      = [];
    for ($i = 0; $i < $num; $i++) {
        $list[] = $num_array[$i];
        foreach ($list as $k => $v) {
            if ($v != $num_array[$i]) {
                $list[] = $v . ',' . $num_array[$i];
            }
        }
    }

    // 返回键
    sort($array);
    $str = implode(',', $array);

    if (count($array) > 1) {
        $key = array_search($str, $list, true) + 1;
    } else {
        $key = array_search($str, $list) + 1;
    }

    return $key;
}

/**
 * 状态解密
 * @param $key
 * @return array
 * @author userid
 * @date 2019/9/17
 */
function decryptStatus($key)
{
    $num       = 12;
    $num_array = range(1, $num);
    $list      = [];
    for ($i = 0; $i < $num; $i++) {
        $list[] = $num_array[$i];
        foreach ($list as $k => $v) {
            if ($v != $num_array[$i]) {
                $list[] = $v . ',' . $num_array[$i];
            }
        }
    }

    // 返回
    $array = $list[$key - 1];
    return explode(',', $array);
}

/**
 * 求两个日期之间相差的天数
 * (针对1970年1月1日之后，求之前可以采用泰勒公式)
 * @param string $day1
 * @param string $day2
 * @return number
 */
function diffBetweenTwoDays ($day1, $day2)
{
    $second1 = strtotime($day1);
    $second2 = strtotime($day2);

    if ($second1 < $second2) {
        $tmp = $second2;
        $second2 = $second1;
        $second1 = $tmp;
    }
    return ($second1 - $second2) / 86400;
}

/**
 * 写入日志
 * @param  array,string  $log_content [内容]
 * @param  string        $keyp        [文件名]
 * @param  string        $action      [方法名]
 * @return [type]        　　　　　　　[description]
 */
function my_log($log_content, $keyp, $action=''){
    $log_filename = app()->getRuntimePath() .'/logs/'.$keyp;
//    !is_dir($log_filename) && mkdir($log_filename, 0755, true);

    if(is_array($log_content)){
        $log_content = JSONReturn($log_content);
    }
    if($action){
        $action = "function:".$action;
    }
    file_put_contents($log_filename.date("Ym").'.log', '['.date("Y-m-d H:i:s").']' .PHP_EOL . $action. PHP_EOL. $log_content . PHP_EOL."------------------------ --------------------------".PHP_EOL, FILE_APPEND);
}

function JSONReturn($result)
{
    return json_encode($result,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
}

/**
 * Object转数组
 * @param $array
 * @return array
 */
function object_array(&$object)
{
    $object =  json_decode( json_encode( $object),true);
    return  $object;
}

function user_md5($str, $auth_key = '')
{
    return '' === $str ? '' : md5(sha1($str) . $auth_key);
}

function user_salt($time=null){
    if(isset($time) || empty($time)){
        $time=time();
    }
    return substr(md5($time),0,3);
}

function pwdMd5($value,$salt){
    $pwd=user_md5($value);
    $user_pwd=md5($pwd.$salt);
    return  $user_pwd;
}

/**
 * 身份证号验证
 * @param $id
 * @return bool
 */
function is_idcard( $id )
{
    $id = strtoupper($id);
    $regx = "/(^\d{15}$)|(^\d{17}([0-9]|X)$)/";
    $arr_split = array();
    if(!preg_match($regx, $id))
    {
        return false;
    }
    if(15==strlen($id)) //检查15位
    {
        $regx = "/^(\d{6})+(\d{2})+(\d{2})+(\d{2})+(\d{3})$/";

        @preg_match($regx, $id, $arr_split);
        //检查生日日期是否正确
        $dtm_birth = "19".$arr_split[2] . '/' . $arr_split[3]. '/' .$arr_split[4];
        if(!strtotime($dtm_birth))
        {
            return false;
        } else {
            return true;
        }
    }
    else      //检查18位
    {
        $regx = "/^(\d{6})+(\d{4})+(\d{2})+(\d{2})+(\d{3})([0-9]|X)$/";
        @preg_match($regx, $id, $arr_split);
        $dtm_birth = $arr_split[2] . '/' . $arr_split[3]. '/' .$arr_split[4];
        if(!strtotime($dtm_birth)) //检查生日日期是否正确
        {
            return true;
        }
        else
        {
            //检验18位身份证的校验码是否正确。
            //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
            $arr_int = array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            $arr_ch = array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            $sign = 0;
            for ( $i = 0; $i < 17; $i++ )
            {
                $b = (int) $id{$i};
                $w = $arr_int[$i];
                $sign += $b * $w;
            }
            $n = $sign % 11;
            $val_num = $arr_ch[$n];
            if ($val_num != substr($id,17, 1))
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}

/**
 * 比较当天签到天数与上一次签到时间
 * @param string $curDay 当天签到天数
 * @param string $nextDay 上一次签到天数
 * @return boolean
 */
function compareDay($curDay,$nextDay)
{
    if($curDay - 1 == $nextDay){
        return true;
    }else{
        return false;
    }
}


/**
 * 生成订单号
 * @return string 订单号
 */
function createOrderNumber()
{
    $code = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
    $order_id_main = date('YmdHis') . rand(10000000,99999999);
    $order_id_len = strlen($order_id_main);
    $order_id_sum = 0;
    for($i=0; $i<$order_id_len; $i++){
        $order_id_sum += (int)(substr($order_id_main,$i,1));
    }
    $osn = $code[intval(date('Y')) - 2019].$order_id_main . str_pad((100 - $order_id_sum % 100) % 100,2,'0',STR_PAD_LEFT);
    return $osn;
}

/**
 * 添加记录 2018年10月31日 16:58:38 HH
 * @param [type]  $uid     [description]
 * @param [type]  $type    [description]
 * @param [type]  $content [description]
 * @param integer $nums    [description]
 * @param string  $ctype   [description]
 * @param integer $bind_id [description]
 */
function add_money_detail($uid,$type,$content,$money,$mtype='',$bind_id=0,$to_leader=2){

    $user_info = DB::table('ss_user')->where('userid',$uid)->field('userid,username,account,is_team_leader')->find();

    if(!empty($mtype)){
        $over_moeny = DB::table('ss_store')->where('uid',$uid)->value($mtype);
    }

    $data = array();
    $data['uid'] = $uid;
    $data['username'] = $user_info['username'];
    $data['account'] = $user_info['account'];
    $data['type'] = $type;
    if($money>0){
        $data['inc_money'] = $money;
    }else{
        $data['dec_money'] = -$money;
    }
    $data['content'] = $content;
    $data['mtype'] = $mtype;
    $data['over_money'] = $over_moeny;
    $data['bind_id'] = $bind_id;
    $data['to_leader'] = $to_leader;
    $data['ip'] = request()->ip();
    $data['create_time'] = time();
    $data['datestr'] = date('Ymd');
    $addid = DB::table('ss_money_detail')->insertGetId($data);
    if($addid){
        return true;
    }else{
        return false;
    }
}
