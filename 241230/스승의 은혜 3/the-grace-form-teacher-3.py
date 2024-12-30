def max_gifts_with_coupon(n, b, gifts):
    # gifts: [(p, s), (p, s), ...]

    # 1) "가격 + 배송비" 합으로 오름차순 정렬
    sorted_gifts = sorted(gifts, key=lambda x: x[0] + x[1])

    answer = 0

    for i in range(n):
        # i번째 선물을 할인받는 경우
        discounted_price = (sorted_gifts[i][0] // 2) + sorted_gifts[i][1]  
        #  - 문제에서 "가격은 항상 짝수"라고 했으므로 // 2 사용 권장
        #  - 배송비(s)는 할인 X

        # 현재까지 쓴 돈
        total_cost = 0
        # 구매한 선물 개수
        count = 0

        # 우선 쿠폰을 적용한 선물부터 '사볼' 수 있는지 확인
        if discounted_price <= b:
            total_cost += discounted_price
            count += 1
        else:
            # 아예 i번째 선물도 못 사면, 이 케이스는 0개가 끝이므로
            # 다음 i로 넘어가면 됨
            answer = max(answer, count)
            continue

        # 이제 나머지 선물(0 ~ n-1 전부) 중에서
        # i번째를 제외하고 싼 것부터 차례대로 살 수 있는지만 확인
        # (i번째는 이미 샀으므로 건너뜀)
        for j in range(n):
            if j == i:
                continue  # 이미 할인받아 샀음
            p_j, s_j = sorted_gifts[j]
            price_j = p_j + s_j
            # 일반가로 구매
            if total_cost + price_j <= b:
                total_cost += price_j
                count += 1
            else:
                break

        # i번째 선물을 할인했을 때의 결과를 answer와 비교
        answer = max(answer, count)

    return answer


if __name__ == "__main__":
    import sys

    input = sys.stdin.readline
    n, b = map(int, input().split())
    gifts = []
    for _ in range(n):
        p, s = map(int, input().split())
        gifts.append((p, s))

    print(max_gifts_with_coupon(n, b, gifts))
