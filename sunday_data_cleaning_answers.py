from collections import defaultdict
import pandas as pd 
import datetime

# ✅ PROBLEM 1: First Non-Repeating Character
def first_non_repeating(s: str):
    b = defaultdict(int)
    for i in s:
        b[i] += 1
    for i in s:
        if b[i] == 1:
            return i


# ✅ PROBLEM 2: Flatten a Nested List
def flatten(lst):
    res = []
    for i in lst:
        if isinstance(i, list):
            res.extend(flatten(i))
        else:
            res.append(i)
    return res


# ✅ PROBLEM 3: Group Words by Anagram
def group_anagrams(words):
    a = defaultdict(list)
    for i in words:
        a["".join(sorted(i))].append(i)
    return list(a.values())


# ✅ PROBLEM 4: Longest Consecutive Sequence
def longest_consecutive(nums):
    nums = set(nums)
    max_count = 0
    for i in nums:
        if i - 1 not in nums:
            count = 0
            current = i
            while current in nums:
                count += 1
                current += 1
            max_count = max(max_count, count)
    return max_count


# ✅ PROBLEM 5: SQL-style Filter Function
def filter_projects(data, column, value):
    df = pd.DataFrame(data)
    return df[df[column] == value].to_dict(orient='records')


# ✅ PROBLEM 6: SUMIF Logic in Python
def sum_if(data, condition_col, condition_val, sum_col):
    a = defaultdict(int)
    for i in data:
        a[i[condition_col]] += i[sum_col]
    return a[condition_val]


# ✅ PROBLEM 7: Log Parser (Extract Errors)
def extract_error_logs(logs):
    a = []
    for i in logs:
        if i.split()[0] == '[ERROR]':
            a.append(i)
    return a


# ✅ PROBLEM 8: API Response Cleaner
def clean_data(data):
    res = []
    for i in data:
        try:
            if not i['name'] or not i['email']:
                continue
            res.append(i)
        except:
            continue
    return pd.DataFrame(res).to_dict(orient='records')


# ✅ PROBLEM 9: Normalize Nested Order Data
def normalize_orders(orders):
    a = []
    for i in orders:
        for j in i['items']:
            a.append({
                "order_id": i['order_id'],
                "name": i['customer']['name'],
                "email": i['customer']['email'],
                "item": j['item'],
                "qty": j['qty'],
                "price": j['price'],
                "date": i['date']
            })
    return a


# ✅ PROBLEM 10: Filter Orders from Last N Days
def filter_recent_orders(orders, days):
    res = []
    for i in orders:
        if (datetime.today() - datetime.strptime(i['date'], '%Y-%m-%d')).days <= days:
            res.append(i)
    return res
