import { css } from "../../../../styled-system/css";
import { ButtonShowcase } from "../_components/button-showcase";

export function HeroSection() {
	return (
		<section className={css({ p: "8" })}>
			<h1 className={css({ fontSize: "2xl", fontWeight: "bold", mb: "4" })}>
				Hello, Next.js!
			</h1>
			<ButtonShowcase />
		</section>
	);
}
