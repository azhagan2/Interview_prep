# 🔥 Python Interview Warmups - Azhagan Edition

# 1. Most Frequent Character (without Counter)
def most_frequent_char(s):
    freq = {ch: s.count(ch) for ch in set(s)}
    return max(freq, key=freq.get)

# 2. Check if List is Palindrome
def is_palindrome(lst):
    return lst == lst[::-1]

# 3. Flatten Arbitrary Nested Lists (Recursive)
def flatten(lst):
    result = []
    for item in lst:
        if isinstance(item, list):
            result.extend(flatten(item))
        else:
            result.append(item)
    return result

# 4. Custom Dict Merge (sum overlapping keys)
def merge_dicts(d1, d2):
    result = {}
    for k in d1:
        result[k] = d1[k]
    for k in d2:
        result[k] = result.get(k, 0) + d2[k]
    return result

# 5. Sort a Dict by Values
def sort_dict_by_values(d):
    return sorted(d.items(), key=lambda x: x[1])

# 6. Remove Duplicates While Preserving Order
def remove_duplicates(lst):
    res = []
    for i in lst:
        if i not in res:
            res.append(i)
    return res

# 7. Check if Dict is Subset of Another
def is_subset(d1, d2):
    for item in d1.items():
        if item not in d2.items():
            return False
    return True

# 8. Group Words by Length
def group_by_length(words):
    res = {}
    for word in words:
        l = len(word)
        if not res.get(l):
            res[l] = [word]
        else:
            res[l].append(word)
    return res

# 9. Word Frequency Counter
def count_word_freq(s):
    res = {}
    for word in s.lower().split():
        if not res.get(word):
            res[word] = 1
        else:
            res[word] += 1
    return res

# 10. Deep Copy a Nested List (Without copy module)
def deep_copy(lst):
    res = []
    for i in lst:
        if isinstance(i, list):
            res.append(deep_copy(i))
        else:
            res.append(i)
    return res

# Sample tests (optional - can be removed/commented before commit)
if __name__ == "__main__":
    print("1:", most_frequent_char("abracadabra"))
    print("2:", is_palindrome([1, 2, 3, 2, 1]))
    print("3:", flatten([1, [2, [3, 4]], 5]))
    print("4:", merge_dicts({'x': 1, 'y': 2}, {'y': 3, 'z': 4}))
    print("5:", sort_dict_by_values({'a': 3, 'b': 1, 'c': 2}))
    print("6:", remove_duplicates([1, 2, 2, 3, 1]))
    print("7:", is_subset({'a': 1, 'b': 2}, {'a': 1, 'b': 2, 'c': 3}))
    print("8:", group_by_length(["hi", "hello", "yo", "yes"]))
    print("9:", count_word_freq("This is that is this"))
    print("10:", deep_copy([1, [2, [3, 4]], 5]))
