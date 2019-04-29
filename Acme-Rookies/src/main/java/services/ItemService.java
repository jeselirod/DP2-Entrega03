
package services;

import java.util.Collection;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.ItemRepository;
import security.LoginService;
import domain.Item;

@Service
@Transactional
public class ItemService {

	@Autowired
	private ItemRepository	itemRepository;

	@Autowired
	private Validator		validator;


	public Item create() {
		final Item res = new Item();
		res.setDescription("");
		res.setLink("");
		res.setName("");
		res.setPictures(new HashSet<String>());
		res.setProvider(null);
		return res;
	}

	public Collection<Item> findAll() {
		return this.itemRepository.findAll();
	}

	public Item findOne(final int id) {
		return this.itemRepository.findOne(id);
	}

	public Item save(final Item i) {
		final Item saved = null; //quitar null
		if (i.getId() == 0) {

		} else {

		}
		return saved;
	}

	//RECONSTRUCT
	public Item reconstruct(final Item item, final BindingResult binding) {
		final Item res;

		final Item copy = new Item();
		copy.setId(item.getId());
		copy.setVersion(item.getVersion());

		this.validator.validate(copy, binding);
		return copy;

	}

	public Collection<Item> itemsByProvider() {
		return this.itemRepository.getItemsByProvider(this.providerUserAccountId());
	}
	private int providerUserAccountId() {
		return LoginService.getPrincipal().getId();
	}

}
