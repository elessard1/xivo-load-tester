<?xml version="1.0" encoding="ISO-8859-1" ?>
<scenario name="multi call then wait with auth with tel: URI">

<send retrans="500">
  <![CDATA[
    INVITE tel:+[field2] SIP/2.0
    Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
    Max-Forwards: 70
    To: <tel:[field2]>
    From: <sip:[field0]@[local_ip]:[local_port]>;tag=[call_number]
    Call-ID: [call_id]
    CSeq: [cseq] INVITE
    Contact: <sip:[field0]@[local_ip]:[local_port]>
    Content-Type: application/sdp
    Content-Length: [len]

    v=0
    o=user1 53655765 2353687637 IN IP[local_ip_type] [local_ip]
    s=-
    c=IN IP[media_ip_type] [media_ip]
    t=0 0
    m=audio [media_port] RTP/AVP 3
    a=rtpmap:3 GSM/8000
    a=ptime:20
    a=sendrecv

  ]]>
</send>

<recv response="401" auth="true">
</recv>

<send>
  <![CDATA[
    ACK tel:+[field2] SIP/2.0
    Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
    Max-Forwards: 70
    To: <tel:[field2]>[peer_tag_param]
    From: <sip:[field0]@[local_ip]:[local_port]>;tag=[call_number]
    Call-ID: [call_id]
    CSeq: [cseq] ACK
    Content-Length: 0

  ]]>
</send>

<send retrans="500">
  <![CDATA[
    INVITE tel:+[field2] SIP/2.0
    Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
    Max-Forwards: 70
    To: <tel:[field2]>
    From: <sip:[field0]@[local_ip]:[local_port]>;tag=[call_number]
    Call-ID: [call_id]
    CSeq: [cseq] INVITE
    Contact: <sip:[field0]@[local_ip]:[local_port]>
    [field1]
    Content-Type: application/sdp
    Content-Length: [len]

    v=0
    o=user1 53655765 2353687637 IN IP[local_ip_type] [local_ip]
    s=-
    c=IN IP[media_ip_type] [media_ip]
    t=0 0
    m=audio [media_port] RTP/AVP 3
    a=rtpmap:3 GSM/8000
    a=ptime:20
    a=sendrecv

  ]]>
</send>

<recv response="100" optional="true">
</recv>

<recv response="180" optional="true">
</recv>

<recv response="183" optional="true">
</recv>

<recv response="200">
</recv>

<send>
  <![CDATA[
    ACK tel:+[field2] SIP/2.0
    Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
    Max-Forwards: 70
    To: <tel:[field2]>[peer_tag_param]
    From: <sip:[field0]@[local_ip]:[local_port]>;tag=[call_number]
    Call-ID: [call_id]
    CSeq: [cseq] ACK
    Content-Length: 0

  ]]>
</send>

{{ rtp|sipp_rtp }}

<recv request="BYE">
</recv>

<send>
  <![CDATA[
    SIP/2.0 200 OK
    [last_Via:]
    [last_To:]
    [last_From:]
    [last_Call-ID:]
    [last_CSeq:]
    Contact: <sip:[field0]@[local_ip]:[local_port]>
    Content-Length: 0

  ]]>
</send>

</scenario>
