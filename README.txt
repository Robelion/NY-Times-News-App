App: New York Times News App
Description: Through this app you can search NYT news articles and get quick snippets and insights. If you what to read more our app also directs you to the article directly.
API: https://api.nytimes.com/svc/search/v2/articlesearch.json?fl=lead_paragraph,abstract,web_url,pub_date,snippet&api-key=KDdAFMsfbkyfva1CXTBZH99uujpRZWee
Search functionality:  I implemented the search functionality by checking if the “abstract” field contains the user input in the search bar.
Requirements:
1) Through a network manager I was able to access NYT articles from the provided url.
2) I implemented a UITableView to present the abstracts and published date of the articles to give the user a quick glance of its content. (First article has no abstract so only published date is shown)
3) (Stated above)
4) If the user selects any article abstract, a new UIViewController will be pushed on to the stack. In the detail view the user is able to discover the date the article was published (pub_date), a snippet of the contents of the article (snippet), a quick insight of the article (lead_paragraph), the abstract (abstract), and a link to the article if the user wants to read more.
