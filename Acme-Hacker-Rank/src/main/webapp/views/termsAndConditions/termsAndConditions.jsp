<%--
 * action-1.jsp
 *
 * Copyright (C) 2019 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<div><b>CONDICIONES DE SERVICIO DE ACME-HACKER-RANK</b><br>
Fecha de entrada en vigor: 21 de Marzo de 2019<br>
Te damos la bienvenida a ACME-HACKER-RANK<br>
Hacer saber al p�blico que el nombre de la compa��a que ofrece el servicio es ACME-HACKER-RANK y el nombre del servicio es ACME-PARADE.<br>
Si en alg�n momento el usuario quisiera darse de baja en el sistema de informaci�n, deber� mandar un correo a la direcci�n <strong>cristian@hotmail.com</strong> para hacer saber que quiere que se le de de baja en el sistema.<br>
Te agradecemos que uses los productos y los servicios de ACME-HACKER-RANK (en adelante, los "Servicios").<br>
El uso de nuestros Servicios implica la aceptaci�n de estas condiciones. Te recomendamos que las leas detenidamente.<br>

Uso de nuestros Servicios<br>
Debes seguir las pol�ticas disponibles a trav�s de los Servicios.<br><br>

No debes usar nuestros Servicios de forma inadecuada. Por ejemplo, no debes interferir con dichos Servicios ni intentar acceder a ellos usando un m�todo distinto a la interfaz y a las instrucciones proporcionadas por Google. Solo podr�s usar los Servicios en la medida en que la ley lo permita, incluidas las leyes y las normativas de control de las exportaciones y de las reexportaciones que est�n en vigor. Podemos suspender o cancelar nuestros Servicios si no cumples con nuestras pol�ticas o condiciones o si consideramos que tu conducta puede ser malintencionada.
<br><br>
El uso de nuestros Servicios no te convierte en titular de ninguno de los derechos de propiedad intelectual de los mismos ni del contenido al que accedas. Solo podr�s usar el contenido de nuestros Servicios si te autoriza su titular o si est� permitido por la ley. Estas condiciones no te otorgan el derecho a usar las marcas ni los logotipos utilizados en nuestros Servicios. No elimines, ocultes ni alteres los avisos legales que se muestren en nuestros Servicios.
<br><br>
En relaci�n con el uso de los Servicios, podemos enviarte avisos de servicio, mensajes administrativo y otro tipo de informaci�n.
<br><br>
Algunos de nuestros Servicios est�n disponibles en dispositivos m�viles. No utilices esos Servicios de un modo que pueda distraerte y que te impida cumplir las leyes de tr�fico o de seguridad.
<br><br>
Tu cuenta de ACME-HACKER-RANK<br>
Es posible que necesites una cuenta de ACME-HACKER-RANK para utilizar algunos de nuestros Servicios. Puedes crear tu propia cuenta de ACME-HACKER-RANK.
<br><br>
Para proteger tu cuenta de ACME-HACKER-RANK, mant�n la confidencialidad de tu contrase�a. Eres responsable de la actividad que se desarrolle en tu cuenta de ACME-HACKER-RANK o a trav�s de ella. Intenta no reutilizar la contrase�a de tu cuenta de ACME-HACKER-RANK en aplicaciones de terceros. Si detectas un uso no autorizado de tu cuenta de ACME-HACKER-RANK o de tu contrase�a, sigue estas instrucciones.
<br><br>
Protecci�n de la privacidad y de los derechos de autor<br>
En nuestras Pol�ticas de Privacidad se explica c�mo utilizamos tus datos personales y protegemos tu privacidad cuando usas nuestros Servicios.
<br><br>
Respondemos a las notificaciones de presuntas infracciones de los derechos de autor y cancelamos las cuentas de los usuarios que cometen infracciones reiteradas de acuerdo con el proceso establecido en la ley estadounidense de protecci�n de los derechos de autor (Digital Millenium Copyright Act, DMCA).
<br><br>
Tu contenido en nuestros Servicios<br>
Algunos de nuestros Servicios te permiten subir, enviar, almacenar o recibir contenido. Si lo haces, seguir�s siendo el titular de los derechos de propiedad intelectual que tengas sobre ese contenido. En pocas palabras, lo que te pertenece, tuyo es.
<br><br>
Al subir, almacenar o recibir contenido o al enviarlo a nuestros Servicios o a trav�s de ellos, concedes a ACME-HACKER-RANK (y a sus colaboradores) una licencia mundial para usar, alojar, almacenar, reproducir, modificar, crear obras derivadas (por ejemplo, las que resulten de la traducci�n, la adaptaci�n u otros cambios que realicemos para que tu contenido se adapte mejor a nuestros Servicios), comunicar, publicar, ejecutar o mostrar p�blicamente y distribuir dicho contenido. ACME-HACKER-RANK usar� los derechos que le confiere esta licencia �nicamente con el fin de proporcionar, promocionar y mejorar los Servicios y de desarrollar servicios nuevos. Esta licencia seguir� vigente incluso cuando dejes de usar nuestros Servicios. Algunos Servicios te permiten acceder al contenido que hayas proporcionado y eliminarlo. Adem�s, en algunos de nuestros Servicios se incluyen condiciones o ajustes que limitan nuestro uso del contenido que se haya enviado a los mismos. Aseg�rate de tener los derechos necesarios para concedernos esta licencia sobre cualquier contenido que env�es a nuestros Servicios.
<br><br>
Si tienes una cuenta de ACME-HACKER-RANK, podemos mostrar tu nombre de perfil, la foto del perfil y las acciones que realices en ACME-HACKER-RANK.
<br><br>
Acerca del software de nuestros Servicios<br>
Si un Servicio requiere o incluye software que se puede descargar, este software podr� actualizarse autom�ticamente en tu dispositivo siempre que haya versiones o funciones nuevas disponibles. Algunos Servicios pueden permitir que definas los ajustes de actualizaci�n autom�tica.
<br><br>
ACME-HACKER-RANK te concede una licencia personal mundial, libre de royalties, intransmisible y no exclusiva para usar el software que se te proporcione como parte de los Servicios. El �nico prop�sito de esta licencia es permitirte usar los Servicios que ofrece ACME-HACKER-RANK y beneficiarte de ellos, seg�n lo estipulado en estas condiciones. No podr�s copiar, modificar, distribuir, vender ni prestar ninguna parte de nuestros Servicios ni del software incluido ni podr�s aplicar t�cnicas de ingenier�a inversa ni intentar extraer el c�digo fuente de dicho software, salvo si la legislaci�n proh�be dichas restricciones o si tienes consentimiento de ACME-HACKER-RANK por escrito.
<br><br>
ACME-HACKER-RANK otorga gran importancia al software de c�digo abierto. Parte del software que usan nuestros Servicios se ofrece con una licencia de software de c�digo abierto que pondremos a tu disposici�n. Puede que algunas de las disposiciones establecidas en la licencia de software de c�digo abierto anulen expresamente algunas de estas condiciones.
<br><br>
C�mo modificar y cancelar nuestros Servicios<br>
ACME-HACKER-RANK cambia y mejora sus Servicios constantemente. Por ello, es posible que a�adamos o eliminemos algunas funciones o caracter�sticas, o que suspendamos o cancelemos un Servicio por completo.
<br><br>
Puedes dejar de usar los Servicios en cualquier momento, aunque lamentar�amos que as� fuera.
<br><br>
Consideramos que eres el propietario de tus datos y que es importante preservar tu acceso a los mismos. Si interrumpimos un Servicio, en los casos en los que sea razonable, te informaremos con suficiente antelaci�n y te permitiremos extraer la informaci�n del Servicio.
<br><br>
Nuestras garant�as y renuncias de responsabilidad<br>
ACME-HACKER-RANK ofrece sus Servicios con un nivel de competencia y diligencia razonable desde el punto de vista comercial, y esperamos que disfrutes al usarlos. No obstante no podemos ofrecer garant�as en relaci�n con algunos aspectos de nuestros Servicios.
<br><br>
Responsabilidad por nuestros Servicios<br>
En los casos permitidos por la ley, ni ACME-HACKER-RANK ni sus proveedores o distribuidores ser�n responsables por la p�rdida de beneficios, ingresos, datos, p�rdidas financieras ni por da�os indirectos, especiales, derivados, ejemplares o punitivos.
<br><br>
En la medida en que la ley lo permita, la responsabilidad total de ACME-HACKER-RANK, as� como la de sus proveedores y distribuidores, por cualquier reclamaci�n realizada bajo estas condiciones, incluida por cualquier garant�a impl�cita, se limita al importe que hayas pagado por usar los Servicios (o, si ACME-HACKER-RANK as� lo decide, a la reanudaci�n de los Servicios).
<br><br>
En ning�n caso, ni ACME-HACKER-RANK ni sus proveedores y distribuidores ser�n responsables por cualquier p�rdida o da�o que no sean previsibles de forma razonable.
<br><br>
ACME-HACKER-RANK reconoce que puedes tener derechos legales como consumidor en algunos pa�ses. Si usas los Servicios con fines personales, ninguna de las disposiciones establecidas en estas condiciones ni en ninguna de las condiciones adicionales limitar� los derechos legales del consumidor a los que no se puede renunciar de forma contractual.
<br><br>
Uso de nuestros Servicios por parte de empresas<br>
Si usas los Servicios en nombre de una empresa, la empresa acepta estas condiciones. Se eximir� de responsabilidad a ACME-HACKER-RANK y a sus filiales, directivos, agentes y empleados por las reclamaciones, demandas o acciones legales que se puedan derivar del uso de los Servicios o de la infracci�n de estas condiciones o que est�n relacionados con los mismos, incluidos cualesquiera responsabilidad o gasto que se deriven de las reclamaciones, p�rdidas, da�os, demandas, juicios, costes procesales y honorarios de abogados.
<br><br>
Acerca de estas condiciones<br>
ACME-HACKER-RANK puede modificar estas condiciones o las condiciones adicionales que se apliquen a un Servicio para, por ejemplo, reflejar cambios legislativos o en los Servicios. Te recomendamos que consultes las condiciones de forma peri�dica. ACME-HACKER-RANK publicar� avisos relacionados con las modificaciones de estas condiciones en esta p�gina. Asimismo, publicar� avisos relacionados con las modificaciones que se hagan en las condiciones adicionales del Servicio correspondiente. Las modificaciones no se aplicar�n con car�cter retroactivo y entrar�n en vigor en un plazo no inferior a 14 d�as a partir de la fecha de su publicaci�n. No obstante, las modificaciones que afecten a nuevas funciones de un Servicio o los cambios que se hagan por cuestiones legales entrar�n en vigor de forma inmediata. Si no aceptas las condiciones modificadas de un Servicio, deber�s dejar de usar dicho Servicio.
<br><br>
En caso de conflicto entre estas condiciones y las condiciones adicionales, estas condiciones prevalecer�n sobre las condiciones adicionales.
<br><br>
Estas condiciones rigen la relaci�n entre ACME-HACKER-RANK y t�, y no generan ning�n derecho del que pueda ser beneficiario un tercero.
<br><br>
Si no cumples estas condiciones y ACME-HACKER-RANK no toma ninguna medida al respecto de forma inmediata, no se entender� que ACME-HACKER-RANK renuncia a los derechos de los que pueda disponer (como, por ejemplo, llevar a cabo acciones en el futuro).
<br><br>
En el caso de que una condici�n determinada no sea de obligado cumplimiento, el resto de condiciones no se ver�n afectadas.
<br><br>
Para obtener m�s informaci�n sobre c�mo ponerte en contacto con ACME-HACKER-RANK a trav�s de correo: crilorbre@alumn.us.es
<br><br>
<b>ATENCI�N</b>: El contenido de esta p�gina ha sido extra�do de las condiciones de Google y al cual se le han realizado algunas modificaciones para adaptarlos a nuestras pol�ticas
con lo que no somos los propietarios de la redacci�n de estas condiciones. El autor de gran parte del texto anterior es Google.</div>