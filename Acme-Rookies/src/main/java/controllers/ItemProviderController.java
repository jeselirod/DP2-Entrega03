
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ItemService;
import domain.Item;

@Controller
@RequestMapping("/item/provider")
public class ItemProviderController extends AbstractController {

	@Autowired
	private ItemService	itemService;


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		final ModelAndView result;
		final Collection<Item> items = this.itemService.itemsByProvider();

		result = new ModelAndView("item/list");
		result.addObject("items", items);
		return result;

	}

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public ModelAndView show(@RequestParam final Integer itemId) {
		ModelAndView result;
		try {
			final Item item = this.itemService.findOne(itemId);
			result = new ModelAndView("item/show");
			result.addObject("item", item);
		} catch (final Exception e) {
			result = new ModelAndView("redirect:list.do");
		}
		return result;

	}
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int itemId) {
		ModelAndView result;
		try {
			Item item;
			if (itemId == 0)
				item = this.itemService.create();
			else {
				item = this.itemService.findOne(itemId);
				Assert.isTrue(this.itemService.itemsByProvider().contains(item));
			}
			result = new ModelAndView("item/edit");
			result.addObject("item", item);
		} catch (final Exception e) {
			result = new ModelAndView("redirect:list.do");
		}
		return result;
	}

	//	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	//	public ModelAndView edit(final Finder f, final BindingResult binding) {
	//		final ModelAndView result;
	//		final Finder finder;
	//
	//		finder = this.finderService.reconstruct(f, binding);
	//
	//		if (!binding.hasErrors()) {
	//			this.finderService.save(finder);
	//			result = new ModelAndView("redirect:show.do");
	//		} else {
	//			result = new ModelAndView("finder/edit");
	//			result.addObject("finder", finder);
	//		}
	//
	//		return result;
	//
	//	}

}
