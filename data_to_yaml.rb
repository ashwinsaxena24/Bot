require "yaml"
bot_data = {
  :presubs => [
    ['dont',"do not"],
    ['youre',"you're"],
    ['love','like'],
    ["don't","do not"],
    ["apologize","i'm sorry"],
    ["dislike","hate"],
    ["despise","hate"],
    ["yeah","yes"],
    ["mom","family"]
  ],
  :responses => {
    :default => [
      "I don't understand",
      "What?",
      "Huh?",
      "Tell me about something else.",
      "I am tired of this.Please change the subject."
    ],
    :greeting => [
      "Hi. I am [name]. Want to chat?",
      "What's on your mind today?",
      "Hi, what would you like to talk about?"
    ],
    :farewell => ["Goodbye!","See you again.","Au revoir!"],
    'hello' => [
      "How's it going?",
      "How do you do?",
      "Enough of pleasantries"
    ],
    'sorry' => ["There's not need to apologize"],
    'different' => [
      "How is it different?",
      "What has changed?"
    ],
    'everyone *' => ["You think everyone *?"],
    'do not know' => ["Are always so indecisive"],
    'yes' => [
      "Atlease you are positive about something.",
      "Great!"
    ],
    'family' => ["Tell me about your family"],
    'you are *' => [
      "What makes you think I am *?",
      "Are you sure I am *?"
    ],
    'i am *' => [
      "Is it normal for you to be *?",
      "Do you like being *?"
    ],
    'i do not *' => ["Why don't you *?"],
    'what' => ["Why do you ask?","Why?","I don't know. Do you?"],
    'no' => [
      "Really",
      "Fair enough"
    ],
    'why does *' => [
      "I don't know why *?",
      "Do you already know the answer?"
    ],
    'why can\'t i *' => ["Do you want to *?"],
    'why can you *' => ["Do you want me to *?"],
    'hates *' => ["Why do you think they hate *?"],
    'hate *' => [
      "Why don't you like *?",
      "Why the dislike of *?"
    ],
    'i like *' => [
      "Why do you like *",
      "I like * too!"
    ],
    'good' => [
      "Yes it is!",
      "Is it really that good?"
    ],
    'bad' => [
      "I don't think so?",
      "Is it really?"
    ]
  }
}

puts bot_data.to_yaml
file = File.new(ARGV.first || "bot_data","w")
file.puts bot_data.to_yaml
file.close
