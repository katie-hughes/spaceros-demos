
with open('topic.txt') as f:
  for l in f.readlines():
    spl = l.split('|')
    # print(spl)
    topic = spl[1]
    ty = spl[2]
    desc = spl[3]
    print(f"| `{topic}` | `{ty}` | {desc} |")