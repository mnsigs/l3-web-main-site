# l3-web-main-site

> [!IMPORTANT]
> **This repository is archived and no longer deployed.**
>
> The Greater Minnesota Alumni Chapter website has been rebuilt as a static
> [Astro](https://astro.build) site and now lives at **https://mnsigs.com**.
>
> - **Live site:** https://mnsigs.com
> - **Current source:** https://github.com/tjsullivan1/mnsigs
>
> The Azure App Service that hosted this ASP.NET Core app has been decommissioned.
> This repository is kept read-only for historical reference only.

## What this was

An ASP.NET Core 6 Razor Pages site for the Sigma Chi Greater Minnesota Alumni Chapter,
deployed as a Linux container to Azure App Service (B1) via `.github/workflows/dotnet.yml`,
with infrastructure defined in Terraform under `infra/`.

Its page content (home, about, officers, gallery, bylaws, contact, privacy) was ported to the
new site. The chapter bylaws were carried over in full, with all section anchor links preserved.