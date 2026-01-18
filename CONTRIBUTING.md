# Contributing to SQL Lab Manual

Thank you for considering contributing to this project! This document provides guidelines and steps for contributing.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Contribution Guidelines](#contribution-guidelines)
- [Style Guide](#style-guide)
- [Commit Messages](#commit-messages)
- [Pull Request Process](#pull-request-process)

## 🤝 Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Focus on what is best for the community
- Show empathy towards other contributors

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have:

- [Git](https://git-scm.com/downloads) installed
- [Typst](https://typst.app/docs/installation/) installed (for local compilation)
- A GitHub account
- Basic knowledge of SQL and Typst/Markdown syntax

### Fork and Clone

1. **Fork the repository** by clicking the "Fork" button on GitHub

2. **Clone your fork** to your local machine:
   ```bash
   git clone https://github.com/YOUR_USERNAME/REPO_NAME.git
   cd REPO_NAME
   ```

3. **Add the upstream remote** (original repository):
   ```bash
   git remote add upstream https://github.com/ORIGINAL_OWNER/REPO_NAME.git
   ```

4. **Verify remotes**:
   ```bash
   git remote -v
   # Should show both origin (your fork) and upstream (original repo)
   ```

## 🔄 Development Workflow

### 1. Create a Feature Branch

**IMPORTANT**: Never work directly on the `master` branch!

```bash
# Ensure you're on master and it's up to date
git checkout master
git pull upstream master

# Create a new branch for your feature
git checkout -b feature/your-feature-name
```

### Branch Naming Convention

Use descriptive branch names with prefixes:

| Prefix | Use Case | Example |
|--------|----------|---------|
| `feature/` | New features or additions | `feature/add-triggers-lab` |
| `fix/` | Bug fixes | `fix/query-syntax-error` |
| `docs/` | Documentation updates | `docs/update-installation` |
| `refactor/` | Code restructuring | `refactor/table-formatting` |
| `style/` | Formatting changes | `style/improve-spacing` |

### 2. Make Your Changes



- Edit `sql.typ`
- Follow existing formatting conventions
- Use Typst tables for outputs
- Keep consistent heading levels

### 3. Test Locally

Before committing, compile the document to ensure no errors:

```bash
typst compile sql.typ
```

Check that:
- ✅ Document compiles without errors
- ✅ All tables are properly formatted
- ✅ SQL syntax highlighting works
- ✅ No formatting issues in the PDF

### 4. Commit Your Changes

Stage your changes:
```bash
git add sql.typ 
```

Commit with a clear message:
```bash
git commit -m "Add: Lab session on stored procedures"
```

### 5. Push to Your Fork

```bash
git push origin feature/your-feature-name
```

### 6. Create a Pull Request

1. Go to your fork on GitHub
2. Click "Compare & pull request"
3. **Base branch**: `master` (in the original repository)
4. **Compare branch**: `feature/your-feature-name` (in your fork)
5. Fill out the PR template:
   - Clear title
   - Description of changes
   - Related issues (if any)
6. Submit the pull request

## 📝 Contribution Guidelines

### What to Contribute

#### ✅ Good Contributions

- Fix typos or grammatical errors
- Correct SQL syntax errors
- Add missing query outputs
- Improve table formatting
- Add new lab exercises with complete solutions
- Enhance documentation clarity
- Add helpful comments to complex queries
- Update outdated information

#### ❌ Avoid

- Incomplete lab exercises
- Untested SQL queries
- Breaking existing formatting
- Removing attribution or credits
- Large binary files
- Auto-generated content without review


```

#### Typst Formatting

- Use consistent heading levels (`=`, `==`, `===`)
- Format code blocks with proper language tags
- Use `#table()` for all output tables
- Keep consistent spacing between sections

**Example:**
```typst
*Question 1: Display all employees*
```sql
SELECT * FROM employee;
```

*Output:*

#table(
  columns: 3,
  stroke: 0.5pt,
  [*id*], [*name*], [*salary*],
  [1], [Alice], [50000],
  [2], [Bob], [60000]
)
```

## 💬 Commit Messages

Follow this format:

```
Type: Brief description (50 chars or less)

More detailed explanation if needed (wrap at 72 chars).
Explain what and why, not how.

Fixes #issue_number (if applicable)
```

### Commit Types

- `Add:` New features or content
- `Fix:` Bug fixes
- `Update:` Updates to existing content
- `Remove:` Removing content
- `Refactor:` Restructuring without changing functionality
- `Docs:` Documentation changes
- `Style:` Formatting changes

### Examples

✅ **Good:**
```
Fix: Correct syntax error in subquery example

The subquery in Lab 13, Question 3 was missing a closing
parenthesis, causing a compilation error.

Fixes #23
```

✅ **Good:**
```
Add: New lab session on database triggers

- Created table structures for trigger examples
- Added 5 practical trigger queries
- Included expected outputs in table format
```

❌ **Bad:**
```
fixed stuff
```

❌ **Bad:**
```
Updated files and changed some things
```

## 🔍 Pull Request Process

### PR Checklist

Before submitting, ensure:

- [ ] Document compiles without errors (`typst compile sql_lab_manual.typ`)
- [ ] All SQL queries have been tested
- [ ] Changes follow the existing style guide
- [ ] Commit messages are clear and descriptive
- [ ] PR targets the `master` branch
- [ ] PR description explains what and why
- [ ] No merge conflicts with master

### PR Description Template

```markdown
## Description
Brief description of changes made.

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Code refactoring

## Testing
How were these changes tested?

## Related Issues
Fixes #(issue number)

## Screenshots (if applicable)
Add screenshots of the compiled PDF if relevant.
```

### After Your PR is Merged

1. **Sync your fork**:
   ```bash
   git checkout master
   git pull upstream master
   git push origin master
   ```

2. **Delete your feature branch**:
   ```bash
   git branch -d feature/your-feature-name
   git push origin --delete feature/your-feature-name
   ```

## 🎨 Style Guide

### Typst Formatting

- Heading level 1: Lab sessions (`= Lab Session`)
- Heading level 2: Subsections (`== Lab Manual Question 1`)
- Heading level 3: Parts (`=== Table Creation`)
- Use `*bold*` for question labels
- Use code blocks with `sql` language tag

### Table Formatting

Always use Typst's native table syntax:

```typst
#table(
  columns: 3,
  stroke: 0.5pt,
  [*Header1*], [*Header2*], [*Header3*],
  [Data1], [Data2], [Data3]
)
```

### SQL Comments

Include comments as shown in the original file:

```sql
-- Question 1: Description of what the query does
SELECT ...
```



