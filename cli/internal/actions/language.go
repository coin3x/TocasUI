package actions

import "github.com/AlecAivazis/survey"

func LanguageMain() {
	answer := ""
	prompt := &survey.Select{
		Message: "你所偏好的語言是？",
		Options: []string{
			"正體中文（台灣）",
			"簡體中文（中國）",
			"English (United States)",
			"返回",
		},
	}
	survey.AskOne(prompt, &answer, nil)

	switch answer {
	case "返回":
		Initialize()
	}
}
