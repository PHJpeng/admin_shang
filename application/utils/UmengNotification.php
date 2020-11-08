<?php
/**
 * Created by PhpStorm.
 */

namespace app\utils;


use think\Exception;

class UmengNotification
{
    protected $host = "http://msg.umeng.com";
    protected $uploadPath = "/upload";
    protected $postPath = "/api/send";
    protected $appMasterSecret = 'wnbemytb9udihihv0bodieexymw3xxep';


    protected $data = array(
        "appkey"           => NULL,
        "timestamp"        => NULL,
        "type"             => NULL,
        //"device_tokens"  => "xx",
        //"alias"          => "xx",
        //"file_id"        => "xx",
        //"filter"         => "xx",
        //"policy"         => array("start_time" => "xx", "expire_time" => "xx", "max_send_num" => "xx"),
        "production_mode"  => "true",
        //"feedback"       => "xx",
        //"description"    => "xx",
        //"thirdparty_id"  => "xx"
    );

    protected $DATA_KEYS    = array("appkey", "timestamp", "type", "device_tokens", "alias", "alias_type", "file_id", "filter", "production_mode",
        "feedback", "description", "thirdparty_id");
    protected $POLICY_KEYS  = array("start_time", "expire_time", "max_send_num");
    protected $APS_KEYS    = array("alert", "badge", "sound", "content-available");

    function __construct() {

    }

    function setPredefinedKeyValue($key, $value) {
        if (!is_string($key))
            throw new Exception("key should be a string!");

        if (in_array($key, $this->DATA_KEYS)) {
            $this->data[$key] = $value;
        } else if (in_array($key, $this->APS_KEYS)) {
            $this->data["payload"]["aps"][$key] = $value;
        } else if (in_array($key, $this->POLICY_KEYS)) {
            $this->data["policy"][$key] = $value;
        } else {
            if ($key == "payload" || $key == "policy" || $key == "aps") {
                throw new Exception("You don't need to set value for ${key} , just set values for the sub keys in it.");
            } else {
                throw new Exception("Unknown key: ${key}");
            }
        }
    }

    function isComplete() {
        if (is_null($this->appMasterSecret))
            throw new Exception("Please set your app master secret for generating the signature!");
        $this->checkArrayValues($this->data);
        return TRUE;
    }

    private function checkArrayValues($arr) {
        foreach ($arr as $key => $value) {
            if (is_null($value))
                throw new Exception($key . " is NULL!");
            else if (is_array($value)) {
                $this->checkArrayValues($value);
            }
        }
    }


    function send() {
        //check the fields to make sure that they are not NULL
        $this->isComplete();

        $url = $this->host . $this->postPath;
        $postBody = json_encode($this->data);
        $sign = md5("POST" . $url . $postBody . $this->appMasterSecret);
        $url = $url . "?sign=" . $sign;
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_BINARYTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 60);
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postBody );
        $result = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlErrNo = curl_errno($ch);
        $curlErr = curl_error($ch);
        curl_close($ch);
        if ($httpCode == "0") {
            // Time out
            throw new Exception("Curl error number:" . $curlErrNo . " , Curl error details:" . $curlErr . "\r\n");
        } else if ($httpCode != "200") {
            // We did send the notifition out and got a non-200 response
            throw new Exception("Http code:" . $httpCode .  " details:" . $result . "\r\n");
        } else {
            return $result;
        }
    }
}