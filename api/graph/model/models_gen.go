// Code generated by github.com/99designs/gqlgen, DO NOT EDIT.

package model

type Project struct {
	ID          string   `json:"id"`
	Name        string   `json:"name"`
	Slug        string   `json:"slug"`
	Description string   `json:"description"`
	GithubName  string   `json:"githubName"`
	GithubLink  string   `json:"githubLink"`
	Skills      []*Skill `json:"skills"`
	DevpostLink *string  `json:"devpostLink"`
	ProjectLink *string  `json:"projectLink"`
	CreatedAt   string   `json:"createdAt"`
	UpdatedAt   string   `json:"updatedAt"`
	Image       *string  `json:"image"`
	Featured    bool     `json:"featured"`
}

type Skill struct {
	Name  string `json:"name"`
	Image string `json:"image"`
}
