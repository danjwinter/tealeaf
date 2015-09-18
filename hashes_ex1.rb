family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
          
        x =  family.select {|k, v| k == :sisters || k == :brothers }
        arr = x.values.flatten
        p arr