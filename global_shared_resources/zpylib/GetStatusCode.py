import  urllib3


def get_response_code(urls, is_certificate_required):
    urllib3.disable_warnings()
    try:
        http = urllib3.PoolManager(cert_reqs=is_certificate_required)
        resp = http.request('GET', urls, retries=False)
        return resp.status
    except Exception as e:
            print(e)
