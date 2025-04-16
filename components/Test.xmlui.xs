function fetchGitHubIssues() {
  console.log('fetch');
  const repo = 'facebook/react';
  const perPage = 3;
  const pages = 3;
  let issuesList = [];


  try {
    // Fetch data from all pages
    for (let page = 1; page <= pages; page++) {
      const response = await fetch(
        `https://api.github.com/repos/${repo}/issues?per_page=${perPage}&page=${page}`
      );

      if (!response.ok) {
        throw new Error(`GitHub API request failed: ${response.status}`);
      }

      const issues = await response.json();

      // Map each issue to "number: title" format and add to the list
      const pageIssues = issues.map(issue => {
        return {
          [`${issue.number}`]: issue.title
        };
      });

      // Add this page's issues to our main list
      issuesList = issuesList.concat(pageIssues);

      // Optional: Add a small delay to avoid hitting rate limits
      if (page < pages) {
        await new Promise(resolve => setTimeout(resolve, 1000));
      }
    }

    return issuesList;
  } catch (error) {
    console.error('Error fetching GitHub issues:', error);
    return [];
  }
}

// Usage
fetchGitHubIssues().then(issues => {
  console.log('Issues by number:', issues);
});