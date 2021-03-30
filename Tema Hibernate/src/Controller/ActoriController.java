package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Teatre;
import pojo.Actori;
import DAOlmpl.ActoriDaolmpl;
import DAOlmpl.HibernateUtil;
import org.hibernate.Session;


public class ActoriController extends HttpServlet {

	Actori actor = new Actori();
	ActoriDaolmpl actorDaolmpl = new ActoriDaolmpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaActor") != null) {
			// preluarea parametrilor de interes
			Integer idteatru = java.lang.Integer.parseInt(request.getParameter("idteatru"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Teatre teatru = (Teatre) session.get(Teatre.class, idteatru);

			String nume = request.getParameter("nume");
			String prenume = request.getParameter("prenume");
			Integer salariu = Integer.parseInt(request.getParameter("salariu"));

			actor.setTeatre(teatru);
			actor.setNume(nume);
			actor.setPrenume(prenume);
			actor.setSalariu(salariu);

			actorDaolmpl.adaugaActori(actor);
			RequestDispatcher rd = request.getRequestDispatcher("add_Actor.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaActori") != null) {
			List<Actori> listaActori = new ArrayList();
			listaActori = actorDaolmpl.afiseazaActori();
			request.setAttribute("listaActori", listaActori);
			RequestDispatcher rd = request.getRequestDispatcher("Actori.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaActor") != null) {
			Integer id1 = Integer.parseInt(request.getParameter("idactor"));
			// preluarea parametrilor de interes
			Integer idteatru = java.lang.Integer.parseInt(request.getParameter("idteatru"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Teatre teatru = (Teatre) session.get(Teatre.class, idteatru);	

			String nume = request.getParameter("nume");
			String prenume = request.getParameter("prenume");
			Integer salariu = Integer.parseInt(request.getParameter("salariu"));

			actorDaolmpl.modificaActori(id1, teatru, nume, prenume, salariu);
			RequestDispatcher rd = request.getRequestDispatcher("add_Actor.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeActor") != null) {
			Integer id2 = Integer.parseInt(request.getParameter("idactor"));
			actor.setIdactor(id2);
			actorDaolmpl.stergeActor(actor);
			RequestDispatcher rd = request.getRequestDispatcher("add_Actor.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}


