<?php

namespace AlibabaCloud\Rtc\V20180111;

use AlibabaCloud\Client\Request\RpcRequest;

/**
 * Request of UnmuteAudioAll
 *
 * @method string getOwnerId()
 * @method string getParticipantId()
 * @method string getConferenceId()
 * @method string getAppId()
 */
class UnmuteAudioAll extends RpcRequest
{

    /**
     * @var string
     */
    public $product = 'rtc';

    /**
     * @var string
     */
    public $version = '2018-01-11';

    /**
     * @var string
     */
    public $action = 'UnmuteAudioAll';

    /**
     * @var string
     */
    public $method = 'POST';

    /**
     * @var string
     */
    public $serviceCode = 'rtc';

    /**
     * @deprecated deprecated since version 2.0, Use withOwnerId() instead.
     *
     * @param string $ownerId
     *
     * @return $this
     */
    public function setOwnerId($ownerId)
    {
        return $this->withOwnerId($ownerId);
    }

    /**
     * @param string $ownerId
     *
     * @return $this
     */
    public function withOwnerId($ownerId)
    {
        $this->data['OwnerId'] = $ownerId;
        $this->options['query']['OwnerId'] = $ownerId;

        return $this;
    }

    /**
     * @deprecated deprecated since version 2.0, Use withParticipantId() instead.
     *
     * @param string $participantId
     *
     * @return $this
     */
    public function setParticipantId($participantId)
    {
        return $this->withParticipantId($participantId);
    }

    /**
     * @param string $participantId
     *
     * @return $this
     */
    public function withParticipantId($participantId)
    {
        $this->data['ParticipantId'] = $participantId;
        $this->options['query']['ParticipantId'] = $participantId;

        return $this;
    }

    /**
     * @deprecated deprecated since version 2.0, Use withConferenceId() instead.
     *
     * @param string $conferenceId
     *
     * @return $this
     */
    public function setConferenceId($conferenceId)
    {
        return $this->withConferenceId($conferenceId);
    }

    /**
     * @param string $conferenceId
     *
     * @return $this
     */
    public function withConferenceId($conferenceId)
    {
        $this->data['ConferenceId'] = $conferenceId;
        $this->options['query']['ConferenceId'] = $conferenceId;

        return $this;
    }

    /**
     * @deprecated deprecated since version 2.0, Use withAppId() instead.
     *
     * @param string $appId
     *
     * @return $this
     */
    public function setAppId($appId)
    {
        return $this->withAppId($appId);
    }

    /**
     * @param string $appId
     *
     * @return $this
     */
    public function withAppId($appId)
    {
        $this->data['AppId'] = $appId;
        $this->options['query']['AppId'] = $appId;

        return $this;
    }
}
