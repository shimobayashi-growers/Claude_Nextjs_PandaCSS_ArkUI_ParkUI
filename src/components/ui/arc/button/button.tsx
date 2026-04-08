import { type ButtonHTMLAttributes, forwardRef } from "react";
import { type ButtonVariantProps, buttonRecipe } from "./button-recipe";

export type ButtonProps = ButtonHTMLAttributes<HTMLButtonElement> &
	ButtonVariantProps;

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
	({ variant, size, className, ...props }, ref) => {
		const classes = buttonRecipe({ variant, size });
		return <button ref={ref} className={classes} {...props} />;
	},
);

Button.displayName = "Button";
