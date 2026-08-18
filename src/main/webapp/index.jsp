<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Home | DevOps Portal</title>
    <!-- Fonts & Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --bg-dark: #0f172a;
            --surface: #1e293b;
            --surface-card: rgba(30, 41, 59, 0.7);
            --border: #334155;
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
            --success: #10b981;
            --warning: #f59e0b;
            --info: #06b6d4;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: var(--bg-dark);
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-image: 
                radial-gradient(at 0% 0%, rgba(79, 70, 229, 0.15) 0px, transparent 50%),
                radial-gradient(at 100% 100%, rgba(6, 182, 212, 0.1) 0px, transparent 50%);
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.25rem 2.5rem;
            border-bottom: 1px solid var(--border);
            backdrop-filter: blur(12px);
            background: rgba(15, 23, 42, 0.8);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-weight: 700;
            font-size: 1.25rem;
            color: var(--text-main);
            text-decoration: none;
        }

        .brand-icon {
            width: 36px;
            height: 36px;
            background: linear-gradient(135deg, var(--primary), var(--info));
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            list-style: none;
        }

        .nav-links a {
            color: var(--text-muted);
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .nav-links a:hover {
            color: var(--text-main);
        }

        .badge-status {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 600;
            background: rgba(16, 185, 129, 0.1);
            color: var(--success);
            border: 1px solid rgba(16, 185, 129, 0.2);
        }

        .badge-status::before {
            content: '';
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background-color: var(--success);
            box-shadow: 0 0 8px var(--success);
        }

        /* Main Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 3rem 1.5rem;
            flex: 1;
        }

        /* Hero Section */
        .hero {
            text-align: center;
            margin-bottom: 3.5rem;
        }

        .hero h1 {
            font-size: 2.75rem;
            font-weight: 800;
            line-height: 1.2;
            margin-bottom: 1rem;
            background: linear-gradient(to right, #f8fafc, #94a3b8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero p {
            color: var(--text-muted);
            font-size: 1.1rem;
            max-width: 600px;
            margin: 0 auto 1.75rem auto;
            line-height: 1.6;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            text-decoration: none;
            transition: all 0.2s ease;
            cursor: pointer;
            border: none;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
            box-shadow: 0 4px 14px rgba(79, 70, 229, 0.4);
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
        }

        /* Dashboard Grid */
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3rem;
        }

        .card {
            background: var(--surface-card);
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 1.5rem;
            backdrop-filter: blur(8px);
            transition: transform 0.2s ease, border-color 0.2s ease;
        }

        .card:hover {
            transform: translateY(-3px);
            border-color: rgba(79, 70, 229, 0.4);
        }

        .card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1rem;
        }

        .card-icon {
            width: 42px;
            height: 42px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
        }

        .icon-blue { background: rgba(79, 70, 229, 0.15); color: #818cf8; }
        .icon-cyan { background: rgba(6, 182, 212, 0.15); color: #22d3ee; }
        .icon-amber { background: rgba(245, 158, 11, 0.15); color: #fbbf24; }
        .icon-green { background: rgba(16, 185, 129, 0.15); color: #34d399; }

        .card-title {
            font-size: 0.9rem;
            color: var(--text-muted);
            font-weight: 500;
            margin-bottom: 0.25rem;
        }

        .card-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-main);
        }

        .card-footer {
            margin-top: 1rem;
            padding-top: 0.75rem;
            border-top: 1px solid rgba(51, 65, 85, 0.5);
            font-size: 0.8rem;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 0.35rem;
        }

        /* Build Info Section */
        .info-panel {
            background: var(--surface-card);
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 1.5rem;
        }

        .info-panel h3 {
            font-size: 1.1rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .info-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.9rem;
        }

        .info-table th, .info-table td {
            padding: 0.75rem 1rem;
            text-align: left;
            border-bottom: 1px solid var(--border);
        }

        .info-table th {
            color: var(--text-muted);
            font-weight: 500;
        }

        .info-table tr:last-child td {
            border-bottom: none;
        }

        .code-pill {
            background: rgba(0, 0, 0, 0.3);
            padding: 0.2rem 0.5rem;
            border-radius: 4px;
            font-family: monospace;
            color: #38bdf8;
            font-size: 0.85rem;
        }

        /* Footer */
        footer {
            border-top: 1px solid var(--border);
            padding: 1.5rem 0;
            text-align: center;
            color: var(--text-muted);
            font-size: 0.85rem;
        }
    </style>
</head>
<body>

    <!-- Header Navigation -->
    <nav class="navbar">
        <a href="#" class="brand">
            <div class="brand-icon">
                <i class="fa-solid fa-cube"></i>
            </div>
            <span>Java Home Application</span>
        </a>
        <ul class="nav-links">
            <li><span class="badge-status">Online & Healthy</span></li>
            <li><a href="#"><i class="fa-brands fa-docker"></i> Container</a></li>
            <li><a href="#"><i class="fa-solid fa-code-branch"></i> v8.8.3</a></li>
        </ul>
    </nav>

    <!-- Main Content Area -->
    <main class="container">
        <!-- Hero Section -->
        <section class="hero">
            <h1>Continuous Deployment Portal</h1>
            <p>Your Java Web Application build completed successfully and is serving live traffic from the Tomcat servlet container.</p>
            <a href="#build-info" class="btn btn-primary">
                <i class="fa-solid fa-circle-info"></i> View Build Metadata
            </a>
        </section>

        <!-- Metric Cards -->
        <section class="grid">
            <div class="card">
                <div class="card-header">
                    <span class="card-title">Artifact ID</span>
                    <div class="card-icon icon-blue"><i class="fa-solid fa-box"></i></div>
                </div>
                <div class="card-value">myweb</div>
                <div class="card-footer">
                    <i class="fa-solid fa-tag"></i> Group: in.javahome
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <span class="card-title">Release Version</span>
                    <div class="card-icon icon-cyan"><i class="fa-solid fa-code-merge"></i></div>
                </div>
                <div class="card-value">8.8.3</div>
                <div class="card-footer">
                    <i class="fa-solid fa-layer-group"></i> Packaging: WAR
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <span class="card-title">Runtime Environment</span>
                    <div class="card-icon icon-amber"><i class="fa-brands fa-java"></i></div>
                </div>
                <div class="card-value">Java 8</div>
                <div class="card-footer">
                    <i class="fa-solid fa-gear"></i> Target Release: 8
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <span class="card-title">Code Quality</span>
                    <div class="card-icon icon-green"><i class="fa-solid fa-shield-halved"></i></div>
                </div>
                <div class="card-value">SonarQube</div>
                <div class="card-footer">
                    <i class="fa-solid fa-circle-check"></i> Quality Gate Configured
                </div>
            </div>
        </section>

        <!-- Environment / Build Details -->
        <section class="info-panel" id="build-info">
            <h3><i class="fa-solid fa-server"></i> Deployment & Pipeline Target</h3>
            <table class="info-table">
                <tbody>
                    <tr>
                        <th>Docker Image Prefix</th>
                        <td><span class="code-pill">kammana</span></td>
                    </tr>
                    <tr>
                        <th>Artifact Repository</th>
                        <td>Azure DevOps Maven Feed (<span class="code-pill">flm-feed</span>)</td>
                    </tr>
                    <tr>
                        <th>Snapshot Repository</th>
                        <td>Nexus OSS (<span class="code-pill">nexusRepo</span>)</td>
                    </tr>
                    <tr>
                        <th>Source Encoding</th>
                        <td><span class="code-pill">UTF-8</span></td>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        &copy; <%= java.time.Year.now() %> Java Home Technologies. Automated build managed by Apache Maven.
    </footer>

</body>
</html>
