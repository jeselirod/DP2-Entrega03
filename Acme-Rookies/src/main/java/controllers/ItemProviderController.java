
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		final ModelAndView result;
		final Item item = this.itemService.findOne(itemId);

		result = new ModelAndView("item/show");
		result.addObject("item", item);
		return result;

	}

	//	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	//	public ModelAndView edit() {
	//		final ModelAndView result;
	//		final Finder finder = this.finderService.findOne();
	//
	//		result = new ModelAndView("finder/edit");
	//		result.addObject("finder", finder);
	//		return result;
	//
	//	}
	//
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
