<?php

namespace AlibabaCloud\Baas\V20180731;

use AlibabaCloud\Client\Request\RpcRequest;

/**
 * Request of DescribeEthereumNodeInfo
 *
 * @method string getNodeId()
 */
class DescribeEthereumNodeInfo extends RpcRequest
{

    /**
     * @var string
     */
    public $product = 'Baas';

    /**
     * @var string
     */
    public $version = '2018-07-31';

    /**
     * @var string
     */
    public $action = 'DescribeEthereumNodeInfo';

    /**
     * @var string
     */
    public $method = 'POST';

    /**
     * @param string $nodeId
     *
     * @return $this
     */
    public function withNodeId($nodeId)
    {
        $this->data['NodeId'] = $nodeId;
        $this->options['query']['NodeId'] = $nodeId;

        return $this;
    }
}
