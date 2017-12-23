alias PhoenixChatbot.Repo
# alias PhoenixChatbot.Survey
alias PhoenixChatbot.QuestionType
alias PhoenixChatbot.ResponseChoice

# survey = Repo.insert!(%Survey{version: 1})
# order1 = Ecto.build_assoc(survey, :orders, order: 1)
# order2 = Ecto.build_assoc(survey, :orders, order: 2)
# order3 = Ecto.build_assoc(survey, :orders, order: 3)
# Repo.insert!(order1)
# Repo.insert!(order2)
# Repo.insert!(order3)

basic = Repo.insert!(%QuestionType{name: "basic"})

question1 = Ecto.build_assoc(basic, :questions,
  order: 1,
  text: "Great. First, we’re curious what draws you to thinking bout interiors and furniture. Which of these things applies to you? Select all that apply.",
  response_choices: [
    %ResponseChoice{
        text: "Life transition"
    },
    %ResponseChoice{
        text: "I need a fresh start"
    },
    %ResponseChoice{
        text: "It's a hobby"
    },
    %ResponseChoice{
        text: "I just like learning"
    },
    %ResponseChoice{
        text: "Something else",
        open: true
    }
  ]
)


question2 = Ecto.build_assoc(basic, :questions,
  order: 2,
  text: "You marked life transition. These are always pretty stressful, and sometimes recreating your space to adapt can make things worse (but we’d like to change that. what are you dealing with?",
  response_choices: [
    %ResponseChoice{
        text: "Geographical change",
    },
    %ResponseChoice{
        text: "Moving in with a partner",
    },
    %ResponseChoice{
        text: "Bought a house",
    },
    %ResponseChoice{
        text: "Having a child",
    },
    %ResponseChoice{
        text: "Separation or divorce",
    },
    %ResponseChoice{
        text: "Downsizing a home",
    },
    %ResponseChoice{
        text: "Elderly relative moving in",
    },
    %ResponseChoice{
        text: "Something else",
        open: true
    }
  ]
)


question3 = Ecto.build_assoc(basic, :questions,
  order: 3,
  text: "You indicated that this was a hobby for you. Us too! What are some sources of inspiration for you? Check all that apply.",
  response_choices: [
    %ResponseChoice{
        text: "Magazines",
    },
    %ResponseChoice{
        text: "Social media feeds",
    },
    %ResponseChoice{
        text: "Friends",
    },
    %ResponseChoice{
        text: "Shopping",
    },
    %ResponseChoice{
        text: "Something else",
        open: true
    }
  ]
)

Repo.insert!(question1)
Repo.insert!(question2)
Repo.insert!(question3)
